package com.kh.gw.mail.controller;

import java.io.BufferedInputStream;


import java.io.ByteArrayOutputStream;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintStream;
import java.io.UnsupportedEncodingException;
import java.nio.ByteBuffer;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Part;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.model.S3ObjectSummary;
import com.amazonaws.services.simpleemail.AmazonSimpleEmailService;
import com.amazonaws.services.simpleemail.AmazonSimpleEmailServiceClientBuilder;
import com.amazonaws.services.simpleemail.model.Body;
import com.amazonaws.services.simpleemail.model.Content;
import com.amazonaws.services.simpleemail.model.Destination;
import com.amazonaws.services.simpleemail.model.RawMessage;
import com.amazonaws.services.simpleemail.model.SendEmailRequest;
import com.amazonaws.services.simpleemail.model.SendRawEmailRequest;
import com.kh.gw.approval.model.vo.AttachmentApp;
import com.kh.gw.approval.model.vo.BoxList;
import com.kh.gw.common.CommonsUtils;
import com.kh.gw.mail.aws.AwsS3;
import com.kh.gw.mail.model.service.MailService;
import com.kh.gw.mail.model.service.MailServiceImpl;
import com.kh.gw.mail.model.vo.AttachmentMail;
import com.kh.gw.mail.model.vo.Mail;
import com.kh.gw.mail.model.vo.PageInfo;
import com.kh.gw.mail.model.vo.Pagination;
import com.kh.gw.mail.model.vo.searchCondition;
import com.kh.gw.member.model.vo.LoginUser;
@Controller
public class mailController {
	@Autowired
	private MailService ms;
	@Autowired
	private AwsS3 s3;

	protected String receiving_attachments ="src/main/webapp/resources/uploadFiles/mail";

	//RequestMapping or 그냥 뷰는 GetMapping 메일작성뷰만 GetMapping
	//받은 메일함(메인)
	@RequestMapping(value="/main.ml")
	public String receiveMail(HttpServletRequest request,Model model) {

		String bucketName = "bucketgroupwhale";
		List<S3ObjectSummary> objects = s3.getObjects(bucketName);
		for(S3ObjectSummary object : objects) {
			String key = object.getKey();
			System.out.println("key  : " +  key);
			s3.downloadObject(bucketName, key);

			s3.deleteObject(object.getBucketName(), object.getKey());
		}
		int currentPage = 1;

		String empEmail = ((LoginUser)(request.getSession().getAttribute("loginUser"))).getEmpEmail();
		String empNo= ((LoginUser)(request.getSession().getAttribute("loginUser"))).getEmpNo();


		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		int listCount = ms.getReceiveListCount(empNo);

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		List<Mail> mailList = ms.selectReceiveMailList(pi,empEmail);
		System.out.println("mailList : " + mailList);

		model.addAttribute("list", mailList);
		model.addAttribute("pi", pi);

		//보낸 사람 이메일은 어떻게 확인하나??? 컬럼 추가해줘야 하나?


		return "mail/receiveMailList";
	}

	//보낸 메일함789-152-647
	@RequestMapping(value="/send.ml")
	public String sendMail(HttpServletRequest request,Model model) {
		int currentPage = 1;

		String empEmail = ((LoginUser)(request.getSession().getAttribute("loginUser"))).getEmpEmail();
		String empNo= ((LoginUser)(request.getSession().getAttribute("loginUser"))).getEmpNo();


		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		int listCount = ms.getSendListCount(empNo);

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		List<Mail> mailList = ms.selectSendMailList(pi,empEmail);
		System.out.println("mailList : " + mailList);

		model.addAttribute("list", mailList);
		model.addAttribute("pi", pi);

		return "mail/sendMailList";
	}

	//받은 메일함 상세
	@RequestMapping(value="/receiveDetail.ml")
	public ModelAndView receiveMailDetail(HttpServletRequest request,Model model) {
		int mailNo = Integer.parseInt(request.getParameter("mailNo"));
		System.out.println("mailNo : " + mailNo);
		ModelAndView mv = new ModelAndView("mail/receiveMailDetail");

		int result = ms.updateReadMail(mailNo);

		if(result > 0) {
			Map<String, Object> map = ms.selectOneReceiveMail(mailNo);
			mv.addObject("map", map.get("map"));
			mv.addObject("list", map.get("list"));

			System.out.println(map.get("map"));
			System.out.println(map.get("list"));
		}

		return mv;	
	}	

