package kr.co.spanner.admin.classmanage.vo;

public class ClassManageVO {
	private int classNo;		// 강의실 번호
	private int floor;			// 강의실 층수
	private String className;	// 강의실 이름
	private double classTop;	// 강의실 TOP
	private double classLeft;	// 강의실 LEFT
	private int classPerson;	// 강의실 수용인원
	private String classDetail;	// 강의실 세부 내용

	public int getClassNo() {
		return classNo;
	}
 
	public void setClassNo(int classNo) {
		this.classNo = classNo;
	}

	public int getFloor() {
		return floor;
	}

	public void setFloor(int floor) {
		this.floor = floor;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public double getClassTop() {
		return classTop;
	}

	public void setClassTop(double classTop) {
		this.classTop = classTop;
	}

	public double getClassLeft() {
		return classLeft;
	}

	public void setClassLeft(double classLeft) {
		this.classLeft = classLeft;
	}

	public int getClassPerson() {
		return classPerson;
	}

	public void setClassPerson(int classPerson) {
		this.classPerson = classPerson;
	}

	public String getClassDetail() {
		return classDetail;
	}

	public void setClassDetail(String classDetail) {
		this.classDetail = classDetail;
	}

	@Override
	public String toString() {
		return "ClassManageVO [classNo=" + classNo + ", floor=" + floor + ", className=" + className + ", classTop="
				+ classTop + ", classLeft=" + classLeft + ", classPerson=" + classPerson + ", classDetail="
				+ classDetail + "]";
	}
	
	
}
