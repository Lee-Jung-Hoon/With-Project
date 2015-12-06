package kr.co.with.studygroup.vo;

/**
 * @author JungHoon
 *
 */
public class StudyGroupCommentVO {
	private int memberNo;
	private String memberName;
	private int groupNo;
	private int commentNo;
	private String commentContent;
	private String commentImg;
	private String regDate;

	public String getCommentImg() {
		return commentImg;
	}

	public void setCommentImg(String commentImg) {
		this.commentImg = commentImg;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
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

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
}
