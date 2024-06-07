package com.kh.gw.messenger.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.gw.member.model.vo.Member;
import com.kh.gw.messenger.model.vo.AttachmentMs;
import com.kh.gw.messenger.model.vo.MemberImg;
import com.kh.gw.messenger.model.vo.Message;
import com.kh.gw.messenger.model.vo.Room;
import com.kh.gw.messenger.model.vo.RoomList;
import com.kh.gw.messenger.model.vo.Thema;

public interface MessengerService {

	int insertMessage(Message m);
	
	List<Message> selectHistory(Message m);

	List<Room> selectRoomList(Room r);
	
	List<Room> selectRoomList2(Room r);

	int insertRoom(Room r);

	int insertRoomList(Room r);

	int insertMessage2(Message m);

	RoomList selectRoomNo(RoomList rl);

	int exitRoom(RoomList rl);

	int insertThema(Thema t);

	Thema selectThema(Thema t);

	List<RoomList> selectRoomMember(RoomList rl);

	MemberImg selectMemberImg(MemberImg mi);

	int insertFile(AttachmentMs at);

	AttachmentMs selectFile(AttachmentMs at);

	AttachmentMs selectAttachment(AttachmentMs at);

	int insertAddMember(RoomList rl);

	int insertMessage3(Message m);

	int exitMessage(Message m);

}
