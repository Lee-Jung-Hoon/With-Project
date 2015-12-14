package kr.co.with.studygroup.attend.dao;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.with.studygroup.attend.vo.AttendVO;
import kr.co.with.studygroup.member.vo.MemberVO;

@Repository
public class AttendDAO {

	@Autowired
	private SqlSessionTemplate session;
	
	// 출석 체크
	public void insertAttend(AttendVO attend) {
		session.update("with.studygroupAttend.dao.insertAttend", attend);
	}

	public List<MemberVO> selectMemberList(int groupNo) {
		return session.selectList("with.studygroupAttend.dao.selectMemberList", groupNo);
	}

	public List<AttendVO> selectAttendList(AttendVO attend) {
		return session.selectList("with.studygroupAttend.dao.selectAttendList", attend);
	}

	public void attendMapping(int groupNo) {

		Date myDate = new Date();
		String date = new SimpleDateFormat("yyyy-MM-dd").format(myDate);
		
		List<MemberVO> list = session.selectList("with.studygroupAttend.dao.selectMemberList", groupNo);
		for(int i=0; i<list.size(); i++) {
			AttendVO attend = new AttendVO();
			attend.setGroupNo(groupNo);
			attend.setMemberNo(list.get(i).getMemberNo());
			attend.setRegDate(date);
			System.out.println(date);
			int cnt = session.selectOne("with.studygroupAttend.dao.selectTodayAttend", attend);
			System.out.println(cnt);
			if(cnt == 0) {
				session.insert("with.studygroupAttend.dao.attendMapping", attend);
			}
		}
	}

	public List<AttendVO> selectAttendDateList(int groupNo) {
		return session.selectList("with.studygroupAttend.dao.selectAttendDateList", groupNo);
	}

}
