package kr.co.with.joingroup.service;

import kr.co.with.joingroup.vo.JoinGroupVO;
import kr.co.with.joingroup.vo.StandGroupVO;
import kr.co.with.studygroup.member.vo.MemberVO;
import kr.co.with.studygroup.vo.StudyGroupVO;

public interface JoinGroupService {

	public int SelectJoinGroup(JoinGroupVO joinGroup) throws Exception;

	public MemberVO selectMemberInfo(int memberNo) throws Exception;

	public StudyGroupVO selectStudygroupInfo(int groupNo) throws Exception;

	public void insertJoinGroupInfo(JoinGroupVO join) throws Exception;

	public void acceptMember(JoinGroupVO join) throws Exception;

	public void insertWatingGroup(JoinGroupVO join) throws Exception;

	public int selectStandMemberInfo(int groupNo) throws Exception; 
	
}
