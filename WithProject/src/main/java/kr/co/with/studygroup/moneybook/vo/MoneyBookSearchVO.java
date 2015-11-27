package kr.co.with.studygroup.moneybook.vo;

public class MoneyBookSearchVO {
	private String endDate;
	private String startDate;
	private int groupNo;
	private String search;
	private String category;
	private String money;
	private String sMoney;
	
	

	public String getsMoney() {
		return sMoney;
	}

	public void setsMoney(String sMoney) {
		this.sMoney = sMoney;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getMoney() {
		return money;
	}

	public void setMoney(String money) {
		this.money = money;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getEndDate() {
		return endDate;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

}
