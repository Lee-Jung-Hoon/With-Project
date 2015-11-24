package kr.co.with.studygroup.vo;

public class MsgVO {
	private String memberNo;
	private String recvId;
    private int msgNo;
    private int groupNo;
    private String content;
    private int msgCheck;
    private String regDate;
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getRecvId() {
		return recvId;
	}
	public void setRecvId(String recvId) {
		this.recvId = recvId;
	}
	public int getMsgNo() {
		return msgNo;
	}
	public void setMsgNo(int msgNo) {
		this.msgNo = msgNo;
	}
	public int getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getMsgCheck() {
		return msgCheck;
	}
	public void setMsgCheck(int msgCheck) {
		this.msgCheck = msgCheck;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
    
    
}
