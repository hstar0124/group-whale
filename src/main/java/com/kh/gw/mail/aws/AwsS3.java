package com.kh.gw.mail.aws;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Part;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.SdkClientException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.auth.profile.ProfileCredentialsProvider;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.Bucket;
import com.amazonaws.services.s3.model.CompleteMultipartUploadRequest;
import com.amazonaws.services.s3.model.CopyObjectRequest;
import com.amazonaws.services.s3.model.DeleteObjectRequest;
import com.amazonaws.services.s3.model.GetObjectRequest;
import com.amazonaws.services.s3.model.InitiateMultipartUploadRequest;
import com.amazonaws.services.s3.model.InitiateMultipartUploadResult;
import com.amazonaws.services.s3.model.ListObjectsV2Result;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PartETag;
import com.amazonaws.services.s3.model.ResponseHeaderOverrides;
import com.amazonaws.services.s3.model.S3Object;
import com.amazonaws.services.s3.model.S3ObjectSummary;
import com.amazonaws.services.s3.model.UploadPartRequest;
import com.amazonaws.services.s3.model.UploadPartResult;
import com.amazonaws.util.StringUtils;
import com.kh.gw.mail.controller.mailController;
import com.kh.gw.mail.model.service.MailService;
import com.kh.gw.mail.model.vo.AttachmentMail;
import com.kh.gw.mail.model.vo.Mail;

// 메일 수신을 위한 s3 버킷 접근 
@Component
public class AwsS3 {
	
	@Autowired
	private MailService ms;
   
   private AmazonS3 conn;
   private AmazonS3 s3Client;
   
   protected String accessKey = "#{accessKey}";
   protected String secretKey = "#{secretKey}";
   protected String bucketName = "bucketgroupwhale";
   
   protected String receiving_attachments ="src/main/webapp/resources/uploadFiles/mail";
   public AwsS3() {
      // 생성자가 작동하면 기본적으로 빌드를 한다.
      buildS3();
      this.s3Client = this.conn;
   }

   // 빌드하기 
   public void buildS3() {

      // 자격 증명 가져오기 // SES에서는 Exception을 내줌
      BasicAWSCredentials awsCreds = new BasicAWSCredentials(accessKey, secretKey);

      this.conn = AmazonS3ClientBuilder.standard()
            .withCredentials(new AWSStaticCredentialsProvider(awsCreds))
            .withRegion("us-east-1")
            .build();

      System.out.println("커넥션 빌드 성공");

   }

   // 버킷 가져오기
   public Bucket getBucket(String bucket_name) {
      System.out.println("찾는 버킷 : " + bucket_name);

      List<Bucket> buckets = conn.listBuckets();
      System.out.println("버킷 리스트 : " + buckets);
      for (Bucket bucket : buckets) {
         System.out.println(bucket.getName() + "\t" + StringUtils.fromDate(bucket.getCreationDate()));
      }      

      Bucket named_bucket = null;
      for (Bucket b : buckets) {
         if (b.getName().equals(bucket_name)) {
            named_bucket = b;
         }
      }

      if(named_bucket == null) {
         System.out.println("현재 찾는 버킷 " + bucket_name + "이 존재하지 않습니다.");
      }

      return named_bucket;
   }

   // 버킷 내부 객체 리스트 가져오기 
   public List<S3ObjectSummary> getObjects(String bucket_name) {
      // S3Object o = conn.getObject(bucket_name, objKey);  // 객체 정보를 반환해주는 메소드 
      ListObjectsV2Result result = conn.listObjectsV2(bucket_name);
      List<S3ObjectSummary> objects = result.getObjectSummaries();

      System.out.println("***" + bucket_name + " 내에 존재하는 객체 리스트 ***");
      for (S3ObjectSummary os: objects) {
         System.out.println("* " + os.getKey());
      }

      return objects; // 객체가 들어있는 리스트 
   }

   // s3에 있는 객체를 불러 읽어줌
   public void downloadObject(String bucketName, String key) {
      S3Object fullObject = null, objectPortion = null, headerOverrideObject = null;
      try {
         AmazonS3 s3Client = conn;

         fullObject = s3Client.getObject(new GetObjectRequest(bucketName, key));
         Properties props = System.getProperties();

         Session mailSession = Session.getDefaultInstance(props, null);
         // parse eml file
         InputStream inputStream;
         try {
            inputStream = fullObject.getObjectContent();
            MimeMessage message = new MimeMessage(mailSession, inputStream);

            try {
               System.out.println("-----------------");
               doEMailDownload(message);;
               //new MailController().doEMailDownload(message);
               
            } catch (Exception e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
            }
         } catch (MessagingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }


      } catch(AmazonServiceException e) {
         e.printStackTrace();
      } catch(SdkClientException e) {
         e.printStackTrace();
      } finally {
         try{
            if(fullObject != null) {
               fullObject.close();
            }
            if(objectPortion != null) {
               objectPortion.close();
            }
            if(headerOverrideObject != null) {
               headerOverrideObject.close();
            }
         }catch (IOException e) {
            e.printStackTrace();
         }
      }
   }
   
   
   public int saveFile(File saveFile, Part part) throws Exception {

        BufferedOutputStream bos = new BufferedOutputStream( new FileOutputStream(saveFile) );

        byte[] buff = new byte[2048];
        InputStream is = part.getInputStream();
        int ret = 0, count = 0;
        while( (ret = is.read(buff)) > 0 ){
            bos.write(buff, 0, ret);
            count += ret;
        }
        bos.close();
        is.close();
        return count;
    }

