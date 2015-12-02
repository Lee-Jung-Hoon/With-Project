package kr.co.with.studygroup.vo;

public class StudygroupWorkInfoVO {
	private int no; // 게시글 번호
	private String id; // 공고번호
	private String url; // 사람인 게시글의 url
	private String active; // 공고진행여부
	private String postingTimeStamp; // 게시일
	private String openingTimeStamp; // 접수 시작일
	private String expirationTimeStamp; // 마감일
	private String company; // 회사이름
	private String title; // 제목
	private String jobType; // 근무형태
	private String jobCategory; // 직종
	private String openQuantity; // 경력
	private String experienceLevel; //학력
	private String salary; // 연봉
	private int checkCnt; // 조회수
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getActive() {
		return active;
	}
	public void setActive(String active) {
		this.active = active;
	}
	public String getPostingTimeStamp() {
		return postingTimeStamp;
	}
	public void setPostingTimeStamp(String postingTimeStamp) {
		this.postingTimeStamp = postingTimeStamp;
	}
	public String getOpeningTimeStamp() {
		return openingTimeStamp;
	}
	public void setOpeningTimeStamp(String openingTimeStamp) {
		this.openingTimeStamp = openingTimeStamp;
	}
	public String getExpirationTimeStamp() {
		return expirationTimeStamp;
	}
	public void setExpirationTimeStamp(String expirationTimeStamp) {
		this.expirationTimeStamp = expirationTimeStamp;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getJobType() {
		return jobType;
	}
	public void setJobType(String jobType) {
		this.jobType = jobType;
	}
	public String getJobCategory() {
		return jobCategory;
	}
	public void setJobCategory(String jobCategory) {
		this.jobCategory = jobCategory;
	}
	public String getOpenQuantity() {
		return openQuantity;
	}
	public void setOpenQuantity(String openQuantity) {
		this.openQuantity = openQuantity;
	}
	public String getExperienceLevel() {
		return experienceLevel;
	}
	public void setExperienceLevel(String experienceLevel) {
		this.experienceLevel = experienceLevel;
	}
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}
	public int getCheckCnt() {
		return checkCnt;
	}
	public void setCheckCnt(int checkCnt) {
		this.checkCnt = checkCnt;
	}
	
	
}
