package com.kh.gw.todo.model.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.gw.settings.model.vo.Department;
import com.kh.gw.settings.model.vo.MemberDto;
import com.kh.gw.todo.model.vo.Attachment;
import com.kh.gw.todo.model.vo.Card;
import com.kh.gw.todo.model.vo.Checklist;
import com.kh.gw.todo.model.vo.Folder;
import com.kh.gw.todo.model.vo.Label;
import com.kh.gw.todo.model.vo.Member;
import com.kh.gw.todo.model.vo.Reply;
import com.kh.gw.todo.model.vo.TodoList;

public interface TodoDao {
	
	/* int selectFolderNameCheck(SqlSessionTemplate sqlSession, Folder folder); */
	
	List<Folder> selectFolderList(SqlSessionTemplate sqlSession, Folder f);

	int insertFolder(SqlSessionTemplate sqlSession, Folder f);
	
	int insertMember(SqlSessionTemplate sqlSession, Folder f);

	int updateFolderName(SqlSessionTemplate sqlSession, Folder f);

	int deleteFolder(SqlSessionTemplate sqlSession, Folder f);
	
	int deleteMember(SqlSessionTemplate sqlSession, Folder f);

	List<Folder> selectFolderInfo(SqlSessionTemplate sqlSession, Folder f);

	List<TodoList> selectListInfo(SqlSessionTemplate sqlSession, Folder f);

	List<Card> selectCardInfo(SqlSessionTemplate sqlSession, Folder f);

	List<Label> selectLabelInfo(SqlSessionTemplate sqlSession, Folder f);
	
	List<Member> selectMemberInfo(SqlSessionTemplate sqlSession, Folder f);

	int insertCard(SqlSessionTemplate sqlSession, Card c);

	int insertList(SqlSessionTemplate sqlSession, TodoList li);

	List<Card> selectDetailCardInfo(SqlSessionTemplate sqlSession, Card c);

	List<Checklist> selectDetailCheckInfo(SqlSessionTemplate sqlSession, Card c);

	List<Label> selectDetailLabelInfo(SqlSessionTemplate sqlSession, Card c);

	List<Reply> selectDetailReplyInfo(SqlSessionTemplate sqlSession, Card c);

	List<Attachment> selectDetailAttachInfo(SqlSessionTemplate sqlSession, Card c);

	int deleteList(SqlSessionTemplate sqlSession, TodoList li);

	int deleteCard(SqlSessionTemplate sqlSession, Card c);

	List<Member> selectParticipantList(SqlSessionTemplate sqlSession, Folder f);

	List<MemberDto> selectMemberList(SqlSessionTemplate sqlSession);

	int insertParticipant(SqlSessionTemplate sqlSession, Member m);

	int deleteParticipant(SqlSessionTemplate sqlSession, Member m);

	int insertIncharge(SqlSessionTemplate sqlSession, Card c);

	List<Card> selectIncharge(SqlSessionTemplate sqlSession, Card c);

	int deleteIncharge(SqlSessionTemplate sqlSession, Card c);

	int insertChecklist(SqlSessionTemplate sqlSession, Checklist cl);

	List<Checklist> selectChecklist(SqlSessionTemplate sqlSession, Checklist cl);

	int updateCheckStatus(SqlSessionTemplate sqlSession, Checklist cl);

	int uploadFile(SqlSessionTemplate sqlSession, Attachment file);

	List<Attachment> selectFileList(SqlSessionTemplate sqlSession, Attachment file);

	Attachment downloadFile(SqlSessionTemplate sqlSession, String attachNo);

	int deleteFile(SqlSessionTemplate sqlSession, Attachment file);

	int insertLabel(SqlSessionTemplate sqlSession, Label lb);

	int insertDuedate(SqlSessionTemplate sqlSession, Card c);

	int deleteDuedate(SqlSessionTemplate sqlSession, String cardNo);

	int insertDescription(SqlSessionTemplate sqlSession, Card c);

	int insertReply(SqlSessionTemplate sqlSession, Reply r);

	List<Reply> selectReplyList(SqlSessionTemplate sqlSession, Reply r);

	int updateReply(SqlSessionTemplate sqlSession, Reply r);

	int deleteReply(SqlSessionTemplate sqlSession, Reply r);

	int updateChecklist(SqlSessionTemplate sqlSession, Checklist cl);

	int deleteChecklist(SqlSessionTemplate sqlSession, Checklist cl);

	int deleteLabel(SqlSessionTemplate sqlSession, Label lb);

	int updateListName(SqlSessionTemplate sqlSession, TodoList li);

	int updateCardName(SqlSessionTemplate sqlSession, Card c);

	List<Card> selectCardList(SqlSessionTemplate sqlSession, Card c);

	List<Label> selectLabelList(SqlSessionTemplate sqlSession, Card c);
}
