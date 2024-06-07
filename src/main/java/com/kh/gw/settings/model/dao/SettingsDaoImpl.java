package com.kh.gw.settings.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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

@Repository
public class SettingsDaoImpl implements SettingsDao{

	@Override
	public List<Department> selectDeptList(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectList("Settings.selectDeptList");
	}

	@Override
	public int selectDeptNameCheck(SqlSessionTemplate sqlSession, Department deptNameCheck) {
		
		return sqlSession.selectOne("Settings.selectDeptNameCheck", deptNameCheck);
	}

	@Override
	public int insertDept(SqlSessionTemplate sqlSession, Department d) {
		
		return sqlSession.insert("Settings.insertDept", d);
	}

	@Override
	public int deleteDept(SqlSessionTemplate sqlSession, Department d) {

		return sqlSession.delete("Settings.deleteDept", d);
	}

	@Override
	public List<MemberDto> selectMemberList(SqlSessionTemplate sqlSession) {

		return sqlSession.selectList("Settings.selectMemberList");
	}

	@Override
	public List<MemberDto> selectMemberListInDept(SqlSessionTemplate sqlSession, MemberDto mdt) {

		return sqlSession.selectList("Settings.selectMemberListInDept", mdt);
	}

	@Override
	public String selectOneEmpNo(SqlSessionTemplate sqlSession, String empName) {
		return sqlSession.selectOne("Settings.selectOneEmpNo", empName);
	}

	@Override
	public String selectOneDeptNo(SqlSessionTemplate sqlSession, String deptName) {
		return sqlSession.selectOne("Settings.selectOneDeptNo", deptName);
	}

	@Override
	public int updateEmpDept(SqlSessionTemplate sqlSession, List<MoveDepartment> m) {
		int result = 0;
		int length = 0;
		
		for(int i = 0 ; i < m.size(); i++) {
			int result1 = sqlSession.update("Settings.updateEmpDept", m.get(i));
			length += result1;
		}
		if(length == m.size()) {
			result = length;
			return result;
		}else {
			return 0;
		}
		
	}

	@Override
	public int insertEmpDeptHistory(SqlSessionTemplate sqlSession, List<MoveDepartment> m) {
		int result = 0;
		int length = 0;
		
		for(int i = 0; i < m.size() ; i++) {
			int result1 = sqlSession.insert("Settings.insertEmpDeptHistory", m.get(i));
			length += result1;
		}
		
		if(length == m.size()) {
			result = length;
			return result;
		}else {
			return 0;
		}
		
	}

