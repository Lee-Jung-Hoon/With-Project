package kr.co.spanner.user.reservation.vo;

public class ReservationVO {
	private int resNo; //예약번호
	private String id; //회원 id
	private int memberNo; // 회원 번호
	private int classNo; // 강의실번호
	private String regDate; 
	private String startTime; // 시작시간
	private int usingTime; //사용시간
	private String resFor; // 이용목적
	private int status; //상태
	
	public int getResNo() {
		return resNo;
	}
	public void setResNo(int resNo) {
		this.resNo = resNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getClassNo() {
		return classNo;
	}
	public void setClassNo(int classNo) {
		this.classNo = classNo;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public int getUsingTime() {
		return usingTime;
	}
	public void setUsingTime(int usingTime) {
		this.usingTime = usingTime;
	}
	public String getResFor() {
		return resFor;
	}
	public void setResFor(String resFor) {
		this.resFor = resFor;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	

}
