package com.kh.ssakbaedal.store.model.vo;

import java.util.Date;

public class ChartStatistics {
	
/*	private int january;
	private int february;
	private int march;
	private int april;
	private int may;
	private int june;
	private int july;
	private int august;
	private int september;
	private int october;
	private int november;
	private int december;*/
	
	private int smNo; //매장번호
	private int oPrice; //주문금액
	private int month; //달
	
	public ChartStatistics() {}

	public ChartStatistics(int smNo,int oPrice, int month) {
		super();
		this.smNo = smNo;
		this.oPrice = oPrice;
		this.month = month;
	}

	public int getSmNo() {
		return smNo;
	}

	public void setSmNo(int smNo) {
		this.smNo = smNo;
	}


	public int getoPrice() {
		return oPrice;
	}

	public void setoPrice(int oPrice) {
		this.oPrice = oPrice;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	@Override
	public String toString() {
		return "ChartStatistics [smNo=" + smNo +  ", oPrice=" + oPrice + ", month=" + month + "]";
	}
	
	
	

}
