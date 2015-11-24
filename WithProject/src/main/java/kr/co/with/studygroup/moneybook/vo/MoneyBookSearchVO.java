package kr.co.with.studygroup.moneybook.vo;

public class MoneyBookSearchVO {
	private String endDate;
	private String startDate;
	private int groupNo;
	private String search;
	
	

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