	//보낸 메일함 상세
	@RequestMapping(value="/sendDetail.ml")
	public ModelAndView sendMailDetail(HttpServletRequest request,Model model) {
		int mailNo = Integer.parseInt(request.getParameter("mailNo"));
		String receiver = request.getParameter("receiver");
		System.out.println("mailNo : " + mailNo);
		ModelAndView mv = new ModelAndView("mail/sendMailDetail");

		Map<String, Object> map = ms.selectOneSendMail(mailNo);
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		mv.addObject("receiver", receiver);

		System.out.println(map.get("map"));
		System.out.println(map.get("list"));


		return mv;
	}

	//메일 쓰기 폼
	@RequestMapping(value="/sendform.ml")
	public String sendMailForm() {
		return "mail/sendMailForm";
	}

	//메일 쓰기
	@RequestMapping("/sendMail.ml")
	public String sendMailComplete(Model model,Mail m, @RequestParam(value = "receiver")String[] receiver,HttpServletRequest request,@RequestParam(required=false) MultipartFile[] file) throws UnsupportedEncodingException, MessagingException {

		request.setCharacterEncoding("UTF-8");


		List<AttachmentMail> fileList = new ArrayList<AttachmentMail>();

		String root = request.getSession().getServletContext().getRealPath("resources");

		System.out.println("root : " + root);

		String filePath = root + "\\uploadFiles\\mail";


		//us-ascii로 전송이 되네
		System.out.println("m : " + m);
		System.out.println(file);
		String empNo = ((LoginUser)(request.getSession().getAttribute("loginUser"))).getEmpNo();
		String email = ((LoginUser)(request.getSession().getAttribute("loginUser"))).getEmpEmail();
		String name = ((LoginUser)(request.getSession().getAttribute("loginUser"))).getEmpName();

		m.setEmpNo(empNo);
		m.setFrom(email);

		String subject = m.getMailSubject();
		String content = m.getMailContent();

		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy/MM/dd HH:mm:ss");
		Date time = new Date();

		String time1 = format1.format(time);

		m.setMailEnrollDate(time1);

		if(receiver[0].contains("@groupwhale.com")) {
			
			System.out.println("나는 황인성입니다");
			for(int i = 0; i < receiver.length; i++) {
				m.setReceiver(receiver[i]);

				for(int j = 0; j < file.length; j++) {
					AttachmentMail attachment = new AttachmentMail();

					System.out.println("file.length : " + file.length);

					String originFileName = file[j].getOriginalFilename();//원본 파일 이름

					System.out.println("흠 이거 안 넣으면 뭐 나오지 : " + originFileName);

					if(!originFileName.equals("")) {//첨부파일이 있으면

						String ext = originFileName.substring(originFileName.lastIndexOf("."));//.png , .jpg 
						String changeName = CommonsUtils.getRandomString();
						System.out.println("첨부파일없을때 이거 나오면안돼!!!!!!!!!!!!!!!!");
						attachment.setOriginName(file[j].getOriginalFilename());
						attachment.setChangeName(changeName + ext);
						attachment.setEaSize(Long.toString(file[j].getSize()));
						attachment.setFilePath(filePath +"\\" + changeName + ext);
						
						System.out.println("1111111111111111111111111111111111111");
						System.out.println(attachment.getFilePath());

						try {
							file[j].transferTo(new File(attachment.getFilePath()));

							fileList.add(attachment);

						} catch (Exception e) {
							new File(filePath + "\\" + changeName + ext).delete();

						}

					}
				}

				int result2 = ms.insertReceiveMail(m, fileList);
				request.setAttribute("to", receiver);
				System.out.println("받는 사람 : " + i + "번째" + receiver[i]);
			}

			return "mail/sendMailComplete";
		}
		else {

			Session session = Session.getDefaultInstance(new Properties());
			// Create a new MimeMessage object.
			MimeMessage message = new MimeMessage(session);
			// Add subject, from and to lines.
			message.setSubject(subject, "UTF-8");
			message.setFrom(new InternetAddress(email));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(receiver[0]));
			// Create a multipart/alternative child container.
			MimeMultipart msg_body = new MimeMultipart("alternative");
			// Create a wrapper for the HTML and text parts.        
			MimeBodyPart wrap = new MimeBodyPart();
			// Define the text part.
			MimeBodyPart textPart = new MimeBodyPart();
			//textPart.setContent(BODY_TEXT, "text/plain; charset=UTF-8");
			textPart.setContent(content, "text/plain; charset=UTF-8"); 
			// Define the HTML part.
			MimeBodyPart htmlPart = new MimeBodyPart();
			htmlPart.setContent(content,"text/html; charset=UTF-8");
			// Add the text and HTML parts to the child container.
			//msg_body.addBodyPart(textPart);
			msg_body.addBodyPart(textPart);
			msg_body.addBodyPart(htmlPart);
			// Add the child container to the wrapper object.
			wrap.setContent(msg_body);

			////////////////////////////////////////////////////////////////////////////////////
			//Create a multipart/mixed parent container.
			//여기부분 첨부파일 있을때만 만들어줘야 하는데 부모 컨테이너라서 어떻게 해야할지 좀 생각해봐야 할듯 싶다!
			MimeMultipart msg = new MimeMultipart("mixed");
			// Add the parent container to the message.
			message.setContent(msg);
			// Add the multipart/alternative part to the message.
			msg.addBodyPart(wrap);

			for(int i = 0; i < receiver.length; i++) {
				m.setReceiver(receiver[i]);

				for(int j = 0; j < file.length; j++) {

					AttachmentMail attachment = new AttachmentMail();

					System.out.println("file.length : " + file.length);

					String originFileName = file[j].getOriginalFilename();//원본 파일 이름

					System.out.println("흠 이거 안 넣으면 뭐 나오지 : " + originFileName);

					if(!originFileName.equals("")) {//첨부파일이 있으면

						String ext = originFileName.substring(originFileName.lastIndexOf("."));//.png , .jpg 
						String changeName = CommonsUtils.getRandomString();
						System.out.println("첨부파일없을때 이거 나오면안돼!!!!!!!!!!!!!!!!");
						attachment.setOriginName(file[j].getOriginalFilename());
						attachment.setChangeName(changeName + ext);
						attachment.setEaSize(Long.toString(file[j].getSize()));
						attachment.setFilePath(filePath +"\\" + changeName + ext);

						try {
							file[j].transferTo(new File(attachment.getFilePath()));

							fileList.add(attachment);


							// Define the attachment
							MimeBodyPart att = new MimeBodyPart();
							//DataSource fds = new FileDataSource("C:\\Users\\chqdl\\downloads\\save.png");
							DataSource fds = new FileDataSource(filePath +"\\" + changeName + ext);
							System.out.println("이거 아니야? : " + filePath + "\\" + changeName + ext);
							att.setDataHandler(new DataHandler(fds));
							System.out.println("fds.getName()이거 뭔데? : " + fds.getName());

							att.setFileName(MimeUtility.encodeText(file[j].getOriginalFilename(),"UTF-8","B"));

							// Add the attachment to the message.
							msg.addBodyPart(att);
						} catch (Exception e) {
							new File(filePath + "\\" + changeName + ext).delete();

						}

					}
				}

				try {
					System.out.println("Attempting to send an email through Amazon SES "
							+"using the AWS SDK for Java...");


					//여기 추가했음
					BasicAWSCredentials awsCreds = new BasicAWSCredentials("#{AccessKey}", "#{SecretKey}");
					// Instantiate an Amazon SES client, which will make the service 
					// call with the supplied AWS credentials.
					AmazonSimpleEmailService client = 
							AmazonSimpleEmailServiceClientBuilder.standard()
							.withCredentials(new  AWSStaticCredentialsProvider(awsCreds))
							// Replace US_WEST_2 with the AWS Region you're using for
							// Amazon SES.
							.withRegion(Regions.US_EAST_1).build();

					// Print the raw email content on the console
					PrintStream out = System.out;
					message.writeTo(out);

					// Send the email.
					ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
					message.writeTo(outputStream);
					RawMessage rawMessage = 
							new RawMessage(ByteBuffer.wrap(outputStream.toByteArray()));

					SendRawEmailRequest rawEmailRequest = 
							new SendRawEmailRequest(rawMessage);
					/*.withConfigurationSetName(CONFIGURATION_SET);*/

					client.sendRawEmail(rawEmailRequest);
					System.out.println("Email sent!");
					// Display an error if something goes wrong.


				} catch (Exception ex) {
					System.out.println("Email Failed");
					System.err.println("Error message: " + ex.getMessage());
					ex.printStackTrace();
				}

				System.out.println("fileList : " + fileList);

				int result = ms.insertMail(m, fileList);

				request.setAttribute("to", receiver);
				System.out.println("받는 사람 : " + i + "번째" + receiver[i]);
			}

			return "mail/sendMailComplete";
		}
	}
	//파일 다운로드
	@RequestMapping("/download") 
	public void fileDownload(@RequestParam String eaNo, HttpServletResponse response) {

		System.out.println("eaNo : " + eaNo);

		System.out.println("잘 들어오나");

		AttachmentMail attach = ms.selectOneAttachmentMail(eaNo);

		try {
			BufferedInputStream buf = null;
			ServletOutputStream downOut = response.getOutputStream();

			File downFile = new File(attach.getFilePath());

			response.setContentType("text/plain; charset=UTF-8");
			response.setHeader("Content-Disposition", "attachment; filename=\"" + new String(attach.getOriginName().getBytes("UTF-8"),"ISO-8859-1") + "\"");
			response.setContentLength((int) downFile.length());

			FileInputStream fin = new FileInputStream(downFile);
			buf = new BufferedInputStream(fin);

			int readBytes = 0;
			while((readBytes = buf.read()) != -1) {
				downOut.write(readBytes);
			}

			downOut.close();
			buf.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	//받은메일 검색하기
	@RequestMapping(value="/search.ml")
	public String searchMail(HttpServletRequest request) {

		String searchCondition = request.getParameter("searchCondition");
		String searchValue = request.getParameter("searchValue");
		System.out.println("sc : " + searchCondition);
		System.out.println("sv : " + searchValue);

		searchCondition sc = new searchCondition();

		if(searchCondition.equals("제목")) {
			sc.setSubject(searchValue);
		}
		if(searchCondition.equals("내용")) {
			sc.setContent(searchValue);
		}

		int currentPage = 1;

		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		//검색 결과가 몇개인지부터 (페이징 처리 위해)
		int listCount = ms.getSearchResultListCount(sc);

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);


		List<Mail> list  = ms.selectSearchResultList(sc, pi);

		request.setAttribute("list", list);
		request.setAttribute("pi", pi);

		return "mail/receiveMailList";
	}

	//중요 메일함
	@RequestMapping(value="/important.ml")
	public String importantMail(HttpServletRequest request, Model model) {

		int currentPage = 1;

		String empEmail = ((LoginUser)(request.getSession().getAttribute("loginUser"))).getEmpEmail();
		String empNo= ((LoginUser)(request.getSession().getAttribute("loginUser"))).getEmpNo();


		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		int listCount = ms.getImportantListCount(empNo);

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		List<Mail> mailList = ms.selectImportantMailList(pi,empEmail);
		System.out.println("mailList : " + mailList);

		model.addAttribute("list", mailList);
		model.addAttribute("pi", pi);

		System.out.println("mailList잘 담겨있지? : " + mailList);
		return "mail/importantMailList";
	}
	//임시 보관함
	@RequestMapping(value="/temporary.ml")
	public String temporaryMail() {
		return "mail/temporaryMailList";
	}
	//스팸 메일함
	@RequestMapping(value="/spam.ml")
	public String spamMail() {
		return "mail/spamMailList";
	}
	//휴지통
	@RequestMapping(value="/trash.ml")
	public String trashMail() {
		return "mail/trashMailList";
	}
	
	 //안 읽은 메일 수 
		@RequestMapping(value="/getNotReadMailListCount.ml")
		public void getNotReadMailListCount(@RequestParam String empNo, HttpServletResponse response) {
			
			int notReadMailCount = ms.getNotReadMailListCount(empNo);
			
			ObjectMapper mapper = new ObjectMapper();

			try {
				//jsp로 값을 넘기기전에 UTF-8을 지정해 줘야 한글이 깨지지 않는다.
				response.setCharacterEncoding("UTF-8");
				response.setContentType("application/json");
				response.getWriter().print(mapper.writeValueAsString(notReadMailCount));

			} catch (JsonGenerationException e) {
				e.printStackTrace();
			} catch (JsonMappingException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
	//대시보드에서 안 읽은 메일 5개 조회하는 메소드
	@RequestMapping(value="/selectNotReadList.ml")
	public void selectTopFiveDraftList(@RequestParam String empNo, HttpServletResponse response) {
		//System.out.println("empNo : " + empNo);

		List<Mail> notReadMailList = ms.selectNotReadMailList(empNo);

		ObjectMapper mapper = new ObjectMapper();

		try {
			//jsp로 값을 넘기기전에 UTF-8을 지정해 줘야 한글이 깨지지 않는다.
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			response.getWriter().print(mapper.writeValueAsString(notReadMailList));

		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}




}
