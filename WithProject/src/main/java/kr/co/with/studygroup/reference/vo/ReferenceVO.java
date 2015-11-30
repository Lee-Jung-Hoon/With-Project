package kr.co.with.studygroup.reference.vo;

public class ReferenceVO {
	private int referenceNo;
	private int groupNo;
	private String referenceTitle;
	private String referenceCategori;
	private String referenceFile;
	private String referenceDate;
	private String referencePath;
	private String referenceRealName;
	private String referenceOrgFileName;
	private int memberNo;
	
	public int getReferenceNo() {
		return referenceNo;
	}
	public void setReferenceNo(int referenceNo) {
		this.referenceNo = referenceNo;
	}
	public int getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}
	public String getReferenceTitle() {
		return referenceTitle;
	}
	public void setReferenceTitle(String referenceTitle) {
		this.referenceTitle = referenceTitle;
	}
	public String getReferenceCategori() {
		return referenceCategori;
	}
	public void setReferenceCategori(String referenceCategori) {
		this.referenceCategori = referenceCategori;
	}
	public String getReferenceFile() {
		return referenceFile;
	}
	public void setReferenceFile(String referenceFile) {
		this.referenceFile = referenceFile;
	}
	public String getReferenceDate() {
		return referenceDate;
	}
	public void setReferenceDate(String referenceDate) {
		this.referenceDate = referenceDate;
	}
	public String getReferencePath() {
		return referencePath;
	}
	public void setReferencePath(String referencePath) {
		this.referencePath = referencePath;
	}
	public String getReferenceRealName() {
		return referenceRealName;
	}
	public void setReferenceRealName(String referenceRealName) {
		this.referenceRealName = referenceRealName;
	}
	public String getReferenceOrgFileName() {
		return referenceOrgFileName;
	}
	public void setReferenceOrgFileName(String referenceOrgFileName) {
		this.referenceOrgFileName = referenceOrgFileName;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	
	@Override
	public String toString() {
		return "ReferenceVO [referenceNo=" + referenceNo + ", groupNo=" + groupNo + ", referenceTitle=" + referenceTitle
				+ ", referenceCategori=" + referenceCategori + ", referenceFile=" + referenceFile + ", referenceDate="
				+ referenceDate + ", referencePath=" + referencePath + ", referenceRealName=" + referenceRealName
				+ ", referenceOrgFileName=" + referenceOrgFileName + ", memberNo=" + memberNo + "]";
	}
	
}
