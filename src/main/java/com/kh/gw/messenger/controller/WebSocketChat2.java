package com.kh.gw.messenger.controller;

import java.util.ArrayList;
import java.util.List;
 
import javax.websocket.server.ServerEndpoint;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
 
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
 
import javax.websocket.RemoteEndpoint.Basic;
 
@Controller
@ServerEndpoint(value="/wesocket2")
public class WebSocketChat2 {
    
    private static final List<Session> sessionList = new ArrayList<Session>();;
    private static final Logger logger = LoggerFactory.getLogger(WebSocketChat.class);
    
    
    public WebSocketChat2() {
        //System.out.println("웹소켓(서버) 객체생성");
    }
    
    @RequestMapping(value="/chat2.do")
    public ModelAndView getChatViewPage(ModelAndView mav) {
    	// 웹소켓을 받을 jsp 페이지 이름
    	mav.setViewName("messemgerChattingDetail");
    	return mav;
    }
    
    @OnOpen
    public void onOpen(Session session) {
        //logger.info("Open session id:"+session.getId());
        try {
            final Basic basic=session.getBasicRemote();
            //basic.sendText("Connection Established");
            
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }
        sessionList.add(session);
    }
    /*
     * 모든 사용자에게 메시지를 전달한다.
     * @param self
     * @param message
     */
    private void sendAllSessionToMessage(Session self, String message) {
        try {
            for(Session session : WebSocketChat2.sessionList) {
                if(!self.getId().equals(session.getId())) {
                    // 상대방이 받는 메시지 내용
                	session.getBasicRemote().sendText(message);
                }
            }
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
    @OnMessage                  
    public void onMessage(String message, Session session) {
        //logger.info("Message From "+message.split(",")[1] + ":"+message.split(",")[0]);
        
        try {
            final Basic basic = session.getBasicRemote();
            
            for(int i = 0; i < sessionList.size(); i++) {
            	if(session.getId() != sessionList.get(i).getId()) {
            		//basic.sendText(message);
                }
            }
            
        } catch (Exception e) {
        	System.out.println(e.getMessage());
        }
        sendAllSessionToMessage(session, message);
        
    }
    
    @OnError
    public void onError(Throwable e, Session session) {
        
    }
    
    @OnClose
    public void onClose(Session session) {
        //logger.info("Session "+session.getId()+" has ended");
        sessionList.remove(session);
    }
}


