package com.kh.ssakbaedal.store.model.vo;

public class ChartSum {
	
	private int month;
	private int monthSum;
	
	public ChartSum() {}

	public ChartSum(int month, int monthSum) {
		super();
		this.month = month;
		this.monthSum = monthSum;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public int getMonthSum() {
		return monthSum;
	}

	public void setMonthSum(int monthSum) {
		this.monthSum = monthSum;
	}

	@Override
	public String toString() {
		return "ChartSum [month=" + month + ", monthSum=" + monthSum + "]";
	}

	
}
