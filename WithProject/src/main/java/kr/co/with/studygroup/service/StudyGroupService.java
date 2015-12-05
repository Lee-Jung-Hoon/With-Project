package kr.co.with.studygroup.service;

import java.util.List;

import kr.co.with.joingroup.vo.JoinGroupVO;
import kr.co.with.studygroup.member.vo.MemberVO;
import kr.co.with.studygroup.moneybook.vo.MoneyBookVO;
import kr.co.with.studygroup.vo.StudyGroupBookmarkVO;
import kr.co.with.studygroup.vo.StudyGroupCommentVO;
import kr.co.with.studygroup.vo.StudyGroupPagingVO;
import kr.co.with.studygroup.vo.StudyGroupTagVO;
import kr.co.with.studygroup.vo.StudyGroupVO;

public interface StudyGroupService {

   public List<StudyGroupVO> selectNewList(StudyGroupPagingVO page) throws Exception;

   public int insertStudyGroup(StudyGroupVO studyGroup) throws Exception;

   public void insertStudygroupTag(String tagName) throws Exception;

   public StudyGroupVO selectGruopDetail(int no) throws Exception;

   public int selectOverlapBookmark(StudyGroupBookmarkVO bookmark) throws Exception;

   public void insertBookmark(StudyGroupBookmarkVO bookmark) throws Exception;

   public void insertGroupComment(StudyGroupCommentVO commentVO) throws Exception;

   public List<StudyGroupCommentVO> selectCommentList(int groupNo) throws Exception;
   
    public List<StudyGroupVO> selectMarker() throws Exception;

   public int nameCheck(String tagName) throws Exception;

   public void updateTagCount(String tagName) throws Exception;

   public List<StudyGroupTagVO> selectTagList() throws Exception;

   public List<StudyGroupVO> selectGroupBookmarkList(int memberNo) throws Exception;

   public List<StudyGroupVO> selectMyCreateGroup(int memberNo) throws Exception;

   public List<StudyGroupVO> selectMyJoinGroup(int memberNo) throws Exception;

   public StudyGroupVO SelectStudygroupMain(int groupNo) throws Exception;

   public List<MemberVO> SelectStudygroupMemeber(int groupNo)throws Exception;

   public List<MoneyBookVO> SelectStudyGroupMoneyBook(int groupNo) throws Exception;

   public List<StudyGroupVO> selectMyWatingGroupList(int memberNo) throws Exception;

   public List<MemberVO> GroupMemberList(int groupNo) throws Exception;
   
   public List<JoinGroupVO> selectJoinWatingMember(int groupNo) throws Exception;

public void insertJoinGroupInfo(StudyGroupVO studyGroup) throws Exception;
   
}