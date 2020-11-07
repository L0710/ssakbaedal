package com.kh.ssakbaedal.store.model.vo;

public class MenuChart {
	
	private int count; //메뉴수량
	private String mnName; //메뉴이름
	
	public MenuChart() {}

	public MenuChart(int count, String mnName) {
		super();
		this.count = count;
		this.mnName = mnName;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getMnName() {
		return mnName;
	}

	public void setMnName(String mnName) {
		this.mnName = mnName;
	}

	@Override
	public String toString() {
		return "MenuChart [count=" + count + ", mnName=" + mnName + "]";
	}

	
	
	

}
