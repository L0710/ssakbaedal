package com.kh.ssakbaedal.serviceCenter.model.vo;

public class sc_Search {
	private String searchCondition;
	private String searchValue;
	
	public sc_Search() {}

	public sc_Search(String searchCondition, String searchValue) {
		super();
		this.searchCondition = searchCondition;
		this.searchValue = searchValue;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

	@Override
	public String toString() {
		return "sc_Search [searchCondition=" + searchCondition + ", searchValue=" + searchValue + "]";
	}
	
	
	
	
}
