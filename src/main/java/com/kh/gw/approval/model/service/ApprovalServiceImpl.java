package com.kh.gw.approval.model.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.gw.approval.model.dao.ApprovalDao;
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

@Service
public class ApprovalServiceImpl implements ApprovalService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private ApprovalDao ad;
	
	@Override
	public List<CompanyDocumentBox> selectCompanyDocList() {

		return ad.selectCompanyDocList(sqlSession);
	}

	@Override
	public List<DocumentForm> selectDocumentFormList(String cboxNo) {

		return ad.selectDocumentFormList(cboxNo, sqlSession);
	}

	@Override
	public DocumentForm selectOneDocumentForm(String formNo) {

		return ad.selectOneDocumentForm(formNo, sqlSession);
	}

	@Override
	public int insertApprovalForm(ApprovalDocument adoc) {

		return ad.insertApprovalForm(adoc, sqlSession);
	}


	@Override
	public int getListCount(ListCount lc) {

		return ad.getListCount(lc, sqlSession);
	}

	@Override
	public List<BoxList> selectTempBoxList(String empNo, PageInfo pi) {

		return ad.selectTempBoxList(empNo, pi, sqlSession);
	}

	@Override
	public ApprovalDocument selectOneApprovalDocument(String docNo) {

		return ad.selectOneApprovalDocument(docNo, sqlSession);
	}

	@Override
	public int insertMostUseForm(MostUseForm form) {

		return ad.insertMostUseForm(form, sqlSession);
	}

	@Override
	public int mostUseFormCheck(MostUseForm form) {

		return ad.mostUseFormCheck(form, sqlSession);
	}

	@Override
	public List<MostUseForm> selectMostUseForm(String empNo) {

		return ad.selectMostUseForm(empNo, sqlSession);
	}

	@Override
	public int deleteMostUseForm(MostUseForm form) {

		return ad.deleteMostUseForm(form, sqlSession);
	}

	@Override
	public LoginUser selectEmployeeInfo(String empNo) {

		return ad.selectEmployeeInfo(empNo, sqlSession);
	}

	@Override
	public int insertApprovalForm(ApprovalLine line, List<ApprovalStep> list, ApprovalDocument adoc, List<AttachmentApp> attachList, List<Peruse> peruseList) {

		int result = 0;
		
		//결재선 저장
		int result1 = ad.insertApprovalLine(line, sqlSession);

		//System.out.println("line vo - lineNo : " + line.getLineNo());
		
		for(int i = 0; i < list.size(); i++) {
			list.get(i).setLineNo(line.getLineNo());
		}
		
		//결재단계 저장
		int result2 = ad.insertApprovalStep(list, sqlSession);
		
		for(int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
		}
		String stepNo = list.get(list.size()-1).getStepNo();
		
		adoc.setLineNo(line.getLineNo());
		
		//결재문서 저장
		int result3 = ad.insertApprovalForm(adoc, sqlSession);
		
		for(int i = 0; i < attachList.size(); i++) {
			attachList.get(i).setDocNo(adoc.getDocNo());
		}
		for(int i = 0; i < peruseList.size(); i++) {
			peruseList.get(i).setDocNo(adoc.getDocNo());
		}
		
		//참조자&열람자 저장
		int result4 = ad.insertPeruseList(peruseList, sqlSession);
		
		//첨부파일 저장
		int result5 = ad.insertAttachmentApp(attachList, sqlSession);
		
		result = result1 + result2 + result3 + result4 + result5;
		
		return result;
	}

	@Override
	public int getListCount(String empNo) {

		return ad.getListCount(empNo, sqlSession);
	}

	@Override
	public List<BoxList> selectDraftBoxList(String empNo, PageInfo pi) {
		
		return ad.selectDraftBoxList(empNo, pi, sqlSession);
	}

	@Override
	public List<ApprovalStep> selectApprovalStepList(String docNo) {

		return ad.selectApprovalStepList(docNo, sqlSession);
	}

	@Override
	public List<AttachmentApp> selectAttachmentAppList(String docNo) {

		return ad.selectAttachmentAppList(docNo, sqlSession);
	}

	@Override
	public AttachmentApp selectOneAttachmentApp(String fileNo) {

		return ad.selectOneAttachmentApp(fileNo, sqlSession);
	}

	@Override
	public int getAppWaitListCount(String empNo) {

		return ad.getAppWaitListCount(empNo, sqlSession);
	}

	@Override
	public List<BoxList> selectAppWaitBoxList(String empNo, PageInfo pi) {

		return ad.selectAppWaitBoxList(empNo, pi, sqlSession);
	}

	@Override
	public int insertApproval(ApprovalVo app, String formNo) {
		
		int result = 0;
		int result1 = 0;
		int result2 = 0;
		int result3 = 0;
		int result4 = 0;
		int result5 = 0;
		int result6 = 0;
		int result7 = 0;
		int result8 = 0;
		int result9 = 0;
		int result10 = 0;
		int result11 = 0;
		int result12 = 0;
		int result13 = 0;
		int result14 = 0;
		int result15 = 0;
	
		if(app.getAppResult() == 3) {
			//보류시
			//결재테이블 기록 insert
			result1 = ad.insertApproval(app, sqlSession);
			
		} else if(app.getAppResult() == 2) {
			//반려시
			
			//결재선 테이블에서 현재순서 +1 update
			result2 = ad.updateLineTurn(app.getLineNo(), sqlSession);
			
			//결재테이블 기록 insert
			result3 = ad.insertApproval(app, sqlSession);

			//결재문서상태 반려로 update
			result4 = ad.updateDocRejectStatus(app.getDocNo(), sqlSession);
			
			//부재/위임관련 결재 일 경우 위임테이블 승인여부 반려로 update
			if(formNo.equals("25")) {
				result5 = ad.updateAutRejectStatus(app.getDocNo(), sqlSession);
			}
			
		} else if(app.getAppResult() == 1) {
			//승인시
			//결재선테이블에서 현재순서+1 update
			result6 = ad.updateLineTurn(app.getLineNo(), sqlSession);

			//결재테이블 기록 insert
			result7 = ad.insertApproval(app, sqlSession);

			//현재 순서가 결재단계 count(*)한거랑 같으면 결재상태 승인으로 update
			int currentTurn = ad.selectLineTurn(app.getLineNo(), sqlSession);
			int totalCount = ad.selectStepCount(app.getLineNo(), sqlSession);
			if(currentTurn == totalCount) {
				result8 = ad.updateDocCompleteStatus(app.getDocNo(), sqlSession);
				
				//부재/위임관련 결재 일 경우 위임테이블 승인여부 승인으로 update
				if(formNo.equals("25")) {
					result9 = ad.updateAutCompleteStatus(app.getDocNo(), sqlSession);
				}
			}
		} else if(app.getAppResult() == 5) {
			//전결시
			//결재선테이블에서 현재순서를 마지막 순서로 update
			result11 = ad.updateDelegateLine(app.getLineNo(), sqlSession);
			
			//결재테이블 기록 insert
			result12 = ad.insertApproval(app, sqlSession);
			
			//결재 상태 승인으로 update
			result13 = ad.updateDocCompleteStatus(app.getDocNo(), sqlSession);
			
			//부재/위임관련 결재일 경우 위임 테이블 승인 여부 승인으로 update
			if(formNo.equals("25")) {
				result14 = ad.updateAutCompleteStatus(app.getDocNo(), sqlSession);
			}
			
			//결재하지 않은 사원은 후열 처리
			List<String> notApprovalEmp = ad.selectNotApprovalEmp(app.getDocNo(), sqlSession);
			
			for(int i = 0; i < notApprovalEmp.size(); i++) {
				Peruse pu = new Peruse();
				pu.setDocNo(app.getDocNo());
				pu.setPerKind(2);
				pu.setPerType(0);
				pu.setEmpNo(notApprovalEmp.get(i));
				result15 += ad.insertPeruseAfterRead(pu, sqlSession);
			}
		}
		
		if(app.getAbsenceStatus().equals("y")) {
			Peruse pu = new Peruse();
			
			pu.setDocNo(app.getDocNo());
			pu.setPerKind(2);
			pu.setPerType(0);
			pu.setEmpNo(app.getEmpNo());
			
			result10 = ad.insertPeruseAfterRead(pu, sqlSession);
		}
		
		result = result1 + result2 + result3 + result4 + result5 + result6 + result7 + result8 + result9 + result10 + result11 + result12 + result13 + result14 + result15;
		return result;
	}

	@Override
	public List<ApprovalVo> selectApprovalVoList(String docNo) {
		
		return ad.selectApprovalVoList(docNo, sqlSession);
	}

	@Override
	public String selectCurrentLineTurnEmp(String docNo) {

		return ad.selectCurrentLineTurnEmp(docNo, sqlSession);
	}

	@Override
	public int getAppProceedListCount(String empNo) {

		return ad.getAppProceedListCount(empNo, sqlSession);
	}

	@Override
	public List<BoxList> selectAppProceedBoxList(String empNo, PageInfo pi) {

		return ad.selectAppProceedBoxList(empNo, pi, sqlSession);
	}

	@Override
	public int getAppCompleteListCount(String empNo) {

		return ad.getAppCompleteListCount(empNo, sqlSession);
	}

	@Override
	public List<BoxList> selectAppCompleteBoxList(String empNo, PageInfo pi) {
		
		List<BoxList> boxList = ad.selectAppCompleteBoxList(empNo, pi, sqlSession);
		
		for(int i = 0; i < boxList.size(); i++) {
			String time = ad.selectCompleteTime(boxList.get(i).getDocNo(), sqlSession);
			//System.out.println("time : " + time);
			boxList.get(i).setCompleteDate(time);
		}
		return boxList;
	}

	@Override
	public int getAppRejectListCount(String empNo) {

		return ad.getAppRejctListCount(empNo, sqlSession);
	}

	@Override
	public List<BoxList> selectAppRejectBoxList(String empNo, PageInfo pi) {

		List<BoxList> boxList = ad.selectAppRejectBoxList(empNo, pi, sqlSession);
		
		for(int i = 0; i < boxList.size(); i++) {
			String time = ad.selectCompleteTime(boxList.get(i).getDocNo(), sqlSession);

			boxList.get(i).setCompleteDate(time);
		}
		return boxList;
	}

	@Override
	public List<BoxList> selectTopThreeDraftList(String empNo) {

		return ad.selectTopThreeDraftList(empNo, sqlSession);
	}

	@Override
	public List<BoxList> selectTopThreeProceedList(String empNo) {

		return ad.selectTopThreeProceedList(empNo, sqlSession);
	}

	@Override
	public List<BoxList> selectTopThreeCompleteList(String empNo) {

		List<BoxList> boxList = ad.selectTopThreeCompleteList(empNo, sqlSession);
		
		for(int i = 0; i < boxList.size(); i++) {
			String time = ad.selectCompleteTime(boxList.get(i).getDocNo(), sqlSession);

			boxList.get(i).setCompleteDate(time);
		}
		
		return boxList;
	}

	@Override
	public int getAppRefListCount(String empNo) {
		
		return ad.getAppRefListCount(empNo, sqlSession);
	}
	
	@Override
	public List<BoxList> selectAppRefBoxList(String empNo, PageInfo pi) {

		return ad.selectAppRefBoxList(empNo, pi, sqlSession);
	}

	@Override
	public List<DocumentForm> searchFormName(String formTitle) {

		return ad.searchFormName(formTitle, sqlSession);
	}

	@Override
	public List<DocumentForm> selectDocumentFormListForAdmin(String cboxNo) {

		return ad.selectDocumentFormListForAdmin(cboxNo, sqlSession);
	}

	@Override
	public int insertAuthorityApproval(ApprovalLine line, List<ApprovalStep> list, ApprovalDocument adoc,
			List<AttachmentApp> attachList, List<Peruse> peruseList, Authority aut) {
		
		int result = 0;
		
		//결재선 저장
		int result1 = ad.insertApprovalLine(line, sqlSession);

		
		for(int i = 0; i < list.size(); i++) {
			list.get(i).setLineNo(line.getLineNo());
		}
		
		//결재단계 저장
		int result2 = ad.insertApprovalStep(list, sqlSession);
		
		for(int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
		}
		String stepNo = list.get(list.size()-1).getStepNo();
		
		adoc.setLineNo(line.getLineNo());
		
		//결재문서 저장
		int result3 = ad.insertApprovalForm(adoc, sqlSession);
		
		for(int i = 0; i < attachList.size(); i++) {
			attachList.get(i).setDocNo(adoc.getDocNo());
		}
		for(int i = 0; i < peruseList.size(); i++) {
			peruseList.get(i).setDocNo(adoc.getDocNo());
		}
		
		aut.setDocNo(adoc.getDocNo());
		
		//참조자&열람자 저장
		int result4 = ad.insertPeruseList(peruseList, sqlSession);
		
		//첨부파일 저장
		int result5 = ad.insertAttachmentApp(attachList, sqlSession);
		
		//부재/위임 저장
		int result6 = ad.insertAuthority(aut, sqlSession);
		
		result = result1 + result2 + result3 + result5 + result6;
		
		return result;
	}

	@Override
	public List<Peruse> selectPeruseList(String docNo) {

		return ad.selectPeruseList(docNo, sqlSession);
	}

	@Override
	public List<Authority> selectAuthorityList(String empNo, PageInfo pi) {

		return ad.selectAuthorityList(empNo, pi, sqlSession);
	}

	@Override
	public int getAuthorityListCount(String empNo) {

		return ad.getAuthorityListCount(empNo, sqlSession);
	}

	@Override
	public String selectAuthorityEmp(String docNo) {

		return ad.selectAuthorityEmp(docNo, sqlSession);
	}

	@Override
	public int insertAfterRead(ApprovalVo app, Peruse pu) {
		
		int result = 0;
		int result1 = ad.insertApproval(app, sqlSession);
		int result2 = ad.updatePeruse(pu, sqlSession);

		result = result1 + result2;
		
		return result;
	}

	@Override
	public List<BoxList> selectAppPlanBoxList(String empNo, PageInfo pi) {

		return ad.selectAppPlanBoxList(empNo, pi, sqlSession);
	}

	@Override
	public ApprovalLine selectApprovalLine(String docNo) {

		return ad.selectApprovalLine(docNo, sqlSession);
	}

	@Override
	public List<BoxList> selectTopFiveDraftList(String empNo) {

		return ad.selectTopFiveDraftList(empNo, sqlSession);
	}

	@Override
	public int getAppPlanListCount(String empNo) {

		return ad.getAppPlanListCount(empNo, sqlSession);
	}

	@Override
	public int getSearchCompleteListCount(SearchCondition sc) {

		return ad.getSearchCompleteListCount(sc, sqlSession);
	}

	@Override
	public List<BoxList> selectSearchCompleteBoxList(SearchCondition sc, PageInfo pi) {

		List<BoxList> boxList = ad.selectSearchCompleteBoxList(sc, pi, sqlSession);
		
		for(int i = 0; i < boxList.size(); i++) {
			String time = ad.selectCompleteTime(boxList.get(i).getDocNo(), sqlSession);

			boxList.get(i).setCompleteDate(time);
		}
		return boxList;
	}

	@Override
	public List<ApprovalLine> selectSaveLineList(String empNo) {

		return ad.selectSaveLineList(empNo, sqlSession);
	}

	@Override
	public List<ApprovalStep> selectOneMyLine(String lineNo) {

		return ad.selectOneMyLine(lineNo, sqlSession);
	}

	@Override
	public int insertSaveMyLine(ApprovalLine line, List<ApprovalStep> list) {

		int result = 0;
		
		//결재선 저장
		int result1 = ad.insertSaveMyLine(line, sqlSession);

				
		for(int i = 0; i < list.size(); i++) {
			list.get(i).setLineNo(line.getLineNo());
		}
				
		//결재단계 저장
		int result2 = ad.insertApprovalStep(list, sqlSession);
				
		
		result = result1 + result2;
		
		return result;
	}

	@Override
	public int updateApprovalDocument(ApprovalDocument doc) {

		return ad.updateApprovalDocument(doc, sqlSession);
	}





	




}
