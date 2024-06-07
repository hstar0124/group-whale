package com.kh.gw.approval.model.dao;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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

@Repository
public class ApprovalDaoImpl implements ApprovalDao {

	@Override
	public List<CompanyDocumentBox> selectCompanyDocList(SqlSessionTemplate sqlSession) {

		return sqlSession.selectList("Approval.selectCompanyDocList");
	}

	@Override
	public List<DocumentForm> selectDocumentFormList(String cboxNo, SqlSessionTemplate sqlSession) {

		return sqlSession.selectList("Approval.selectDocumentFormList", cboxNo);
	}

	@Override
	public DocumentForm selectOneDocumentForm(String formNo, SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("Approval.selectOneDocumentForm", formNo);
	}

	@Override
	public int insertApprovalForm(ApprovalDocument adoc, SqlSessionTemplate sqlSession) {
		
		return sqlSession.insert("Approval.insertApprovalForm", adoc);
	}


	@Override
	public int getListCount(ListCount lc, SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("Approval.selectListCount", lc);
	}

	@Override
	public List<BoxList> selectTempBoxList(String empNo, PageInfo pi, SqlSessionTemplate sqlSession) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return sqlSession.selectList("Approval.selectTempBoxList", empNo, rowBounds);
	}

	@Override
	public ApprovalDocument selectOneApprovalDocument(String docNo, SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("Approval.selectOneApprovalDocument", docNo);
	}

	@Override
	public int insertMostUseForm(MostUseForm form, SqlSessionTemplate sqlSession) {

		return sqlSession.insert("Approval.insertMostUseForm", form);
	}

	@Override
	public int mostUseFormCheck(MostUseForm form, SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("Approval.mostUseFormCheck", form);
	}

	@Override
	public List<MostUseForm> selectMostUseForm(String empNo, SqlSessionTemplate sqlSession) {

		return sqlSession.selectList("Approval.selectMostUseForm", empNo);
	}

	@Override
	public int deleteMostUseForm(MostUseForm form, SqlSessionTemplate sqlSession) {

		return sqlSession.delete("Approval.deleteMostUseForm", form);
	}

	@Override
	public LoginUser selectEmployeeInfo(String empNo, SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("Approval.selectEmployeeInfo", empNo);
	}

	@Override
	public int insertApprovalLine(ApprovalLine line, SqlSessionTemplate sqlSession) {

		return sqlSession.insert("Approval.insertApprovalLine", line);
	}

	@Override
	public int insertApprovalStep(List<ApprovalStep> list, SqlSessionTemplate sqlSession) {

		int result = 0;
		int length = 0;
		
		for(int i = 0 ; i < list.size(); i++) {
			int result1 = sqlSession.insert("Approval.insertApprovalStep",list.get(i));
			length += result1;
		}
		if(length == list.size()) {
			result = length;
			return result;
		}else {
			return 0;
		}
	}

	@Override
	public int insertAttachmentApp(List<AttachmentApp> attachList, SqlSessionTemplate sqlSession) {

		int result = 0;
		int length = 0;
		
		for(int i = 0; i < attachList.size(); i++) {
			int result1 = sqlSession.insert("Approval.insertAttachmentApp", attachList.get(i));
			length += result1;
		}
		
		if(length == attachList.size()) {
			result = length;
			return result;
		} else {
			return 0;
		}
	}

	@Override
	public int getListCount(String empNo, SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("Approval.selectListCountWithoutStatus", empNo);
	}

	@Override
	public List<BoxList> selectDraftBoxList(String empNo, PageInfo pi, SqlSessionTemplate sqlSession) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return sqlSession.selectList("Approval.selectDraftBoxList", empNo, rowBounds);
	}

	@Override
	public List<ApprovalStep> selectApprovalStepList(String docNo, SqlSessionTemplate sqlSession) {

		return sqlSession.selectList("Approval.selectApprovalStepList", docNo);
	}

	@Override
	public List<AttachmentApp> selectAttachmentAppList(String docNo, SqlSessionTemplate sqlSession) {

		return sqlSession.selectList("Approval.selectAttachmentAppList", docNo);
	}

	@Override
	public AttachmentApp selectOneAttachmentApp(String fileNo, SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("Approval.selectOneAttachmentApp", fileNo);
	}

	@Override
	public int getAppWaitListCount(String empNo, SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("Approval.selectAppWaitListCount", empNo);
	}

	@Override
	public List<BoxList> selectAppWaitBoxList(String empNo, PageInfo pi, SqlSessionTemplate sqlSession) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return sqlSession.selectList("Approval.selectAppWaitBoxList", empNo, rowBounds);
	}

	@Override
	public int insertApproval(ApprovalVo app, SqlSessionTemplate sqlSession) {

		return sqlSession.insert("Approval.insertApproval", app);
	}

	@Override
	public int updateLineTurn(String lineNo, SqlSessionTemplate sqlSession) {

		return sqlSession.update("Approval.updateLineTurn", lineNo);
	}

	@Override
	public int updateDocRejectStatus(String docNo, SqlSessionTemplate sqlSession) {

		return sqlSession.update("Approval.updateDocRejectStatus", docNo);
	}

	@Override
	public int selectLineTurn(String lineNo, SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("Approval.selectLineTurn", lineNo);
	}

	@Override
	public int selectStepCount(String lineNo, SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("Approval.selectStepCount", lineNo);
	}

	@Override
	public int updateDocCompleteStatus(String docNo, SqlSessionTemplate sqlSession) {

		return sqlSession.update("Approval.updateDocCompleteStatus", docNo);
	}

	@Override
	public List<ApprovalVo> selectApprovalVoList(String docNo, SqlSessionTemplate sqlSession) {

		return sqlSession.selectList("Approval.selectApprovalVoList", docNo);
	}


	@Override
	public String selectCurrentLineTurnEmp(String docNo, SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("Approval.selectCurrentLineTurnEmp", docNo);
	}

	@Override
	public int getAppProceedListCount(String empNo, SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("Approval.selectAppProceedListCount", empNo);
	}

	@Override
	public List<BoxList> selectAppProceedBoxList(String empNo, PageInfo pi, SqlSessionTemplate sqlSession) {

		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return sqlSession.selectList("Approval.selectAppProceedBoxList", empNo, rowBounds);
	}

	@Override
	public int getAppCompleteListCount(String empNo, SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("Approval.selectAppCompleteListCount", empNo);
	}

	@Override
	public List<BoxList> selectAppCompleteBoxList(String empNo, PageInfo pi, SqlSessionTemplate sqlSession) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return sqlSession.selectList("Approval.selectAppCompleteBoxList", empNo, rowBounds);
	}

	@Override
	public String selectCompleteTime(String docNo, SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("Approval.selectCompleteTime", docNo);
	}

	@Override
	public int getAppRejctListCount(String empNo, SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("Approval.selectAppRejectListCount", empNo);
	}

	@Override
	public List<BoxList> selectAppRejectBoxList(String empNo, PageInfo pi, SqlSessionTemplate sqlSession) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return sqlSession.selectList("Approval.selectAppRejectBoxList", empNo, rowBounds);
	}

	@Override
	public List<BoxList> selectTopThreeDraftList(String empNo, SqlSessionTemplate sqlSession) {

		return sqlSession.selectList("Approval.selectTopThreeDraftList", empNo);
	}

	@Override
	public List<BoxList> selectTopThreeProceedList(String empNo, SqlSessionTemplate sqlSession) {

		return sqlSession.selectList("Approval.selectTopThreeProceedList", empNo);
	}

	@Override
	public List<BoxList> selectTopThreeCompleteList(String empNo, SqlSessionTemplate sqlSession) {

		return sqlSession.selectList("Approval.selectTopThreeCompleteList", empNo);
	}

	@Override
	public int insertPeruseList(List<Peruse> peruseList, SqlSessionTemplate sqlSession) {
		
		int result = 0;
		int length = 0;
		
		for(int i = 0 ; i < peruseList.size(); i++) {
			int result1 = sqlSession.insert("Approval.insertPeruseList", peruseList.get(i));
			length += result1;
		}
		if(length == peruseList.size()) {
			result = length;
			return result;
		}else {
			return 0;
		}
	}

	@Override
	public int getAppRefListCount(String empNo, SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("Approval.selectAppRefListCount", empNo);
	}
	
	@Override
	public List<BoxList> selectAppRefBoxList(String empNo, PageInfo pi, SqlSessionTemplate sqlSession) {

		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return sqlSession.selectList("Approval.selectAppRefBoxList", empNo, rowBounds);
	}

	@Override
	public List<DocumentForm> searchFormName(String formTitle, SqlSessionTemplate sqlSession) {

		return sqlSession.selectList("Approval.searchFormName", formTitle);
	}

	@Override
	public List<DocumentForm> selectDocumentFormListForAdmin(String cboxNo, SqlSessionTemplate sqlSession) {

		return sqlSession.selectList("Approval.selectDocumentFormAdmin", cboxNo);
	}

	@Override
	public int insertAuthority(Authority aut, SqlSessionTemplate sqlSession) {

		return sqlSession.insert("Approval.insertAuthority", aut);
	}

	@Override
	public List<Peruse> selectPeruseList(String docNo, SqlSessionTemplate sqlSession) {

		return sqlSession.selectList("Approval.selectPeruseList", docNo);
	}

	@Override
	public List<Authority> selectAuthorityList(String empNo, PageInfo pi, SqlSessionTemplate sqlSession) {

		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return sqlSession.selectList("Approval.selectAuthorityList", empNo, rowBounds);
	}

	@Override
	public int getAuthorityListCount(String empNo, SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("Approval.selectAuthorityListCount", empNo);
	}

	@Override
	public int updateAutRejectStatus(String docNo, SqlSessionTemplate sqlSession) {

		return sqlSession.update("Approval.updateAutRejectStatus", docNo);
	}

	@Override
	public int updateAutCompleteStatus(String docNo, SqlSessionTemplate sqlSession) {

		return sqlSession.update("Approval.updateAutCompleteStatus", docNo);
	}

	@Override
	public String selectAuthorityEmp(String docNo, SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("Approval.selectAuthorityEmp", docNo);
	}

	@Override
	public int insertPeruseAfterRead(Peruse pu, SqlSessionTemplate sqlSession) {

		return sqlSession.insert("Approval.insertPeruseList", pu);
	}

	@Override
	public int updatePeruse(Peruse pu, SqlSessionTemplate sqlSession) {

		return sqlSession.update("Approval.updatePeruse", pu);
	}

	@Override
	public int updateDelegateLineTurn(String lineNo, SqlSessionTemplate sqlSession) {

		return sqlSession.update("Approval.updateDelegateLineTurn", lineNo);
	}

	@Override
	public List<BoxList> selectAppPlanBoxList(String empNo, PageInfo pi, SqlSessionTemplate sqlSession) {

		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return sqlSession.selectList("Approval.selectAppPlanBoxList", empNo, rowBounds);
	}

	@Override
	public ApprovalLine selectApprovalLine(String docNo, SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("Approval.selectApprovalLine", docNo);
	}

	@Override
	public int updateDelegateLine(String lineNo, SqlSessionTemplate sqlSession) {

		return sqlSession.update("Approval.updateDelegateLine", lineNo);
	}

	@Override
	public List<String> selectNotApprovalEmp(String docNo, SqlSessionTemplate sqlSession) {

		return sqlSession.selectList("Approval.selectNotApprovalEmp", docNo);
	}

	@Override
	public List<BoxList> selectTopFiveDraftList(String empNo, SqlSessionTemplate sqlSession) {

		return sqlSession.selectList("Approval.selectTopFiveDraftList", empNo);
	}

	@Override
	public int getAppPlanListCount(String empNo, SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("Approval.selectAppPlanListCount", empNo);
	}

	@Override
	public int getSearchCompleteListCount(SearchCondition sc, SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("Approval.selectSearchCompleteListCount", sc);
	}

	@Override
	public List<BoxList> selectSearchCompleteBoxList(SearchCondition sc, PageInfo pi, SqlSessionTemplate sqlSession) {

		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return sqlSession.selectList("Approval.selectSearchCompleteBoxList", sc, rowBounds);
	}

	@Override
	public List<ApprovalLine> selectSaveLineList(String empNo, SqlSessionTemplate sqlSession) {

		return sqlSession.selectList("Approval.selectSaveLineList", empNo);
	}

	@Override
	public List<ApprovalStep> selectOneMyLine(String lineNo, SqlSessionTemplate sqlSession) {

		return sqlSession.selectList("Approval.selectOneMyLine", lineNo);
	}

	@Override
	public int insertSaveMyLine(ApprovalLine line, SqlSessionTemplate sqlSession) {

		return sqlSession.insert("Approval.insertSaveMyLine", line);
	}

	@Override
	public int updateApprovalDocument(ApprovalDocument doc, SqlSessionTemplate sqlSession) {

		return sqlSession.update("Approval.updateApprovalDocument", doc);
	}






}
