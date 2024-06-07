package com.kh.gw.messenger.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.gw.member.model.vo.Member;
import com.kh.gw.messenger.model.dao.MessengerDao;
import com.kh.gw.messenger.model.vo.AttachmentMs;
import com.kh.gw.messenger.model.vo.MemberImg;
import com.kh.gw.messenger.model.vo.Message;
import com.kh.gw.messenger.model.vo.Room;
import com.kh.gw.messenger.model.vo.RoomList;
import com.kh.gw.messenger.model.vo.Thema;

@Service
public class MessengerServiceImpl implements MessengerService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private MessengerDao md;
	
	
	@Override
	public int insertMessage(Message m) {
		
		return md.insertMessage(sqlSession, m);
	}

	@Override
	public List<Message> selectHistory(Message m) {

		return md.selectHistory(sqlSession, m);
	}

	@Override
	public List<Room> selectRoomList(Room r) {

		return md.selectRoomList(sqlSession, r);
	}

	@Override
	public List<Room> selectRoomList2(Room r) {
		
		return md.selectRoomList2(sqlSession, r);
	}


	@Override
	public int insertRoom(Room r) {
		
		return  md.insertRoom(sqlSession, r);
	}


	@Override
	public int insertRoomList(Room r) {
		
		return md.insertRoomList(sqlSession, r);
	}


	@Override
	public int insertMessage2(Message m) {

		return md.insertMessage2(sqlSession, m);
	}


	
    @Override public RoomList selectRoomNo(RoomList rl) {
  
    	return md.selectRoomNo(sqlSession, rl); 
    }


	@Override
	public int exitRoom(RoomList rl) {
		
		return md.exitRoom(sqlSession, rl);
	}


	@Override
	public int insertThema(Thema t) {
		
		return md.insertThema(sqlSession, t);
	}


	@Override
	public Thema selectThema(Thema t) {
		
		return md.selectThema(sqlSession, t);
	}


	@Override
	public List<RoomList> selectRoomMember(RoomList rl) {
		
		return  md.selectRoomMember(sqlSession, rl);
	}


	@Override
	public MemberImg selectMemberImg(MemberImg mi) {
		
		return md.selectMemberImg(sqlSession, mi);
	}

	@Override
	public int insertFile(AttachmentMs at) {
	
		return md.insertFile(sqlSession, at);
	}

	@Override
	public AttachmentMs selectFile(AttachmentMs at) {

		return md.selectFile(sqlSession, at);
	}

	@Override
	public AttachmentMs selectAttachment(AttachmentMs at) {
		
		return md.selectAttachment(sqlSession, at);
	}

	@Override
	public int insertAddMember(RoomList rl) {
		
		return md.insertAddMember(sqlSession, rl);
	}

	@Override
	public int insertMessage3(Message m) {
		
		return md.insertMessage3(sqlSession, m);
	}

	@Override
	public int exitMessage(Message m) {
		
		return md.exitMessage(sqlSession, m);
	}
 

}
