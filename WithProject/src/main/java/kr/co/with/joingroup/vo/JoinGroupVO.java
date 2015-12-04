package kr.co.with.joingroup.vo;

public class JoinGroupVO {
	private int joinNo;
	private int memberNo;
	private int groupNo;
	private String groupGrade;
	private String groupComment;
	private String memberTel;
	private String groupJoinDate;
	private String memberStatus;
	private String id;
	private String groupName;
	private String memberName;

	
	
	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberStatus() {
		return memberStatus;
	}

	public void setMemberStatus(String memberStatus) {
		this.memberStatus = memberStatus;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}


	public int getJoinNo() {
		return joinNo;
	}

	public void setJoinNo(int joinNo) {
		this.joinNo = joinNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public String getGroupGrade() {
		return groupGrade;
	}

	public void setGroupGrade(String groupGrade) {
		this.groupGrade = groupGrade;
	}

	public String getGroupComment() {
		return groupComment;
	}

	public void setGroupComment(String groupComment) {
		this.groupComment = groupComment;
	}

	public String getMemberTel() {
		return memberTel;
	}

	public void setMemberTel(String memberTel) {
		this.memberTel = memberTel;
	}

	public String getGroupJoinDate() {
		return groupJoinDate;
	}

	public void setGroupJoinDate(String groupJoinDate) {
		this.groupJoinDate = groupJoinDate;
	}

}

// T_WITH_JOINSTUDYGROUP
// JOIN_NO(PK) 신청번호 INT NOT NULL
// MEMBER_NO(FK) 회원번호 INT NOT NULL
// GROUP_NO(FK) 스터디그룹 번호 INT NOT NULL
// GROUP_GRADE 스터디그룹 멤버 등급 VARCHAR(100) NOT NULL
// GROUP_COMMENT 스터디그룹 참여 한마디 VARCHAR(2000) NULL
// MEMBER_TEL 멤버 전화번호 VARCHAR(20) NULL
// GROUP_JOINDATE 스터디그룹 가입일자 DATETIME NOT NULL