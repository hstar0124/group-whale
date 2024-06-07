package com.kh.gw.approval.model.dao;

import java.sql.Timestamp;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.gw.approval.model.vo.ApprovalDocument;
import com.kh.gw.approval.model.vo.ApprovalLine;
import com.kh.gw.approval.model.vo.ApprovalStep;
import com.kh.gw.approval.model.vo.ApprovalVo;
import com.kh.gw.approval.model.vo.AttachmentApp;
import com.kh.gw.approval.model.vo.Authority;
import com.kh.gw.approval.model.vo.BoxList;
import com.kh.gw.approval.model.vo.CompanyDocumentBox;
import com.kh.gw.approval.model.vo.DocumentForm;
import com.kh.gw.approval.model.vo.ListCount;
import com.kh.gw.approval.model.vo.MostUseForm;
import com.kh.gw.approval.model.vo.PageInfo;
import com.kh.gw.approval.model.vo.Peruse;
import com.kh.gw.approval.model.vo.SearchCondition;
import com.kh.gw.member.model.vo.LoginUser;

public interface ApprovalDao {

	List<CompanyDocumentBox> selectCompanyDocList(SqlSessionTemplate sqlSession);

	List<DocumentForm> selectDocumentFormList(String cboxNo, SqlSessionTemplate sqlSession);

	DocumentForm selectOneDocumentForm(String formNo, SqlSessionTemplate sqlSession);
	
	int insertApprovalForm(ApprovalDocument adoc, SqlSessionTemplate sqlSession);

	int getListCount(ListCount lc, SqlSessionTemplate sqlSession);

	List<BoxList> selectTempBoxList(String empNo, PageInfo pi, SqlSessionTemplate sqlSession);

	ApprovalDocument selectOneApprovalDocument(String docNo, SqlSessionTemplate sqlSession);

	int insertMostUseForm(MostUseForm form, SqlSessionTemplate sqlSession);

	int mostUseFormCheck(MostUseForm form, SqlSessionTemplate sqlSession);

	List<MostUseForm> selectMostUseForm(String empNo, SqlSessionTemplate sqlSession);

	int deleteMostUseForm(MostUseForm form, SqlSessionTemplate sqlSession);

	LoginUser selectEmployeeInfo(String empNo, SqlSessionTemplate sqlSession);

	int insertApprovalLine(ApprovalLine line, SqlSessionTemplate sqlSession);

	int insertApprovalStep(List<ApprovalStep> list, SqlSessionTemplate sqlSession);

	int insertAttachmentApp(List<AttachmentApp> attachList, SqlSessionTemplate sqlSession);

	int getListCount(String empNo, SqlSessionTemplate sqlSession);

	List<BoxList> selectDraftBoxList(String empNo, PageInfo pi, SqlSessionTemplate sqlSession);

	List<ApprovalStep> selectApprovalStepList(String docNo, SqlSessionTemplate sqlSession);

	List<AttachmentApp> selectAttachmentAppList(String docNo, SqlSessionTemplate sqlSession);

	AttachmentApp selectOneAttachmentApp(String fileNo, SqlSessionTemplate sqlSession);

	int getAppWaitListCount(String empNo, SqlSessionTemplate sqlSession);

	int insertApproval(ApprovalVo app, SqlSessionTemplate sqlSession);

	int updateLineTurn(String lineNo, SqlSessionTemplate sqlSession);

	int updateDocRejectStatus(String docNo, SqlSessionTemplate sqlSession);

	int selectLineTurn(String lineNo, SqlSessionTemplate sqlSession);

	int selectStepCount(String lineNo, SqlSessionTemplate sqlSession);

	int updateDocCompleteStatus(String docNo, SqlSessionTemplate sqlSession);

	List<ApprovalVo> selectApprovalVoList(String docNo, SqlSessionTemplate sqlSession);

	String selectCurrentLineTurnEmp(String docNo, SqlSessionTemplate sqlSession);

