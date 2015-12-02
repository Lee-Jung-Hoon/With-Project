package kr.co.with.studygroup.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.with.studygroup.member.vo.MemberVO;
import kr.co.with.studygroup.moneybook.vo.MoneyBookVO;
import kr.co.with.studygroup.vo.StudyGroupBookmarkVO;
import kr.co.with.studygroup.vo.StudyGroupCommentVO;
import kr.co.with.studygroup.vo.StudyGroupPagingVO;
import kr.co.with.studygroup.vo.StudyGroupTagVO;
import kr.co.with.studygroup.vo.StudyGroupVO;

@Repository
public class StudyGroupDAO {
	
	@Autowired
	private SqlSessionTemplate session;

	// 메인 리스트를 출력하기 위한 DAO
	public List<StudyGroupVO> selectNewList(StudyGroupPagingVO page) {
		return session.selectList("with.studygroup.dao.studyList", page);
	}

	// 스터디 그룹 생성을 위한 DAO
	public int insertStudyGroup(StudyGroupVO studyGroup) {
		session.insert("with.studygroup.dao.insertStudyGroup", studyGroup);
		return session.selectOne("with.studygroup.dao.selectAutoIncrement");
	}

	// 스터디 그룹 태그 생성을 위한 DAO
	public void insertStudygroupTag(String tagName) {
		session.insert("with.studygroup.dao.insertStudyGroupTag", tagName);
	}

	// 스터디그룹 상세를 출력하기 위한 DAO
	public StudyGroupVO selectGruopDetail(int no) {
		return session.selectOne("with.studygroup.dao.selectGruopDetail", no);
	}

	// 스터디그룹 즐겨찾기 중복 확인을 위한 DAO
	public int selectOverlapBookmark(StudyGroupBookmarkVO bookmark) {
		return session.selectOne("with.studygroup.dao.selectOverlapBookmark", bookmark);
	}

	// 스터디그룹 즐겨찾기 등록을 위한 DAO
	public void insertBookmark(StudyGroupBookmarkVO bookmark) {
		session.insert("with.studygroup.dao.insertBookmark", bookmark);	
	}

	// 스터디그룹 상세 댓글 등록을 위한 DAO
	public void insertGroupComment(StudyGroupCommentVO commentVO) {
		session.insert("with.studygroup.dao.insertGroupComment", commentVO);
	}

	// 스터디그룹 상세 댓글 리스트 출력을 위한 DAO
	public List<StudyGroupCommentVO> selectCommentList(int groupNo) {
		return session.selectList("with.studygroup.dao.selectCommentList", groupNo);
	}
	
	// 스터디그룹 marker를 표시가히기 위한 DAO
	public List<StudyGroupVO> selectMaker() {
		return session.selectList("with.studygroup.dao.selectMarker");
	}	

	public int nameCheck(String tagName) {
		return session.selectOne("with.studygroup.dao.nameCheck", tagName);
	}

	public void updateTagCount(String tagName) {
		session.update("with.studygroup.dao.updateTagCount", tagName);
	}

	public List<StudyGroupTagVO> selectTagList() {
		return session.selectList("with.studygroup.dao.selectTagList");
	}

	// 스터디그룹 즐겨찾기 리스트 출력을 위한 DAO
	public List<StudyGroupVO> selectGroupBookmarkList(int memberNo) {
		return session.selectList("with.studygroup.dao.selectGroupBookmarkList", memberNo);
	}

	// 스터디그룹 내가 개설한 스터디그룹 리스트 출력을 위한 DAO
	public List<StudyGroupVO> selectMyCreateGroup(int memberNo) {
		return session.selectList("with.studygroup.dao.selectMyCreateGroup", memberNo);
	}

	// 스터디그룹 내가 가입한 스터디그룹 리스트 출력을 위한 DAO
	public List<StudyGroupVO> selectMyJoinGroup(int memberNo) {
		return session.selectList("with.studygroup.dao.selectMyJoinGroup", memberNo);
	}

	// 스터디그룹 메인 내용을 출력하기 위한 DAO
	public StudyGroupVO SelectStudygroupMain(int groupNo) {
		return session.selectOne("with.studygroup.dao.SelectStudygroupMain", groupNo);
	}

	public List<MemberVO> SelectStudygroupMemeber(int groupNo) {
		return session.selectList("with.studygroup.dao.SelectStudygroupMemeber", groupNo);
	}

	// 스터디그룹 가계부 정보를 출력하기 위한 DAO
	public List<MoneyBookVO> SelectStudyGroupMoneyBook(int groupNo) {
		return session.selectList("with.moneybook.dao.SelectStudyGroupMoneyBook", groupNo);
	}
}
