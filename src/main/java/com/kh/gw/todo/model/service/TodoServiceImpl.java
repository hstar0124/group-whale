package com.kh.gw.todo.model.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.gw.settings.model.vo.Department;
import com.kh.gw.settings.model.vo.MemberDto;
import com.kh.gw.todo.model.dao.TodoDao;
import com.kh.gw.todo.model.vo.Attachment;
import com.kh.gw.todo.model.vo.Card;
import com.kh.gw.todo.model.vo.Checklist;
import com.kh.gw.todo.model.vo.Folder;
import com.kh.gw.todo.model.vo.Label;
import com.kh.gw.todo.model.vo.Member;
import com.kh.gw.todo.model.vo.Reply;
import com.kh.gw.todo.model.vo.TodoList;

@Service
public class TodoServiceImpl implements TodoService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private TodoDao dao;
	
	/*
	 * @Override public int folderNameCheck(Folder folder) { //폴더 이름 중복 체크 return
	 * dao.selectFolderNameCheck(sqlSession, folder); }
	 */
	
	@Override
	public List<Folder> selectFolderList(Folder f) {
		//폴더 목록 조회 (left메뉴/todo홈)
		return dao.selectFolderList(sqlSession, f);
	}
	
	@Override
	public int insertFolder(Folder f) {
		//폴더 추가
		return dao.insertFolder(sqlSession, f);
	}
	
	@Override
	public int insertMember(Folder f) {
		//폴더 추가 시 참여자 추가
		return dao.insertMember(sqlSession, f);
	}

	@Override
	public int updateFolderName(Folder f) {
		//폴더명 수정
		return dao.updateFolderName(sqlSession, f);
	}

	@Override
	public int deleteFolder(Folder f) {
		//폴더 삭제
		return dao.deleteFolder(sqlSession, f);
	}
	
	@Override
	public int deleteMember(Folder f) {
		//폴더 삭제시 참여자 삭제
		return dao.deleteMember(sqlSession, f);
	}


	@Override
	public List<Folder> selectFolderInfo(Folder f) {
		//todoL ist.jsp에 보여줄 폴더 정보 조회
		return dao.selectFolderInfo(sqlSession, f);
	}

	@Override
	public List<TodoList> selectListInfo(Folder f) {
		//todoList.jsp에 보여줄 리스트 정보 조회
		return dao.selectListInfo(sqlSession, f);
	}

	@Override
	public List<Card> selectCardInfo(Folder f) {
		//todoList.jsp에 보여줄 카드 정보 조회
		return dao.selectCardInfo(sqlSession, f);
	}

	@Override
	public List<Label> selectLabelInfo(Folder f) {
		//todoList.jsp에 보여줄 라벨 정보 조회
		return dao.selectLabelInfo(sqlSession, f);
	}
	
	@Override
	public List<Member> selectMemberInfo(Folder f) {
		//todoList.jsp에 보여줄 참여자 정보 조회
		return dao.selectMemberInfo(sqlSession, f);
	}

	@Override
	public int insertCard(Card c) {
		//카드 추가
		return dao.insertCard(sqlSession, c);
	}

	@Override
	public int insertList(TodoList li) {
		//리스트 추가
		return dao.insertList(sqlSession, li);
	}

	@Override
	public List<Card> selectDetailCardInfo(Card c) {
		//카드 상세보기 
		return dao.selectDetailCardInfo(sqlSession, c);
	}

	@Override
	public List<Checklist> selectDetailCheckInfo(Card c) {
		//카드 상세보기
		return dao.selectDetailCheckInfo(sqlSession, c);
	}

	@Override
	public List<Label> selectDetailLabelInfo(Card c) {
		//카드 상세보기
		return dao.selectDetailLabelInfo(sqlSession, c);
	}

	@Override
	public List<Reply> selectDetailReplyInfo(Card c) {
		//카드 상세보기
		return dao.selectDetailReplyInfo(sqlSession, c);
	}

	@Override
	public List<Attachment> selectDetailAttachInfo(Card c) {
		//카드 상세보기
		return dao.selectDetailAttachInfo(sqlSession, c);
	}

	@Override
	public int deleteList(TodoList li) {
		//리스트 삭제
		return dao.deleteList(sqlSession, li);
	}

	@Override
	public int deleteCard(Card c) {
		//카드 삭제
		return dao.deleteCard(sqlSession, c);
	}

	@Override
	public List<Member> selectParticipantList(Folder f) {
		//참여자 목록 불러오기
		return dao.selectParticipantList(sqlSession, f);
	}

	@Override
	public List<MemberDto> selectMemberList() {
		//참여자 추가 시 조직도 불러오기
		return dao.selectMemberList(sqlSession);
	}

	@Override
	public int insertParticipant(Member m) {
		//참여자 추가
		return dao.insertParticipant(sqlSession, m);
	}

	@Override
	public int deleteParticipant(Member m) {
		//참여자 삭제
		return dao.deleteParticipant(sqlSession, m);
	}

	@Override
	public int insertIncharge(Card c) {
		//담당자 추가
		return dao.insertIncharge(sqlSession, c);
	}

	@Override
	public List<Card> selectIncharge(Card c) {
		//담당자 불러오기
		return dao.selectIncharge(sqlSession, c);
	}

	@Override
	public int deleteIncharge(Card c) {
		//담당자 삭제
		return dao.deleteIncharge(sqlSession, c);
	}

	@Override
	public int insertChecklist(Checklist cl) {
		//체크리스트 추가
		return dao.insertChecklist(sqlSession, cl);
	}

	@Override
	public List<Checklist> selectChecklist(Checklist cl) {
		//체크리스트 불러오기
		return dao.selectChecklist(sqlSession, cl);
	}

	@Override
	public int updateCheckStatus(Checklist cl) {
		//체크리스트 체크 상태 업데이트
		return dao.updateCheckStatus(sqlSession, cl);
	}
	
	@Override
	public int uploadFile(Attachment file) {
		//파일 업로드
		return dao.uploadFile(sqlSession, file);
	}

	@Override
	public List<Attachment> selectFileList(Attachment file) {
		//파일 불러오기
		return dao.selectFileList(sqlSession, file);
	}

	@Override
	public Attachment downloadFile(String attachNo) {
		//파일 다운로드
		return dao.downloadFile(sqlSession, attachNo);
	}

	@Override
	public int deleteFile(Attachment file) {
		//파일 삭제
		return dao.deleteFile(sqlSession, file);
	}

	@Override
	public int insertLabel(Label lb) {
		//라벨 추가
		return dao.insertLabel(sqlSession, lb);
	}

	@Override
	public int insertDuedate(Card c) {
		//기한일 추가
		return dao.insertDuedate(sqlSession, c);
	}

	@Override
	public int deleteDuedate(String cardNo) {
		//기한일 삭제
		return dao.deleteDuedate(sqlSession, cardNo);
	}

	@Override
	public int insertDescription(Card c) {
		//설명 추가
		return dao.insertDescription(sqlSession, c);
	}

	@Override
	public int insertReply(Reply r) {
		//댓글 등록
		return dao.insertReply(sqlSession, r);
	}

	@Override
	public List<Reply> selectReplyList(Reply r) {
		//댓글 목록 불러오기
		return dao.selectReplyList(sqlSession, r);
	}

	@Override
	public int updateReply(Reply r) {
		//댓글 수정
		return dao.updateReply(sqlSession, r);
	}

	@Override
	public int deleteReply(Reply r) {
		//댓글 삭제
		return dao.deleteReply(sqlSession, r);
	}

	@Override
	public int updateChecklist(Checklist cl) {
		//체크리스트 수정
		return dao.updateChecklist(sqlSession, cl);
	}

	@Override
	public int deleteChecklist(Checklist cl) {
		//체크리스트 삭제
		return dao.deleteChecklist(sqlSession, cl);
	}

	@Override
	public int deleteLabel(Label lb) {
		//라벨 삭제
		return dao.deleteLabel(sqlSession, lb);
	}

	@Override
	public int updateListName(TodoList li) {
		//리스트 제목 수정
		return dao.updateListName(sqlSession, li);
	}

	@Override
	public int updateCardName(Card c) {
		//카드 제목 수정
		return dao.updateCardName(sqlSession, c);
	}

	@Override
	public List<Card> selectCardList(Card c) {
		//카드 추가 후 카드 목록 불러오기
		return dao.selectCardList(sqlSession, c);
	}

	@Override
	public List<Label> selectLabelList(Card c) {
		//카드 추가 후 라벨 정보 가져오기
		return dao.selectLabelList(sqlSession, c);
	}

}