	int getAppProceedListCount(String empNo, SqlSessionTemplate sqlSession);

	List<BoxList> selectAppProceedBoxList(String empNo, PageInfo pi, SqlSessionTemplate sqlSession);

	List<BoxList> selectAppWaitBoxList(String empNo, PageInfo pi, SqlSessionTemplate sqlSession);

	int getAppCompleteListCount(String empNo, SqlSessionTemplate sqlSession);

	List<BoxList> selectAppCompleteBoxList(String empNo, PageInfo pi, SqlSessionTemplate sqlSession);

	String selectCompleteTime(String docNo, SqlSessionTemplate sqlSession);

	int getAppRejctListCount(String empNo, SqlSessionTemplate sqlSession);

	List<BoxList> selectAppRejectBoxList(String empNo, PageInfo pi, SqlSessionTemplate sqlSession);

	List<BoxList> selectTopThreeDraftList(String empNo, SqlSessionTemplate sqlSession);

	List<BoxList> selectTopThreeProceedList(String empNo, SqlSessionTemplate sqlSession);

	List<BoxList> selectTopThreeCompleteList(String empNo, SqlSessionTemplate sqlSession);

	int insertPeruseList(List<Peruse> peruseList, SqlSessionTemplate sqlSession);

	int getAppRefListCount(String empNo, SqlSessionTemplate sqlSession);

	List<BoxList> selectAppRefBoxList(String empNo, PageInfo pi, SqlSessionTemplate sqlSession);

	List<DocumentForm> searchFormName(String formTitle, SqlSessionTemplate sqlSession);

	List<DocumentForm> selectDocumentFormListForAdmin(String cboxNo, SqlSessionTemplate sqlSession);

	int insertAuthority(Authority aut, SqlSessionTemplate sqlSession);

	List<Peruse> selectPeruseList(String docNo, SqlSessionTemplate sqlSession);

	List<Authority> selectAuthorityList(String empNo, PageInfo pi, SqlSessionTemplate sqlSession);

	int getAuthorityListCount(String empNo, SqlSessionTemplate sqlSession);

	int updateAutRejectStatus(String docNo, SqlSessionTemplate sqlSession);

	int updateAutCompleteStatus(String docNo, SqlSessionTemplate sqlSession);

	String selectAuthorityEmp(String docNo, SqlSessionTemplate sqlSession);

	int insertPeruseAfterRead(Peruse pu, SqlSessionTemplate sqlSession);

	int updatePeruse(Peruse pu, SqlSessionTemplate sqlSession);

	int updateDelegateLineTurn(String lineNo, SqlSessionTemplate sqlSession);

	List<BoxList> selectAppPlanBoxList(String empNo, PageInfo pi, SqlSessionTemplate sqlSession);

	ApprovalLine selectApprovalLine(String docNo, SqlSessionTemplate sqlSession);

	int updateDelegateLine(String lineNo, SqlSessionTemplate sqlSession);

	List<String> selectNotApprovalEmp(String docNo, SqlSessionTemplate sqlSession);

	List<BoxList> selectTopFiveDraftList(String empNo, SqlSessionTemplate sqlSession);

	int getAppPlanListCount(String empNo, SqlSessionTemplate sqlSession);

	int getSearchCompleteListCount(SearchCondition sc, SqlSessionTemplate sqlSession);

	List<BoxList> selectSearchCompleteBoxList(SearchCondition sc, PageInfo pi, SqlSessionTemplate sqlSession);

	List<ApprovalLine> selectSaveLineList(String empNo, SqlSessionTemplate sqlSession);

	List<ApprovalStep> selectOneMyLine(String lineNo, SqlSessionTemplate sqlSession);

	int insertSaveMyLine(ApprovalLine line, SqlSessionTemplate sqlSession);

	int updateApprovalDocument(ApprovalDocument doc, SqlSessionTemplate sqlSession);





}
