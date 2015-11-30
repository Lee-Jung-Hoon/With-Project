package kr.co.with.studygroup.vo;

public class StudyGroupVO {
	private int groupNo;
	private String groupName;
	private String groupDetail;
	private int groupMaxPerson;
	private int groupNowPerson;
	private double groupActiveLongitude;
	private double groupActiveLatitude;
	private String groupActivePlace;
	private String groupEmail;
	private String groupTel;
	private String groupConfirmType;
	private String groupRepImagePath;
	private String groupRecruitStartDate;
	private String groupRecruitEndDate;
	private String groupRegDate;
	private String memberName;
	private String groupStartDate;
	private String groupStartTime;
	private String groupEndDate;
	private String groupEndTime;

	public String getGroupStartDate() {
		return groupStartDate;
	}

	public void setGroupStartDate(String groupStartDate) {
		this.groupStartDate = groupStartDate;
	}

	public String getGroupStartTime() {
		return groupStartTime;
	}

	public void setGroupStartTime(String groupStartTime) {
		this.groupStartTime = groupStartTime;
	}

	public String getGroupEndDate() {
		return groupEndDate;
	}

	public void setGroupEndDate(String groupEndDate) {
		this.groupEndDate = groupEndDate;
	}

	public String getGroupEndTime() {
		return groupEndTime;
	}

	public void setGroupEndTime(String groupEndTime) {
		this.groupEndTime = groupEndTime;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public String getGroupDetail() {
		return groupDetail;
	}

	public void setGroupDetail(String groupDetail) {
		this.groupDetail = groupDetail;
	}

	public int getGroupMaxPerson() {
		return groupMaxPerson;
	}

	public void setGroupMaxPerson(int groupMaxPerson) {
		this.groupMaxPerson = groupMaxPerson;
	}

	public int getGroupNowPerson() {
		return groupNowPerson;
	}

	public void setGroupNowPerson(int groupNowPerson) {
		this.groupNowPerson = groupNowPerson;
	}

	public double getGroupActiveLongitude() {
		return groupActiveLongitude;
	}

	public void setGroupActiveLongitude(double groupActiveLongitude) {
		this.groupActiveLongitude = groupActiveLongitude;
	}

	public double getGroupActiveLatitude() {
		return groupActiveLatitude;
	}

	public void setGroupActiveLatitude(double groupActiveLatitude) {
		this.groupActiveLatitude = groupActiveLatitude;
	}

	public String getGroupActivePlace() {
		return groupActivePlace;
	}

	public void setGroupActivePlace(String groupActivePlace) {
		this.groupActivePlace = groupActivePlace;
	}

	public String getGroupEmail() {
		return groupEmail;
	}

	public void setGroupEmail(String groupEmail) {
		this.groupEmail = groupEmail;
	}

	public String getGroupTel() {
		return groupTel;
	}

	public void setGroupTel(String groupTel) {
		this.groupTel = groupTel;
	}

	public String getGroupConfirmType() {
		return groupConfirmType;
	}

	public void setGroupConfirmType(String groupConfirmType) {
		this.groupConfirmType = groupConfirmType;
	}

	public String getGroupRepImagePath() {
		return groupRepImagePath;
	}

	public void setGroupRepImagePath(String groupRepImagePath) {
		this.groupRepImagePath = groupRepImagePath;
	}

	public String getGroupRecruitStartDate() {
		return groupRecruitStartDate;
	}

	public void setGroupRecruitStartDate(String groupRecruitStartDate) {
		this.groupRecruitStartDate = groupRecruitStartDate;
	}

	public String getGroupRecruitEndDate() {
		return groupRecruitEndDate;
	}

	public void setGroupRecruitEndDate(String groupRecruitEndDate) {
		this.groupRecruitEndDate = groupRecruitEndDate;
	}

	public String getGroupRegDate() {
		return groupRegDate;
	}

	public void setGroupRegDate(String groupRegDate) {
		this.groupRegDate = groupRegDate;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getGroupTag() {
		return groupTag;
	}

	public void setGroupTag(String groupTag) {
		this.groupTag = groupTag;
	}

	private int memberNo;
	private String groupTag;

	@Override
	public String toString() {
		return "StudyGroupVO [groupNo=" + groupNo + ", groupName=" + groupName + ", groupDetail=" + groupDetail
				+ ", groupMaxPerson=" + groupMaxPerson + ", groupNowPerson=" + groupNowPerson
				+ ", groupActiveLongitude=" + groupActiveLongitude + ", groupActiveLatitude=" + groupActiveLatitude
				+ ", groupActivePlace=" + groupActivePlace + ", groupEmail=" + groupEmail + ", groupTel=" + groupTel
				+ ", groupConfirmType=" + groupConfirmType + ", groupRepImagePath=" + groupRepImagePath
				+ ", groupRecruitStartDate=" + groupRecruitStartDate + ", groupRecruitEndDate=" + groupRecruitEndDate
				+ ", groupRegDate=" + groupRegDate + "]";
	}

}
