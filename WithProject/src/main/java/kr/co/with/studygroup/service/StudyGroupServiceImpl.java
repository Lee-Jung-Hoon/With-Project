package kr.co.with.studygroup.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.with.joingroup.vo.JoinGroupVO;
import kr.co.with.studygroup.dao.StudyGroupDAO;
import kr.co.with.studygroup.member.vo.MemberVO;
import kr.co.with.studygroup.moneybook.vo.MoneyBookVO;
import kr.co.with.studygroup.vo.StudyGroupBookmarkVO;
import kr.co.with.studygroup.vo.StudyGroupCommentVO;
import kr.co.with.studygroup.vo.StudyGroupPagingVO;
import kr.co.with.studygroup.vo.StudyGroupTagVO;
import kr.co.with.studygroup.vo.StudyGroupVO;

@Service
public class StudyGroupServiceImpl implements StudyGroupService {

	@Autowired
	private StudyGroupDAO dao;

	// 메인 리스트를 출력하기 위한 Service
	public List<StudyGroupVO> selectNewList(StudyGroupPagingVO page) throws Exception {
		return dao.selectNewList(page);
	}

	// 스터디그룹 생성을 위한 service
	public int insertStudyGroup(StudyGroupVO studyGroup) throws Exception {
		return dao.insertStudyGroup(studyGroup);
	}

	// 스터디그룹 태그 생성을 위한 service
	public void insertStudygroupTag(String tagName) throws Exception {
		dao.insertStudygroupTag(tagName);
	}

	// 스터디그룹 상세 정보 출력을 위한 service
	public StudyGroupVO selectGruopDetail(int no) throws Exception {
		return dao.selectGruopDetail(no);
	}

	// 스터디그룹 즐겨찾기 중복을 확인하기 위한 service
	public int selectOverlapBookmark(StudyGroupBookmarkVO bookmark) throws Exception {
		return dao.selectOverlapBookmark(bookmark);
	}

	// 스터디그룹 즐겨찾기 등록을 위한 service
	public void insertBookmark(StudyGroupBookmarkVO bookmark) throws Exception {
		dao.insertBookmark(bookmark);
	}

	// 스터디그룹 상세보기 댓글 등록을 위한 service
	public void insertGroupComment(StudyGroupCommentVO commentVO) throws Exception {
		dao.insertGroupComment(commentVO);
	}

	// 스터디그룹 상세 댓글 리스트 출력을 위한 service
	public List<StudyGroupCommentVO> selectCommentList(int groupNo) throws Exception {
		return dao.selectCommentList(groupNo);
	}

	public List<StudyGroupVO> selectMarker() throws Exception {
		return dao.selectMaker();
	}

	// 스터디그룹 태그가 db에 있는지 없는지 체크하는 service
	@Override
	public int nameCheck(String tagName) throws Exception {
		return dao.nameCheck(tagName);
	}

	// 태그의 cnt를 늘리기 위한 service
	@Override
	public void updateTagCount(String tagName) throws Exception {
		dao.updateTagCount(tagName);
	}

	// 높은 순으로 태그를 뽑아오는 service
	@Override
	public List<StudyGroupTagVO> selectTagList() throws Exception {
		return dao.selectTagList();
	}

	// 스터디그룹 즐겨찾기 리스트 출력을 위한 service
	@Override
	public List<StudyGroupVO> selectGroupBookmarkList(int memberNo) throws Exception {
		return dao.selectGroupBookmarkList(memberNo);
	}

	// 마이스터디 내 내가 개설한 스터디그룹 리스트 출력을 위한 service
	@Override
	public List<StudyGroupVO> selectMyCreateGroup(int memberNo) throws Exception {
		return dao.selectMyCreateGroup(memberNo);
	}

	// 마이스터디 내 내가 가입한 스터디그룹 리스트 출력을 위한 service
	@Override
	public List<StudyGroupVO> selectMyJoinGroup(int memberNo) throws Exception {
		return dao.selectMyJoinGroup(memberNo);
	}

	// 가입 승인을 기다리는 스터디그룹 리스트 출력을 위한 service
	@Override
	public List<StudyGroupVO> selectMyWatingGroupList(int memberNo) throws Exception {
		return dao.selectMyWatingGroupList(memberNo);
	}

	// 스터디 그룹 메인 내용 출력을 위한 service
	@Override
	public StudyGroupVO SelectStudygroupMain(int groupNo) throws Exception {
		return dao.SelectStudygroupMain(groupNo);
	}

	// 스터디그룹 멤버 정보를 출력하기 위한 service
	@Override
	public List<MemberVO> SelectStudygroupMemeber(int groupNo) throws Exception {
		return dao.SelectStudygroupMemeber(groupNo);
	}

	// 스터디그룹 가계부 정보를 출력하기 위한 service
	@Override
	public List<MoneyBookVO> SelectStudyGroupMoneyBook(int groupNo) throws Exception {
		return dao.SelectStudyGroupMoneyBook(groupNo);
	}

	@Override
	public List<MemberVO> GroupMemberList(int groupNo) throws Exception {
		return dao.GroupMemberList(groupNo);
	}

	// 스터디그룹 신청 멤버들을 출력하기 위한 service
	@Override
	public List<JoinGroupVO> selectJoinWatingMember(int groupNo) throws Exception {
		return dao.selectJoinWatingMember(groupNo);
	}

	// 스터디그룹 생성 후 가입 정보에 입력
	@Override
	public void insertJoinGroupInfo(StudyGroupVO studyGroup) throws Exception {
		dao.insertJoinGroupInfo(studyGroup);
	}
}