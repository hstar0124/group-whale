package com.kh.gw.settings.model.service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.gw.approval.model.vo.CompanyDocumentBox;
import com.kh.gw.approval.model.vo.DocumentForm;
import com.kh.gw.member.model.vo.Duty;
import com.kh.gw.member.model.vo.DutyList;
import com.kh.gw.member.model.vo.Member;
import com.kh.gw.member.model.vo.Position;
import com.kh.gw.member.model.vo.PositionList;
import com.kh.gw.settings.model.dao.SettingsDao;
import com.kh.gw.settings.model.vo.CountMember;
import com.kh.gw.settings.model.vo.Department;
import com.kh.gw.settings.model.vo.Manager;
import com.kh.gw.settings.model.vo.MemberDto;
import com.kh.gw.settings.model.vo.MoveDepartment;
import com.kh.gw.settings.model.vo.PageInfo;

@Service
public class SettingsServiceImpl implements SettingsService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private SettingsDao sd;
	
	
	@Override
	public List<Department> selectDeptList() {

		return sd.selectDeptList(sqlSession);
	}


	@Override
	public int DeptNameCheck(Department deptNameCheck) {

		return sd.selectDeptNameCheck(sqlSession, deptNameCheck);
	}


	@Override
	public int insertDept(Department d) {

		return sd.insertDept(sqlSession, d);
	}


	@Override
	public int deleteDept(Department d) {

		return sd.deleteDept(sqlSession, d);
	}


	@Override
	public List<MemberDto> selectMemberList() {

		return sd.selectMemberList(sqlSession);
	}


	@Override
	public List<MemberDto> selectMemberListInDept(MemberDto mdt) {

		return sd.selectMemberListInDept(sqlSession, mdt);
	}


	@Override
	public String selectOneEmpNo(String empName) {
		return sd.selectOneEmpNo(sqlSession, empName);
	}


	@Override
	public String selectOneDeptNo(String deptName) {
		return sd.selectOneDeptNo(sqlSession, deptName);
	}


	@Override
	public int updateEmpDept(List<MoveDepartment> m) {
		
		int result2 = sd.insertEmpDeptHistory(sqlSession, m);
		int result = 0;
		if(result2 > 0) {
			result = sd.updateEmpDept(sqlSession, m);
		}		
		return result;
	}


	@Override
	public int getListCount() {
		
		return sd.getListCount(sqlSession);
	}


	@Override
	public List<MemberDto> selectMemberList(PageInfo pi) {

		return sd.selectMemberList(sqlSession, pi);
	}


	@Override
	public List<PositionList> selectPositionList(PageInfo pi) {
		
		return sd.selectPositionList(sqlSession, pi);
	}


	@Override
	public int getPositionListCount() {
		
		return sd.getPositionListCount(sqlSession);
	}


	@Override
	public List<DutyList> selectDutyList() {
		return sd.selectDutyList(sqlSession);
	}


	@Override
	public int positionNoCheck(Position position) {
		
		return sd.selectPositionNo(sqlSession, position);
	}


	@Override
	public int positionNameCheck(Position position) {
		return sd.selectPositionName(sqlSession, position);
	}


	@Override
	public int insertPosition(Position position) {
		return sd.insertPosition(sqlSession, position);
	}


	@Override
	public int deletePosition(Position position) {
		return sd.deletePosition(sqlSession, position);
	}


	@Override
	public int dutyCheck(Duty duty) {
		
		return sd.selectDuty(sqlSession, duty);
	}


	@Override
	public int insertDuty(Duty duty) {
		return sd.insertDuty(sqlSession, duty);
	}


	@Override
	public int deleteDuty(Duty duty) {
		return sd.deleteDuty(sqlSession, duty);
	}


	@Override
	public CountMember selectMemberCount() {
		return sd.selectMemberCount(sqlSession);
	}


	@Override
	public List<Manager> selectManagerList() {
		return sd.selectManagerList(sqlSession);
	}


	@Override
	public int selectManagerCount() {
		return sd.selectManagerCount(sqlSession);
	}


	@Override
	public int insertManager(List<Manager> list) {
		
		return sd.insertManager(sqlSession, list);
	}


	@Override
	public int deleteManager(List<Manager> list) {

		return sd.deleteManager(sqlSession, list);
	}


	@Override
	public int selectMatching(MemberDto m) {
		return sd.selectMatching(sqlSession, m);
	}


	@Override
	public int deleteMember(List<MemberDto> list) {

		return sd.deleteMember(sqlSession, list);
	}


	@Override
	public int folderNameCheck(String folderName) {

		return sd.selectFolderName(sqlSession, folderName);
	}


	@Override
	public int insertcboxName(CompanyDocumentBox box) {

		return sd.insertcboxName(sqlSession, box);
	}


	@Override
	public int delFolderCheck(String cboxNo) {

		return sd.selectDelFolderCheck(sqlSession, cboxNo);
	}


	@Override
	public int deleteCboxName(String cboxNo) {

		return sd.deleteCboxName(sqlSession, cboxNo);
	}


	@Override
	public int insertDocumentForm(DocumentForm form) {

		return sd.insertDocumentForm(sqlSession, form);
	}


	@Override
	public int deleteDocumentForm(String[] formNoList) {

		return sd.deleteDocumentForm(sqlSession, formNoList);
	}


	@Override
	public DocumentForm selectOneDocumentForm(String formNo) {

		return sd.selectOneDocumentForm(sqlSession, formNo);
	}


	@Override
	public int updateDocumentForm(DocumentForm form) {
		int result = 0;
		
		int result1 = sd.updateBeforeDocumentForm(sqlSession, form.getFormNo());
		int result2 = sd.updateDocumentForm(sqlSession, form);
		
		result = result1 + result2;
		
		return result;
	}


	@Override
	public int selectMemberMatchingInDept(String deptName) {
		return sd.selectMemberMatchingInDept(sqlSession, deptName);
	}

    @Override
	public int updatecboxName(CompanyDocumentBox box) {
		return sd.updatecboxName(sqlSession, box);
	}


	@Override
	public int selectManagerCheck(String empNo) {
		return sd.selectManagerCheck(sqlSession, empNo);
	}


}
