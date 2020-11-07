package com.kh.ssakbaedal.member.model.vo;

public class Cal {
	
	private int priceSum; //주문누적금액
	private int difference; //차액

	public Cal() {}

	public Cal(int priceSum, int difference) {
		super();
		this.priceSum = priceSum;
		this.difference = difference;
	}

	public int getPriceSum() {
		return priceSum;
	}

	public void setPriceSum(int priceSum) {
		this.priceSum = priceSum;
	}

	public int getDifference() {
		return difference;
	}

	public void setDifference(int difference) {
		this.difference = difference;
	}

	@Override
	public String toString() {
		return "Cal [priceSum=" + priceSum + ", difference=" + difference + "]";
	}


	

}
