package com.kh.ssakbaedal.require.model.vo;

public class reqSearch {
	private String searchCondition;
	private String searchValue;
	
	public reqSearch() {}

	public reqSearch(String searchCondition, String searchValue) {
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
		return "reqSearch [searchCondition=" + searchCondition + ", searchValue=" + searchValue + "]";
	};
	
	
}
