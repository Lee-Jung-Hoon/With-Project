package kr.co.with.studygroup.attend.vo;

public class AttendVO {
	private int attendNo;
	private int memberNo;
	private String memberName;
	private int groupNo;
	private boolean ck;
	private String regDate;
	
	public boolean isCheck() {
		return ck;
	}

	public void setCheck(boolean ck) {
		this.ck = ck;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public int getAttendNo() {
		return attendNo;
	}

	public void setAttendNo(int attendNo) {
		this.attendNo = attendNo;
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

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

}
