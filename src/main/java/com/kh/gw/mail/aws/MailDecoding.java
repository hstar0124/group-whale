package com.kh.gw.mail.aws;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.util.Base64;
import java.util.Base64.Decoder;
import java.util.List;
import java.util.Properties;
import java.util.Vector;

import javax.mail.Address;
import javax.mail.Flags;
import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Part;
import javax.mail.Session;
import javax.mail.Store;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;

import com.amazonaws.services.s3.model.Bucket;
import com.amazonaws.services.s3.model.S3ObjectSummary;
import com.kh.gw.mail.model.vo.AttachmentMail;
import com.kh.gw.mail.model.vo.Mail;

public class MailDecoding {
    protected String receiving_attachments ="src/main/webapp/resources/uploadFiles/mail2";

   protected void doEMailDownload(Message message) throws Exception {

        try {

            Message messages = message;//folder.getMessages();

                Mail m = new Mail();
                
                m.setFrom(decodeName(messages.getFrom()[0].toString()));
                
                System.out.println("from : " + m.getFrom());
                
                Address[] to = messages.getRecipients(Message.RecipientType.TO);
                String toaddr = "";
                for(int j = 0; j < to.length; j++){
                    toaddr += to[j].toString() + "; ";
                }
                m.setReceiver(toaddr);
                
                System.out.println("to : " + m.getReceiver());
                
                Address[] ccArr;
                try {
                    ccArr = messages.getRecipients(Message.RecipientType.CC);
                } catch (Exception e){
                    ccArr = null;
                }
                if(ccArr != null){
                   String cc = "";
                    for(int j = 0; j < ccArr.length; j++){
                       cc += ccArr[j].toString() + "; ";
                    }
                    m.setCc(cc);
                }
                
                System.out.println("cc : " + m.getCc());
                
                
                m.setMailSubject(messages.getSubject());
                
                System.out.println("subject : " + m.getMailSubject());
                
                System.out.println("receiveDate : " + m.getMailEnrollDate());
                
                
                System.out.println("----------------------Body------------------------------");
                //email.body = "";
                Object content = messages.getContent();
                if(content instanceof java.lang.String){
                   System.out.println("String Content입니다.");
                    m.setMailContent((String)content);
                    
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

//                        Decoder decoder = Base64.getDecoder();
//                        byte[] decodedBytes = decoder.decode(mbp.getFileName().getBytes());
//                        System.out.println("파일 네임 나와라! : " + ㅇㄷ);


                        
                        
                        System.out.println("-----------------------------------------------------------------");
                        
                        System.out.println("disposition이 null인지 확인합니다.");
                        if (disposition == null) {
                           System.out.println(j+"번째 파트는 disposition이 null입니다.");
                            // Check if plain
                            
                            
                            if (mbp.isMimeType("text/plain")) {
                               String bodyArr = "";
                                bodyArr += (String)mbp.getContent();
                                
                                m.setMailContent(bodyArr);
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
                                            
                                            m.setMailContent(bodyArr);
                                            System.out.println(j+"-"+k+"번째 bodyArr를 출력합니다. ");
                                            System.out.println("emailBody : " + bodyArr);
                                            
                                        }else {
                                           String bodyArr = "";
                                            bodyArr += (String)mbp2.getContent();
                                            
                                            m.setMailContent(bodyArr);
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
                            AttachmentMail attach = new AttachmentMail();
                            attach.setOriginName(decodeName(part.getFileName()));
                            File savedir = new File(receiving_attachments);
                            savedir.mkdirs();
                            File savefile = File.createTempFile("emailattach", ext, savedir );
                            attach.setFilePath(savefile.getAbsolutePath());
                            attach.setEaSize(part.getSize()+"");
                            attach.setEaSize(saveFile( savefile, part)+"");
                            System.out.println(j +"번째 파일은 " + attach.getFilePath()+"로 저장되었습니다.");
                        }
                    }
                }
                
                System.out.println("emailBody : " + m.getMailContent());
        } catch (Exception e){
           // folder.close(true); // true tells the mail server to expunge deleted messages.
            throw e;
        }

    }

    protected int saveFile(File saveFile, Part part) throws Exception {

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

    protected String decodeName( String name ) throws Exception {
        if(name == null || name.length() == 0){
            return "unknown";
        }
        String ret = java.net.URLDecoder.decode( name, "UTF-8" );

        // also check for a few other things in the string:
        ret = ret.replaceAll("=\\?", "");
        ret = ret.replaceAll("utf-8\\?B\\?", "");
        ret = ret.replaceAll("\\?=", "");
        ret = ret.replaceAll("=20", " ");
        ret = ret.replaceAll("=20", "");

        ret = java.net.URLDecoder.decode( ret, "UTF-8" );
//        System.out.println(java.net.URLDecoder.decode( "=?utf-8?B?c2VuZE1haWwucG5n?=", "UTF-8"));
//        System.out.println(java.net.URLDecoder.decode( "=?B?c2VuZE1haWwucG5n?=", "UTF-8"));
//        System.out.println(java.net.URLDecoder.decode( "=?c2VuZE1haWwucG5n?=", "UTF-8"));
//        System.out.println(java.net.URLDecoder.decode( "c2VuZE1haWwucG5n", "UTF-8"));
//        System.out.println(java.net.URLDecoder.decode( "", "UTF-8"));
//        System.out.println(java.net.URLDecoder.decode( "", "UTF-8"));
//        System.out.println(java.net.URLDecoder.decode( "", "UTF-8"));
//        System.out.println(java.net.URLDecoder.decode( "", "UTF-8"));
//        System.out.println(java.net.URLDecoder.decode( "", "UTF-8"));
//        System.out.println(java.net.URLDecoder.decode( "", "UTF-8"));
        
        return ret;
    }
    
    public static void main(String[] args) {
       
       AwsS3 as = new AwsS3();
       String bucketName = "bucketgroupwhale";
       List<S3ObjectSummary> objects = as.getObjects(bucketName);
       for(S3ObjectSummary object : objects) {
          String key = object.getKey();
          System.out.println("key  : " +  key);
          as.downloadObject(bucketName, key);
          
          //첨부파일없는네이버에서온메일 1
          //첨부파일있는네이버에서온메일 2
          //내게쓴 메일 3
       
       File emlFile = new File("src/main/webapp/resources/uploadFiles/mail/as2h16f9sg9u145iebjb9brddu7c74nhadects01");
       //저 경로의 파일을 불러와서 eml파일로 바꿀거다
       Properties props = System.getProperties();

       Session mailSession = Session.getDefaultInstance(props, null);

       // parse eml file
       InputStream inputStream;
      try {
         inputStream = new FileInputStream(emlFile);
         MimeMessage message = new MimeMessage(mailSession, inputStream);

//          System.out.println("Subject : " + message.getSubject());
//          System.out.println("From : " + message.getFrom()[0]);
//          System.out.println("Body : " +  message.getContent());
          
          MailDecoding md = new MailDecoding();
          try {
             System.out.println("-----------------");
            md.doEMailDownload(message);
         } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
      } catch (FileNotFoundException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } catch (MessagingException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } catch (IOException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
       
       

          
          //as.deleteObject(bucketName, key);
       }
   }
}