package com.kh.gw.todo.model.service;

import java.util.ArrayList;
import java.util.List;
import java.sql.Date;

import com.kh.gw.settings.model.vo.Department;
import com.kh.gw.settings.model.vo.MemberDto;
import com.kh.gw.todo.model.vo.Attachment;
import com.kh.gw.todo.model.vo.Card;
import com.kh.gw.todo.model.vo.Checklist;
import com.kh.gw.todo.model.vo.Label;
import com.kh.gw.todo.model.vo.Member;
import com.kh.gw.todo.model.vo.Reply;
import com.kh.gw.todo.model.vo.Folder;
import com.kh.gw.todo.model.vo.TodoList;

public interface TodoService {
	
	/* int folderNameCheck(Folder folder); */
	
	List<Folder> selectFolderList(Folder f);
	
	int insertFolder(Folder f);
	
	int insertMember(Folder f);

	int updateFolderName(Folder f);

	int deleteFolder(Folder f);
	
	int deleteMember(Folder f);

	List<Folder> selectFolderInfo(Folder f);

	List<TodoList> selectListInfo(Folder f);

	List<Card> selectCardInfo(Folder f);

	List<Label> selectLabelInfo(Folder f);
	
	List<Member> selectMemberInfo(Folder f);

	int insertCard(Card c);

	int insertList(TodoList li);

	List<Card> selectDetailCardInfo(Card c);

	List<Checklist> selectDetailCheckInfo(Card c);

	List<Label> selectDetailLabelInfo(Card c);

	List<Reply> selectDetailReplyInfo(Card c);

	List<Attachment> selectDetailAttachInfo(Card c);

	int deleteList(TodoList li);

	int deleteCard(Card c);

	List<Member> selectParticipantList(Folder f);

	List<MemberDto> selectMemberList();

	int insertParticipant(Member m);

	int deleteParticipant(Member m);

	int insertIncharge(Card c);

	List<Card> selectIncharge(Card c);

	int deleteIncharge(Card c);

	int insertChecklist(Checklist cl);

	List<Checklist> selectChecklist(Checklist cl);

	int updateCheckStatus(Checklist cl);

	int uploadFile(Attachment file);

	List<Attachment> selectFileList(Attachment file);

	Attachment downloadFile(String attachNo);

	int deleteFile(Attachment file);

	int insertLabel(Label lb);

	int insertDuedate(Card c);

	int deleteDuedate(String cardNo);

	int insertDescription(Card c);

	int insertReply(Reply r);

	List<Reply> selectReplyList(Reply r);

	int updateReply(Reply r);

	int deleteReply(Reply r);

	int updateChecklist(Checklist cl);

	int deleteChecklist(Checklist cl);

	int deleteLabel(Label lb);

	int updateListName(TodoList li);

	int updateCardName(Card c);

	List<Card> selectCardList(Card c);

	List<Label> selectLabelList(Card c);
}
