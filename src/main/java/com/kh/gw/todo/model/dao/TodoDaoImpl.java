package com.kh.gw.todo.model.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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

@Repository
public class TodoDaoImpl implements TodoDao {

	/*
	 * @Override public int selectFolderNameCheck(SqlSessionTemplate sqlSession,
	 * Folder folder) {
	 * 
	 * return sqlSession.selectOne("Todo.selectFolderNameCheck", folder); }
	 */
	
	@Override
	public List<Folder> selectFolderList(SqlSessionTemplate sqlSession, Folder f) {
		//폴더 목록 조회
		return sqlSession.selectList("Todo.selectFolderList", f);
	}
	
	@Override
	public int insertFolder(SqlSessionTemplate sqlSession, Folder f) {
		//폴더 추가
		return sqlSession.insert("Todo.insertFolder", f);
	}
	
	@Override
	public int insertMember(SqlSessionTemplate sqlSession, Folder f) {
		//폴더 추가 시 참여자 추가
		return sqlSession.insert("Todo.insertMember", f);
	}

	@Override
	public int updateFolderName(SqlSessionTemplate sqlSession, Folder f) {
		//폴더명 수정
		return sqlSession.update("Todo.updateFolderName", f);
	}

	@Override
	public int deleteFolder(SqlSessionTemplate sqlSession, Folder f) {
		//폴더 삭제
		return sqlSession.delete("Todo.deleteFolder", f);
	}
	
	@Override
	public int deleteMember(SqlSessionTemplate sqlSession, Folder f) {
		//폴더 삭제시 참여자 삭제
		return sqlSession.delete("Todo.deleteMember", f);
	}

	@Override
	public List<Folder> selectFolderInfo(SqlSessionTemplate sqlSession, Folder f) {
		//todoList에 보여줄 폴더 정보 조회
		return sqlSession.selectList("Todo.selectFolderInfo", f);
	}

	@Override
	public List<TodoList> selectListInfo(SqlSessionTemplate sqlSession, Folder f) {
		//todoList.jsp에 보여줄 리스트 정보 조회
		return sqlSession.selectList("Todo.selectListInfo", f);
	}

	@Override
	public List<Card> selectCardInfo(SqlSessionTemplate sqlSession, Folder f) {
		//todoList.jsp에 보여줄 카드 정보 조회
		return sqlSession.selectList("Todo.selectCardInfo", f);
	}

	@Override
	public List<Label> selectLabelInfo(SqlSessionTemplate sqlSession, Folder f) {
		//todoList.jsp에 보여줄 라벨 정보 조회
		return sqlSession.selectList("Todo.selectLabelInfo", f);
	}
	
	@Override
	public List<Member> selectMemberInfo(SqlSessionTemplate sqlSession, Folder f) {
		//todoList.jsp에 보여줄 참여자 정보 조회
		return sqlSession.selectList("Todo.selectMemberInfo", f);
	}

	@Override
	public int insertCard(SqlSessionTemplate sqlSession, Card c) {
		//카드 추가
		return sqlSession.insert("Todo.insertCard", c);
	}

	@Override
	public int insertList(SqlSessionTemplate sqlSession, TodoList li) {
		//리스트 추가
		return sqlSession.insert("Todo.insertList", li);
	}

	@Override
	public List<Card> selectDetailCardInfo(SqlSessionTemplate sqlSession, Card c) {
		//카드 상세보기
		return sqlSession.selectList("Todo.selectCardDetailInfo", c);
	}

	@Override
	public List<Checklist> selectDetailCheckInfo(SqlSessionTemplate sqlSession, Card c) {
		//카드 상세보기
		return sqlSession.selectList("Todo.selectCheckDetailInfo", c);
	}

	@Override
	public List<Label> selectDetailLabelInfo(SqlSessionTemplate sqlSession, Card c) {
		//카드 상세보기
		return sqlSession.selectList("Todo.selectLabelDetailInfo", c);
	}

	@Override
	public List<Reply> selectDetailReplyInfo(SqlSessionTemplate sqlSession, Card c) {
		//카드 상세보기
		return sqlSession.selectList("Todo.selectReplyDetailInfo", c);
	}

	@Override
	public List<Attachment> selectDetailAttachInfo(SqlSessionTemplate sqlSession, Card c) {
		//카드 상세보기
		return sqlSession.selectList("Todo.selectAttachDetailInfo", c);
	}

	@Override
	public int deleteList(SqlSessionTemplate sqlSession, TodoList li) {
		//리스트 삭제
		return sqlSession.delete("Todo.deleteList", li);
	}

	@Override
	public int deleteCard(SqlSessionTemplate sqlSession, Card c) {
		//카드 삭제
		return sqlSession.delete("Todo.deleteCard", c);
	}

	@Override
	public List<Member> selectParticipantList(SqlSessionTemplate sqlSession, Folder f) {
		//참여자 목록 불러오기
		return sqlSession.selectList("Todo.selectParticipantList", f);
	}

	@Override
	public List<MemberDto> selectMemberList(SqlSessionTemplate sqlSession) {
		//참여자 추가 시 조직도 불러오기
		
		return sqlSession.selectList("Todo.selectMemberList");
	}

