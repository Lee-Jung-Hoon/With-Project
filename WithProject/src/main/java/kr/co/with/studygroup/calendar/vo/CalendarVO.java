package kr.co.with.studygroup.calendar.vo;

public class CalendarVO {
	private int id;
	private String title;
	private String startDate;
	private String endDate;
	private String calendarDetail;
	private String color;
	private String textColor;
	private int groupNo;
	private String groupName;
	private int memberNo;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getCalendarDetail() {
		return calendarDetail;
	}
	public void setCalendarDetail(String calendarDetail) {
		this.calendarDetail = calendarDetail;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getTextColor() {
		return textColor;
	}
	public void setTextColor(String textColor) {
		this.textColor = textColor;
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
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	@Override
	public String toString() {
		return "CalendarVO [id=" + id + ", title=" + title + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", calendarDetail=" + calendarDetail + ", color=" + color + ", textColor=" + textColor + ", groupNo="
				+ groupNo + ", groupName=" + groupName + ", memberNo=" + memberNo + "]";
	}
}