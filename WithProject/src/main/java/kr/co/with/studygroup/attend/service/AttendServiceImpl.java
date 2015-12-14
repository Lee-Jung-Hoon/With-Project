package kr.co.with.studygroup.attend.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.with.studygroup.attend.dao.AttendDAO;
import kr.co.with.studygroup.attend.vo.AttendVO;
import kr.co.with.studygroup.member.vo.MemberVO;

@Service
public class AttendServiceImpl implements AttendService{

	@Autowired
	private AttendDAO dao;
	
	// 출석 체크
	@Override
	public void insertAttend(AttendVO attend) throws Exception {
		dao.insertAttend(attend);
	}

	@Override
	public List<MemberVO> selectMemberList(int groupNo) throws Exception {
		return dao.selectMemberList(groupNo);
	}

	@Override
	public List<AttendVO> selectAttendList(AttendVO attend) throws Exception {
		return dao.selectAttendList(attend);
	}

	@Override
	public void attendMapping(int groupNo) throws Exception {
		dao.attendMapping(groupNo);
	}


	@Override
	public List<AttendVO> selectAttendDateList(int groupNo) throws Exception {
		return dao.selectAttendDateList(groupNo);
	}
}