    public String decodeName( String name ) throws Exception {
        if(name == null || name.length() == 0){
            return "unknown";
        }
        String ret = java.net.URLDecoder.decode( name, "UTF-8" );

        // also check for a few other things in the string:
        ret = ret.replaceAll("=\\?", "");
        ret = ret.replaceAll("utf-8\\?B\\?", "");
        ret = ret.replaceAll("\\?=", "");
        ret = ret.replaceAll("=20", " ");
        ret = java.net.URLDecoder.decode( ret, "UTF-8" );
        
        
        return ret;
    }
   
 // 버킷 내부에 존재하는 객체 삭제 메소드
    public void deleteObject(String bucketName, String keyName) {
       try {
          s3Client.deleteObject(new DeleteObjectRequest(bucketName, keyName));
          System.out.println(bucketName + "내에 존재하는 " + keyName + " 객체 삭제 완료");
        }
        catch(AmazonServiceException e) {
            // The call was transmitted successfully, but Amazon S3 couldn't process 
            // it, so it returned an error response.
            e.printStackTrace();
        }
        catch(SdkClientException e) {
            // Amazon S3 couldn't be contacted for a response, or the client
            // couldn't parse the response from Amazon S3.
            e.printStackTrace();
        }
    }
    public void doEMailDownload(Message message) throws Exception {

        try {

        	Message messages = message;//folder.getMessages();
            
                Mail mr =  new Mail();
                ArrayList<AttachmentMail> maList = new ArrayList<AttachmentMail>();
                
                System.out.println("디코딩 전 : " + messages.getFrom()[0].toString());
                String from = decodeName(messages.getFrom()[0].toString());
                System.out.println("디코딩 후 : " + from);
                mr.setFrom(from.substring(from.indexOf("<")+1, from.lastIndexOf(">")));
                
                Address[] to = messages.getRecipients(Message.RecipientType.TO);
               String toaddr = "";
                for(int j = 0; j < to.length; j++){
                    toaddr += to[j].toString();
                }
                mr.setReceiver(toaddr);
                
                int idx = toaddr.indexOf("@");
                String empNo = toaddr.substring(0,idx);
                
                mr.setEmpNo(empNo);
                
                Address[] ccArr;
                try {
                    ccArr = messages.getRecipients(Message.RecipientType.CC);
                } catch (Exception e){
                    ccArr = null;
                }
                if(ccArr != null){
                   String cc = "";
                    for(int j = 0; j < ccArr.length; j++){
                       cc += ccArr[j].toString();
                    }
                    mr.setReceiver(mr.getReceiver()+cc);
                }
                
                mr.setMailSubject((messages.getSubject()));
                
                SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
                
                if(messages.getReceivedDate() != null){
                	String time1 = format1.format(messages.getReceivedDate());
                    mr.setMailEnrollDate(time1);
                } else {
                    mr.setMailEnrollDate(format1.format((new Date( (new java.util.Date()).getTime()))));
                }
                System.out.println("시간 어떻게 나오나? : " + mr.getMailEnrollDate());
                
                System.out.println("----------------------Body------------------------------");
                //email.body = "";
                Object content = messages.getContent();
                if(content instanceof java.lang.String){
                   System.out.println("String Content입니다.");
                    mr.setMailContent((((String)content)));
                    
                } else if(content instanceof Multipart){
                   System.out.println("Multipart Content입니다.");
                   
                   Multipart mp = (Multipart)content;
                    
                    System.out.println("이 메일의 bodyPart는 총  " + mp.getCount() +"개의 파트로 구성되어 있습니다.");
                    
                    for (int j=0; j < mp.getCount(); j++) {
                       System.out.println("현재 " +j+"번째 파트를 처리중입니다.");
                        Part part = mp.getBodyPart(j);
                        
                        String disposition = part.getDisposition();
                        
                        System.out.println("--------------------------"+j+"파트의 정보입니다.----------------------");
                        MimeBodyPart mbp = (MimeBodyPart)part;
                        System.out.println("mbp : " + mbp);
                        System.out.println("part : " + part);
                        System.out.println("content : " + mbp.getContent());
                        System.out.println("contentType : " + mbp.getContentType());
                        System.out.println("fileName : " + decodeName(mbp.getFileName()));
                        System.out.println("-----------------------------------------------------------------");
                        
                        System.out.println("disposition이 null인지 확인합니다.");
                        if (disposition == null) {
                           System.out.println(j+"번째 파트는 disposition이 null입니다.");
                            // Check if plain
                            
                            
                            if (mbp.isMimeType("text/plain")) {
                               String bodyArr = "";
                                bodyArr += (String)mbp.getContent();
                                
                                mr.setMailContent((bodyArr));
                                System.out.println(j+"번째 bodyArr를 출력합니다. ");
                                System.out.println(bodyArr);
                                
                            } else if(mbp.isMimeType("multipart/alternative")){
                               //mbp = (MimeBodyPart) mbp.getContent();
                               System.out.println("추가 파트@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
                               Multipart mp2 = (Multipart)mbp.getContent();
                               System.out.println("이 메일의 multipart/alternative 파트는 총  " + mp2.getCount() +"개의 파트로 구성되어 있습니다.");
                               
                               for (int k=0; k < mp2.getCount(); k++) {
                                   System.out.println("현재 " +j+"-"+k+"번째 파트를 처리중입니다.");
                                    Part part2 = mp2.getBodyPart(k);
                                    
                                    String disposition2 = part2.getDisposition();
                                    
                                    System.out.println("--------------------------" +j+"-"+k+"파트의 정보입니다.----------------------");
                                    MimeBodyPart mbp2 = (MimeBodyPart)part2;
                                    System.out.println(j+"-"+k+"content : " + mbp2.getContent());
                                    System.out.println(j+"-"+k+"contentType : " + mbp2.getContentType());
                                    System.out.println(j+"-"+k+"description : " + mbp2.getDescription());
                                    System.out.println(j+"-"+k+"disposition : " + mbp2.getDisposition());
                                    System.out.println(j+"-"+k+"fileName : " + decodeName(mbp2.getFileName()));
                                    System.out.println("-----------------------------------------------------------------");
                                    
                                    System.out.println("disposition이 null인지 확인합니다.");
                                    if (disposition2 == null) {
                                       System.out.println(j+"-"+k+"번째 파트는 disposition이 null입니다.");
                                        // Check if plain
                                        
                                        
                                        if (mbp2.isMimeType("text/plain")) {
                                           String bodyArr = "";
                                            bodyArr += (String)mbp2.getContent();
                                            
                                            mr.setMailContent((bodyArr));
                                            System.out.println(j+"-"+k+"번째 bodyArr를 출력합니다. ");
                                            System.out.println("emailBody : " + bodyArr);
                                            
                                        }else {
                                           String bodyArr = "";
                                            bodyArr += (String)mbp2.getContent();
                                            
                                            mr.setMailContent((bodyArr));
                                            System.out.println(j+"-"+k+"번째 bodyArr를 출력합니다. ");
                                            System.out.println("emailBody2 : " + bodyArr);
                                        }
                                    }
                                    
                                }
                               System.out.println("추가파트 끝@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
                            }else {
                                System.out.println(j+"번째 파트는 Attachment가 아니므로 파일을 생성하지 않습니다.");
                            }
                            
                          ///// ATTACHMENT파트로 파일을 분리해주는 구간
                        } else if ((disposition != null)&&(disposition.equals(Part.ATTACHMENT) || disposition.equals(Part.INLINE) )){
                           String whatIsDisposition = "";
                           if(disposition.equals(Part.ATTACHMENT)) {
                              whatIsDisposition = "ATTACHMENT입니다.";
                           }else if(disposition.equals(Part.INLINE)){
                              whatIsDisposition = "INLINE입니다.";
                           }
                           System.out.println(j+"번째 파트는 " +whatIsDisposition);
                           
                           String ext = "";
                            if (mbp.isMimeType("text/plain")) {
                               ext=".text";
                            }else if (mbp.isMimeType("image/png")) {
                               ext=".png";
                            }
                            AttachmentMail ma = new AttachmentMail();
                            ma.setOriginName(decodeName(mbp.getFileName()));
                            File savedir = new File(receiving_attachments);
                            savedir.mkdirs();
                            File savefile = File.createTempFile("emailattach", ext, savedir );
                            ma.setFilePath(savefile.getAbsolutePath());
                            ma.setEaSize(part.getSize()+"");
                            ma.setEaSize(saveFile( savefile, part)+"");
                            ma.setOriginName(decodeName(mbp.getFileName()));
                            ma.setChangeName(savefile.getName());
                            maList.add(ma);
                        }
                    }
                }
                
                System.out.println("mr : " + mr);
                System.out.println("maList : " + maList);
                
                int result2 = ms.insertReceiveMail2(mr, maList);
               
                if(result2 > 0) {
                	System.out.println("받은 메일 insert 성공이요");
                }
                
                
        } catch (Exception e){
           // folder.close(true); // true tells the mail server to expunge deleted messages.
            throw e;
        }

    }

}