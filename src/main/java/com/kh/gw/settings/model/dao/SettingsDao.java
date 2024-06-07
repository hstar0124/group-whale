package com.kh.gw.settings.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

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

public interface SettingsDao {

	List<Department> selectDeptList(SqlSessionTemplate sqlSession);

	int selectDeptNameCheck(SqlSessionTemplate sqlSession, Department deptNameCheck);

	int insertDept(SqlSessionTemplate sqlSession, Department d);

	int deleteDept(SqlSessionTemplate sqlSession, Department d);

	List<MemberDto> selectMemberList(SqlSessionTemplate sqlSession);

	List<MemberDto> selectMemberListInDept(SqlSessionTemplate sqlSession, MemberDto mdt);

	String selectOneEmpNo(SqlSessionTemplate sqlSession, String empName);

	String selectOneDeptNo(SqlSessionTemplate sqlSession, String deptName);

	int updateEmpDept(SqlSessionTemplate sqlSession, List<MoveDepartment> m);

	int insertEmpDeptHistory(SqlSessionTemplate sqlSession, List<MoveDepartment> m);

	int getListCount(SqlSessionTemplate sqlSession);

	List<MemberDto> selectMemberList(SqlSessionTemplate sqlSession, PageInfo pi);

	List<PositionList> selectPositionList(SqlSessionTemplate sqlSession, PageInfo pi);

	int getPositionListCount(SqlSessionTemplate sqlSession);

	List<DutyList> selectDutyList(SqlSessionTemplate sqlSession);

	int selectPositionNo(SqlSessionTemplate sqlSession, Position position);

	int selectPositionName(SqlSessionTemplate sqlSession, Position position);

	int insertPosition(SqlSessionTemplate sqlSession, Position position);

	int deletePosition(SqlSessionTemplate sqlSession, Position position);

	int selectDuty(SqlSessionTemplate sqlSession, Duty duty);

	int insertDuty(SqlSessionTemplate sqlSession, Duty duty);

	int deleteDuty(SqlSessionTemplate sqlSession, Duty duty);

	CountMember selectMemberCount(SqlSessionTemplate sqlSession);

	List<Manager> selectManagerList(SqlSessionTemplate sqlSession);

	int selectManagerCount(SqlSessionTemplate sqlSession);

	int insertManager(SqlSessionTemplate sqlSession, List<Manager> list);

	int deleteManager(SqlSessionTemplate sqlSession, List<Manager> list);

	int selectMatching(SqlSessionTemplate sqlSession, MemberDto m);

	int deleteMember(SqlSessionTemplate sqlSession, List<MemberDto> list);

	int selectFolderName(SqlSessionTemplate sqlSession, String folderName);

	int insertcboxName(SqlSessionTemplate sqlSession, CompanyDocumentBox box);

	int selectDelFolderCheck(SqlSessionTemplate sqlSession, String cboxNo);

	int deleteCboxName(SqlSessionTemplate sqlSession, String cboxNo);

	int insertDocumentForm(SqlSessionTemplate sqlSession, DocumentForm form);

	int deleteDocumentForm(SqlSessionTemplate sqlSession, String[] formNoList);

	DocumentForm selectOneDocumentForm(SqlSessionTemplate sqlSession, String formNo);

	int updateDocumentForm(SqlSessionTemplate sqlSession, DocumentForm form);

	int selectMemberMatchingInDept(SqlSessionTemplate sqlSession, String deptName);

	int updatecboxName(SqlSessionTemplate sqlSession, CompanyDocumentBox box);

	int selectManagerCheck(SqlSessionTemplate sqlSession, String empNo);

	int updateBeforeDocumentForm(SqlSessionTemplate sqlSession, String formNo);

}
