package kr.co.with.studygroup.moneybook.vo;

public class MoneyBookVO {
	private int mNo;
	private int groupNo;
	private int memberNo;
	private String mDate;
	private String mMemo;
	private int mMoney;
	private String mLeft;
	private String mRight;
	private int mType;
	private String regDate;

	public int getmType() {
		return mType;
	}

	public void setmType(int mType) {
		this.mType = mType;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getmDate() {
		return mDate;
	}

	public void setmDate(String mDate) {
		this.mDate = mDate;
	}

	public String getmMemo() {
		return mMemo;
	}

	public void setmMemo(String mMemo) {
		this.mMemo = mMemo;
	}

	public int getmMoney() {
		return mMoney;
	}

	public void setmMoney(int mMoney) {
		this.mMoney = mMoney;
	}

	public String getmLeft() {
		return mLeft;
	}

	public void setmLeft(String mLeft) {
		this.mLeft = mLeft;
	}

	public String getmRight() {
		return mRight;
	}

	public void setmRight(String mRight) {
		this.mRight = mRight;
	}
}