	@Override
	public int getListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("Settings.selectListCount");
	}

	@Override
	public List<MemberDto> selectMemberList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		List<MemberDto> list = null;
		
		//몇개의 게시물을 건너뛰고 검색할건지 계산
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return sqlSession.selectList("Settings.selectMemberList", null, rowBounds);
	}

	@Override
	public List<PositionList> selectPositionList(SqlSessionTemplate sqlSession, PageInfo pi) {

		List<Position> list = null;
		
		//몇개의 게시물을 건너뛰고 검색할건지 계산
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return sqlSession.selectList("Settings.selectPositionList", null, rowBounds);
	}

	@Override
	public int getPositionListCount(SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("Settings.selectPositionListCount");
	}

	@Override
	public List<DutyList> selectDutyList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("Settings.selectDutyList");
	}

	@Override
	public int selectPositionNo(SqlSessionTemplate sqlSession, Position position) {
		
		return sqlSession.selectOne("Settings.selectPositionNo", position);
	}

	@Override
	public int selectPositionName(SqlSessionTemplate sqlSession, Position position) {
		return sqlSession.selectOne("Settings.selectPositionName", position);
	}

	@Override
	public int insertPosition(SqlSessionTemplate sqlSession, Position position) {
		return sqlSession.insert("Settings.insertPosition", position);
	}

	@Override
	public int deletePosition(SqlSessionTemplate sqlSession, Position position) {
		return sqlSession.delete("Settings.deletePosition", position);
	}

	@Override
	public int selectDuty(SqlSessionTemplate sqlSession, Duty duty) {
		int result = 0;
		if(sqlSession.selectOne("Settings.selectDuty", duty) == null) {
			result = 0;
		}else {
			result = sqlSession.selectOne("Settings.selectDuty", duty);
		}
		
		return result;
	}

	@Override
	public int insertDuty(SqlSessionTemplate sqlSession, Duty duty) {
		return sqlSession.insert("Settings.insertDuty", duty);
	}

	@Override
	public int deleteDuty(SqlSessionTemplate sqlSession, Duty duty) {
		return sqlSession.delete("Settings.deleteDuty", duty);
	}

	@Override
	public CountMember selectMemberCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Settings.selectMemberCount");
	}

	@Override
	public List<Manager> selectManagerList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("Settings.selectManagerList");
	}

	@Override
	public int selectManagerCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Settings.selectManagerCount");
	}

	@Override
	public int insertManager(SqlSessionTemplate sqlSession, List<Manager> list) {
		
		int result = 0;
		for(Manager m : list) {
			 result += sqlSession.insert("Settings.insertManager", m);
		}
		
		return result;
	}

	@Override
	public int deleteManager(SqlSessionTemplate sqlSession, List<Manager> list) {

		int result = 0;
		for(Manager m : list) {
			result += sqlSession.delete("Settings.deleteManager", m);
		}
		
		return result;
	}

	@Override
	public int selectMatching(SqlSessionTemplate sqlSession, MemberDto m) {
		return sqlSession.selectOne("Settings.selectMatching", m);
	}

	@Override
	public int deleteMember(SqlSessionTemplate sqlSession, List<MemberDto> list) {
		int result = 0;
		for(int i = 0 ; i < list.size() ; i++) {
			result += sqlSession.update("Settings.deleteMember", list.get(i));
		}
		
		return result;
	}

	@Override
	public int selectFolderName(SqlSessionTemplate sqlSession, String folderName) {

		return sqlSession.selectOne("Settings.selectFolderName", folderName);
	}

	@Override
	public int insertcboxName(SqlSessionTemplate sqlSession, CompanyDocumentBox box) {

		return sqlSession.insert("Settings.insertcboxName", box);
	}

	@Override
	public int selectDelFolderCheck(SqlSessionTemplate sqlSession, String cboxNo) {

		return sqlSession.selectOne("Settings.selectDelFolderCheck", cboxNo);
	}

	@Override
	public int deleteCboxName(SqlSessionTemplate sqlSession, String cboxNo) {

		return sqlSession.delete("Settings.deleteCboxName", cboxNo);
	}

	@Override
	public int insertDocumentForm(SqlSessionTemplate sqlSession, DocumentForm form) {

		return sqlSession.insert("Settings.insertDocumentForm", form);
	}

	@Override
	public int deleteDocumentForm(SqlSessionTemplate sqlSession, String[] formNoList) {
		int result = 0;
		int length = 0;
		
		for(int i = 0 ; i < formNoList.length; i++) {
			String formNo = formNoList[i];
			int result1 = sqlSession.delete("Settings.deleteDocumentForm", formNo);
			length += result1;
		}
		if(length == formNoList.length) {
			result = length;
			return result;
		}else {
			return 0;
		}
	}

	@Override
	public DocumentForm selectOneDocumentForm(SqlSessionTemplate sqlSession, String formNo) {

		return sqlSession.selectOne("Settings.selectOneDocumentForm", formNo);
	}

	@Override
	public int updateDocumentForm(SqlSessionTemplate sqlSession, DocumentForm form) {

		return sqlSession.update("Settings.updateDocumentForm", form);
	}

	@Override
	public int selectMemberMatchingInDept(SqlSessionTemplate sqlSession, String deptName) {
		return sqlSession.selectOne("Settings.selectMemberMatchingInDept", deptName);
	}

    @Override
	public int updatecboxName(SqlSessionTemplate sqlSession, CompanyDocumentBox box) {
		return sqlSession.update("Settings.updatecboxName", box);
	}

	@Override
	public int selectManagerCheck(SqlSessionTemplate sqlSession, String empNo) {
		return sqlSession.selectOne("Settings.selectManagerCheck", empNo);
	}

	@Override
	public int updateBeforeDocumentForm(SqlSessionTemplate sqlSession, String formNo) {

		return sqlSession.update("Settings.updateBeforDocumentForm", formNo);
	}

}
