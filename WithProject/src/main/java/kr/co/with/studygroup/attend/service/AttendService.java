package kr.co.with.studygroup.attend.service;

import java.util.List;

import kr.co.with.studygroup.attend.vo.AttendVO;
import kr.co.with.studygroup.member.vo.MemberVO;

public interface AttendService {

	public void insertAttend(AttendVO attend) throws Exception;

	public List<MemberVO> selectMemberList(int groupNo) throws Exception;

	public List<AttendVO> selectAttendList(AttendVO attned) throws Exception;

}
