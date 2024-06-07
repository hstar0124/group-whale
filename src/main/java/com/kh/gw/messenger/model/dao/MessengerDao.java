package com.kh.gw.messenger.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.kh.gw.member.model.vo.Member;
import com.kh.gw.messenger.model.vo.AttachmentMs;
import com.kh.gw.messenger.model.vo.MemberImg;
import com.kh.gw.messenger.model.vo.Message;
import com.kh.gw.messenger.model.vo.Room;
import com.kh.gw.messenger.model.vo.RoomList;
import com.kh.gw.messenger.model.vo.Thema;

public interface MessengerDao {

	int insertMessage(SqlSessionTemplate sqlSession, Message m);

	List<Message> selectHistory(SqlSessionTemplate sqlSession, Message m);

	List<Room> selectRoomList(SqlSessionTemplate sqlSession, Room r);
	List<Room> selectRoomList2(SqlSessionTemplate sqlSession, Room r);

	int insertRoom(SqlSessionTemplate sqlSession, Room r);

	int insertRoomList(SqlSessionTemplate sqlSession, Room r);

	int insertMessage2(SqlSessionTemplate sqlSession, Message m);

	RoomList selectRoomNo(SqlSessionTemplate sqlSession, RoomList rl);

	int insertThema(SqlSessionTemplate sqlSession, Thema t);

	Thema selectThema(SqlSessionTemplate sqlSession, Thema t);

	List<RoomList> selectRoomMember(SqlSessionTemplate sqlSession, RoomList rl);

	MemberImg selectMemberImg(SqlSessionTemplate sqlSession, MemberImg mi);

	int insertFile(SqlSessionTemplate sqlSession, AttachmentMs at);

	AttachmentMs selectFile(SqlSessionTemplate sqlSession, AttachmentMs at);

	AttachmentMs selectAttachment(SqlSessionTemplate sqlSession, AttachmentMs at);

	int exitRoom(SqlSessionTemplate sqlSession, RoomList rl);

	int insertAddMember(SqlSessionTemplate sqlSession, RoomList rl);

	int insertMessage3(SqlSessionTemplate sqlSession, Message m);

	int exitMessage(SqlSessionTemplate sqlSession, Message m);


}
