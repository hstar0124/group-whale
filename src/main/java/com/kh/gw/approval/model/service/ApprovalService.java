package com.kh.gw.approval.model.service;

import java.util.List;

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

public interface ApprovalService {

	List<CompanyDocumentBox> selectCompanyDocList();

	List<DocumentForm> selectDocumentFormList(String cboxNo);

	DocumentForm selectOneDocumentForm(String formNo);
	
	int insertApprovalForm(ApprovalDocument ad);

	int getListCount(ListCount lc);

	List<BoxList> selectTempBoxList(String empNo, PageInfo pi);

	ApprovalDocument selectOneApprovalDocument(String docNo);

	int insertMostUseForm(MostUseForm form);

	int mostUseFormCheck(MostUseForm form);

	List<MostUseForm> selectMostUseForm(String empNo);

	int deleteMostUseForm(MostUseForm form);

	LoginUser selectEmployeeInfo(String empNo);

	int insertApprovalForm(ApprovalLine line, List<ApprovalStep> list, ApprovalDocument adoc, List<AttachmentApp> attachList, List<Peruse> peruseList);

	int getListCount(String empNo);

	List<BoxList> selectDraftBoxList(String empNo, PageInfo pi);

	List<ApprovalStep> selectApprovalStepList(String docNo);

	List<AttachmentApp> selectAttachmentAppList(String docNo);

	AttachmentApp selectOneAttachmentApp(String fileNo);

	int getAppWaitListCount(String empNo);

	List<BoxList> selectAppWaitBoxList(String empNo, PageInfo pi);

	int insertApproval(ApprovalVo app, String formNo);

	List<ApprovalVo> selectApprovalVoList(String docNo);

	String selectCurrentLineTurnEmp(String docNo);

	int getAppProceedListCount(String empNo);

	List<BoxList> selectAppProceedBoxList(String empNo, PageInfo pi);

	int getAppCompleteListCount(String empNo);

	List<BoxList> selectAppCompleteBoxList(String empNo, PageInfo pi);

	int getAppRejectListCount(String empNo);

	List<BoxList> selectAppRejectBoxList(String empNo, PageInfo pi);

	List<BoxList> selectTopThreeDraftList(String empNo);

	List<BoxList> selectTopThreeProceedList(String empNo);

	List<BoxList> selectTopThreeCompleteList(String empNo);

	int getAppRefListCount(String empNo);

	List<BoxList> selectAppRefBoxList(String empNo, PageInfo pi);

	List<DocumentForm> searchFormName(String formTitle);

	List<DocumentForm> selectDocumentFormListForAdmin(String cboxNo);

	int insertAuthorityApproval(ApprovalLine line, List<ApprovalStep> list, ApprovalDocument adoc,
			List<AttachmentApp> attachList, List<Peruse> peruseList, Authority aut);

	List<Peruse> selectPeruseList(String docNo);

	List<Authority> selectAuthorityList(String empNo, PageInfo pi);

	int getAuthorityListCount(String empNo);

	String selectAuthorityEmp(String docNo);

	int insertAfterRead(ApprovalVo app, Peruse pu);

	List<BoxList> selectAppPlanBoxList(String empNo, PageInfo pi);

	ApprovalLine selectApprovalLine(String docNo);

	List<BoxList> selectTopFiveDraftList(String empNo);

	int getAppPlanListCount(String empNo);

	int getSearchCompleteListCount(SearchCondition sc);

	List<BoxList> selectSearchCompleteBoxList(SearchCondition sc, PageInfo pi);

	List<ApprovalLine> selectSaveLineList(String empNo);

	List<ApprovalStep> selectOneMyLine(String lineNo);

	int insertSaveMyLine(ApprovalLine line, List<ApprovalStep> list);

	int updateApprovalDocument(ApprovalDocument doc);






}
