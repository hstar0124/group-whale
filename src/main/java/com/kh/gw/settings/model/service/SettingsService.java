package com.kh.gw.settings.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.gw.approval.model.vo.CompanyDocumentBox;
import com.kh.gw.approval.model.vo.DocumentForm;
import com.kh.gw.member.model.vo.Duty;
import com.kh.gw.member.model.vo.DutyList;
import com.kh.gw.member.model.vo.Member;
import com.kh.gw.member.model.vo.Position;
import com.kh.gw.member.model.vo.PositionList;
import com.kh.gw.settings.model.vo.CountMember;
import com.kh.gw.settings.model.vo.Department;
import com.kh.gw.settings.model.vo.Manager;
import com.kh.gw.settings.model.vo.MemberDto;
import com.kh.gw.settings.model.vo.MoveDepartment;
import com.kh.gw.settings.model.vo.PageInfo;

public interface SettingsService {

	List<Department> selectDeptList();

	int DeptNameCheck(Department deptNameCheck);

	int insertDept(Department d);

	int deleteDept(Department d);

	List<MemberDto> selectMemberList();

	List<MemberDto> selectMemberListInDept(MemberDto mdt);

	String selectOneEmpNo(String empName);

	String selectOneDeptNo(String deptName);

	int updateEmpDept(List<MoveDepartment> list);

	int getListCount();

	List<MemberDto> selectMemberList(PageInfo pi);

	List<PositionList> selectPositionList(PageInfo pi);

	int getPositionListCount();

	List<DutyList> selectDutyList();

	int positionNoCheck(Position position);

	int positionNameCheck(Position position);

	int insertPosition(Position position);

	int deletePosition(Position position);

	int dutyCheck(Duty duty);

	int insertDuty(Duty duty);

	int deleteDuty(Duty duty);

	CountMember selectMemberCount();

	List<Manager> selectManagerList();

	int selectManagerCount();

	int insertManager(List<Manager> list);

	int deleteManager(List<Manager> list);

	int selectMatching(MemberDto m);

	int deleteMember(List<MemberDto> list);

	int folderNameCheck(String folderName);

	int insertcboxName(CompanyDocumentBox box);

	int delFolderCheck(String cboxNo);

	int deleteCboxName(String cboxNo);

	int insertDocumentForm(DocumentForm form);

	int deleteDocumentForm(String[] formNoList);

	DocumentForm selectOneDocumentForm(String formNo);

	int updateDocumentForm(DocumentForm form);

	int selectMemberMatchingInDept(String deptName);

	int updatecboxName(CompanyDocumentBox box);

	int selectManagerCheck(String empNo);

}
