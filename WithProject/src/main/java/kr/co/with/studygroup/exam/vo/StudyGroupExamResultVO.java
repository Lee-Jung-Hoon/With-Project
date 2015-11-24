package kr.co.with.studygroup.exam.vo;

public class StudyGroupExamResultVO {
	private int examResultNo;
	private String examScore;
	private int examNo;
	private int examTotalNo;
	private int examChkNo;
	private int memberNo;
	private int groupNo;
	private String regDate;

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

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getExamResultNo() {
		return examResultNo;
	}

	public void setExamResultNo(int examResultNo) {
		this.examResultNo = examResultNo;
	}

	public String getExamScore() {
		return examScore;
	}

	public void setExamScore(String examScore) {
		this.examScore = examScore;
	}

	public int getExamNo() {
		return examNo;
	}

	public void setExamNo(int examNo) {
		this.examNo = examNo;
	}

	public int getExamTotalNo() {
		return examTotalNo;
	}

	public void setExamTotalNo(int examTotalNo) {
		this.examTotalNo = examTotalNo;
	}

	public int getExamChkNo() {
		return examChkNo;
	}

	public void setExamChkNo(int examChkNo) {
		this.examChkNo = examChkNo;
	}

}
