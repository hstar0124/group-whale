package com.kh.gw.messenger.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.kh.gw.member.model.vo.Member;
import com.kh.gw.messenger.model.vo.AttachmentMs;
import com.kh.gw.messenger.model.vo.MemberImg;
import com.kh.gw.messenger.model.vo.Message;
import com.kh.gw.messenger.model.vo.Room;
import com.kh.gw.messenger.model.vo.RoomList;
import com.kh.gw.messenger.model.vo.Thema;

@Repository
public class MessengerDaoImpl implements MessengerDao {

	@Override
	public int insertMessage(SqlSessionTemplate sqlSession, Message m) {
	
		return sqlSession.insert("Messenger.insertMessage", m);
	}

	@Override
	public List<Message> selectHistory(SqlSessionTemplate sqlSession, Message m) {
		
		return sqlSession.selectList("Messenger.selectHistory", m);
	}

	@Override
	public List<Room> selectRoomList(SqlSessionTemplate sqlSession, Room r) {

		return sqlSession.selectList("Messenger.selectRoomList", r);
	}
	
	@Override
	public List<Room> selectRoomList2(SqlSessionTemplate sqlSession, Room r) {
		
		return sqlSession.selectList("Messenger.selectRoomList2", r);
	}

	@Override
	public int insertRoom(SqlSessionTemplate sqlSession, Room r) {

		return sqlSession.insert("Messenger.insertRoom", r);
	}

	@Override
	public int insertRoomList(SqlSessionTemplate sqlSession, Room r) {

		return sqlSession.insert("Messenger.insertRoomList", r);
	}

	@Override
	public int insertMessage2(SqlSessionTemplate sqlSession, Message m) {
		
		return sqlSession.insert("Messenger.insertMessage2", m);
	}
	
	
	@Override public RoomList selectRoomNo(SqlSessionTemplate sqlSession, RoomList rl) { 
		
		return sqlSession.selectOne("Messenger.selectRoomNo", rl); 
	}

	@Override
	public int exitRoom(SqlSessionTemplate sqlSession, RoomList rl) {
		
		return sqlSession.delete("Messenger.deleteRoom", rl);
	}

	@Override
	public int insertThema(SqlSessionTemplate sqlSession, Thema t) {
		
		return sqlSession.insert("Messenger.insertThema", t);
	}

	@Override
	public Thema selectThema(SqlSessionTemplate sqlSession, Thema t) {
		
		return sqlSession.selectOne("Messenger.selectThema", t);
	}

	@Override
	public List<RoomList> selectRoomMember(SqlSessionTemplate sqlSession, RoomList rl) {

		return sqlSession.selectList("Messenger.selectRoomMember", rl);
	}

	@Override
	public MemberImg selectMemberImg(SqlSessionTemplate sqlSession, MemberImg mi) {
		
		return sqlSession.selectOne("Messenger.selectMemberImg", mi);
	}

	@Override
	public int insertFile(SqlSessionTemplate sqlSession, AttachmentMs at) {

		return sqlSession.insert("Messenger.insertFile", at);
	}

	@Override
	public AttachmentMs selectFile(SqlSessionTemplate sqlSession, AttachmentMs at) {
		
		return sqlSession.selectOne("Messenger.selectFile", at);
	}

	@Override
	public AttachmentMs selectAttachment(SqlSessionTemplate sqlSession, AttachmentMs at) {
	
		return sqlSession.selectOne("Messenger.selectAttachment", at);
	}

	@Override
	public int insertAddMember(SqlSessionTemplate sqlSession, RoomList rl) {
		
		return sqlSession.update("Messenger.insertAddMember", rl);
	}

	@Override
	public int insertMessage3(SqlSessionTemplate sqlSession, Message m) {
		
		return sqlSession.insert("Messenger.insertMessage3", m);
	}

	@Override
	public int exitMessage(SqlSessionTemplate sqlSession, Message m) {
		
		return sqlSession.insert("Messenger.exitMessage", m);
	}
	 

	


	

}
