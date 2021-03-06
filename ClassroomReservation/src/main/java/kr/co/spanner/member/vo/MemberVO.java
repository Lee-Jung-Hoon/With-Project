package kr.co.spanner.member.vo;

public class MemberVO {
	private String id;
	private int memberNo;
	private String password;
	private String email;
	private String name;
	private int grade;
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", memberNo=" + memberNo + ", password=" + password + ", email=" + email
				+ ", name=" + name + ", grade=" + grade + "]";
	}
	
	
	
}
