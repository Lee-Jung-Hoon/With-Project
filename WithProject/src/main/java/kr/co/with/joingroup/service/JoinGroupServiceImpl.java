package kr.co.with.joingroup.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.with.joingroup.dao.JoinGroupDAO;
import kr.co.with.joingroup.vo.JoinGroupVO;
import kr.co.with.joingroup.vo.StandGroupVO;
import kr.co.with.studygroup.member.vo.MemberVO;
import kr.co.with.studygroup.vo.StudyGroupVO;

@Service
public class JoinGroupServiceImpl implements JoinGroupService {

	@Autowired
	private JoinGroupDAO dao;
	
	// 스터디그룹 가입 여부 확인
	@Override
	public int SelectJoinGroup(JoinGroupVO joinGroup) throws Exception {
		return dao.SelectJoinGroup(joinGroup);
	}

	// 스터디그룹 가입 폼에 출력한 가입자 정보 출력
	@Override
	public MemberVO selectMemberInfo(int memberNo) throws Exception {
		return dao.selectMemberInfo(memberNo);
	}

	// 스터디그룹 가입 폼에 출력할 그룹 정보 출력
	@Override
	public StudyGroupVO selectStudygroupInfo(int groupNo) throws Exception {
		return dao.selectStudygroupInfo(groupNo);
	}

	// 스터디그룹 가입 신청
	@Override
	public void insertJoinGroupInfo(JoinGroupVO join) throws Exception {
		dao.insertJoinGroupInfo(join);
	}

	// 스터디그룹 가입 승인
	@Override
	public void acceptMember(JoinGroupVO join) throws Exception {
		dao.acceptMember(join);
	}

	// 스터디그룹 대기자 등록
	@Override
	public void insertWatingGroup(JoinGroupVO join) throws Exception {
		dao.insertWatingGroup(join);
	}
	
	// 대기자 현황을 출력하기 위한 service
	@Override
	public int selectStandMemberInfo(int groupNo) throws Exception {
		return dao.selectStandMemberInfo(groupNo);
	}
}