	@Override
	public int insertParticipant(SqlSessionTemplate sqlSession, Member m) {
		//참여자 추가
		return sqlSession.insert("Todo.insertParticipant", m);
	}

	@Override
	public int deleteParticipant(SqlSessionTemplate sqlSession, Member m) {
		//참여자 삭제
		return sqlSession.delete("Todo.deleteParticipant", m);
	}

	@Override
	public int insertIncharge(SqlSessionTemplate sqlSession, Card c) {
		//담당자 추가
		return sqlSession.update("Todo.insertIncharge", c);
	}

	@Override
	public List<Card> selectIncharge(SqlSessionTemplate sqlSession, Card c) {
		//담당자 불러오기
		return sqlSession.selectList("Todo.selectIncharge", c);
	}

	@Override
	public int deleteIncharge(SqlSessionTemplate sqlSession, Card c) {
		//담당자 삭제
		return sqlSession.update("Todo.deleteIncharge", c);
	}

	@Override
	public int insertChecklist(SqlSessionTemplate sqlSession, Checklist cl) {
		//체크리스트 추가
		return sqlSession.insert("Todo.insertChecklist", cl);
	}

	@Override
	public List<Checklist> selectChecklist(SqlSessionTemplate sqlSession, Checklist cl) {
		//체크리스트 불러오기
		return sqlSession.selectList("Todo.selectChecklist", cl);
	}

	@Override
	public int updateCheckStatus(SqlSessionTemplate sqlSession, Checklist cl) {
		//체크리스트 체크 상태 업데이트
		return sqlSession.update("Todo.updateCheckStatus", cl);
	}

	@Override
	public int uploadFile(SqlSessionTemplate sqlSession, Attachment file) {
		//파일 업로드
		return sqlSession.insert("Todo.uploadFile", file);
	}

	@Override
	public List<Attachment> selectFileList(SqlSessionTemplate sqlSession, Attachment file) {
		//파일 불러오기
		return sqlSession.selectList("Todo.selectFileList", file);
	}

	@Override
	public Attachment downloadFile(SqlSessionTemplate sqlSession, String attachNo) {
		//파일 다운로드
		return sqlSession.selectOne("Todo.downloadFile", attachNo);
	}

	@Override
	public int deleteFile(SqlSessionTemplate sqlSession, Attachment file) {
		//파일 삭제
		return sqlSession.delete("Todo.deleteFile", file);
	}

	@Override
	public int insertLabel(SqlSessionTemplate sqlSession, Label lb) {
		//라벨 추가
		return sqlSession.insert("Todo.insertLabel", lb);
	}

	@Override
	public int insertDuedate(SqlSessionTemplate sqlSession, Card c) {
		//기한일 추가
		return sqlSession.update("Todo.insertDuedate", c);
	}

	@Override
	public int deleteDuedate(SqlSessionTemplate sqlSession, String cardNo) {
		//기한일 삭제
		return sqlSession.update("Todo.deleteDuedate", cardNo);
	}

	@Override
	public int insertDescription(SqlSessionTemplate sqlSession, Card c) {
		//설명 추가
		return sqlSession.update("Todo.insertDescription", c);
	}

	@Override
	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		//댓글 등록
		return sqlSession.insert("Todo.insertReply", r);
	}

	@Override
	public List<Reply> selectReplyList(SqlSessionTemplate sqlSession, Reply r) {
		//댓글 목록 불러오기
		return sqlSession.selectList("Todo.selectReplyList", r);
	}

	@Override
	public int updateReply(SqlSessionTemplate sqlSession, Reply r) {
		//댓글 수정
		return sqlSession.update("Todo.updateReply", r);
	}

	@Override
	public int deleteReply(SqlSessionTemplate sqlSession, Reply r) {
		//댓글 삭제
		return sqlSession.delete("Todo.deleteReply", r);
	}

	@Override
	public int updateChecklist(SqlSessionTemplate sqlSession, Checklist cl) {
		//체크리스트 수정
		return sqlSession.update("Todo.updateChecklist", cl);
	}

	@Override
	public int deleteChecklist(SqlSessionTemplate sqlSession, Checklist cl) {
		//체크리스트 삭제
		return sqlSession.update("Todo.deleteChecklist", cl);
	}

	@Override
	public int deleteLabel(SqlSessionTemplate sqlSession, Label lb) {
		//라벨 삭제
		return sqlSession.delete("Todo.deleteLabel", lb);
	}

	@Override
	public int updateListName(SqlSessionTemplate sqlSession, TodoList li) {
		//리스트 제목 수정
		return sqlSession.update("Todo.updateListName", li);
	}

	@Override
	public int updateCardName(SqlSessionTemplate sqlSession, Card c) {
		//카드 제목 수정
		return sqlSession.update("Todo.updateCardName", c);
	}

	@Override
	public List<Card> selectCardList(SqlSessionTemplate sqlSession, Card c) {
		//카드 추가 후 카드 목록 불러오기
		return sqlSession.selectList("Todo.selectCardList", c);
	}

	@Override
	public List<Label> selectLabelList(SqlSessionTemplate sqlSession, Card c) {
		//카드 추가 후 라벨 정보 불러오기
		return sqlSession.selectList("Todo.selectLabelList", c);
	}
}