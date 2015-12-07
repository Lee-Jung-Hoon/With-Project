package kr.co.with.joingroup.vo;

public class StandGroupVO {
	private int standNo;
	private int memberNo;
	private int groupNo;
	private String groupComment;
	private String memberTel;
	private String standDate;
	public int getStandNo() {
		return standNo;
	}
	public void setStandNo(int standNo) {
		this.standNo = standNo;
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
	public String getStandDate() {
		return standDate;
	}
	public void setStandDate(String standDate) {
		this.standDate = standDate;
	}
}
