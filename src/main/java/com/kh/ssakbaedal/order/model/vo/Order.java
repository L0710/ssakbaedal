package com.kh.ssakbaedal.order.model.vo;

import java.util.Date;

public class Order {
	
	private int oNo;
	private Date oTime;
	private String request;
	private int oPrice;
	private int oPoint;
	private String oAddress;
	private String oStatus;
	private int mNo;
	private int smNo;
	private int arrivalTime;
	
	public Order() {}

	public Order(int oNo, Date oTime, String request, int oPrice, int oPoint, String oAddress, String oStatus, int mNo,
			int smNo, int arrivalTime) {
		super();
		this.oNo = oNo;
		this.oTime = oTime;
		this.request = request;
		this.oPrice = oPrice;
		this.oPoint = oPoint;
		this.oAddress = oAddress;
		this.oStatus = oStatus;
		this.mNo = mNo;
		this.smNo = smNo;
		this.arrivalTime = arrivalTime;
	}

	public int getoNo() {
		return oNo;
	}

	public void setoNo(int oNo) {
		this.oNo = oNo;
	}

	public Date getoTime() {
		return oTime;
	}

	public void setoTime(Date oTime) {
		this.oTime = oTime;
	}

	public String getRequest() {
		return request;
	}

	public void setRequest(String request) {
		this.request = request;
	}

	public int getoPrice() {
		return oPrice;
	}

	public void setoPrice(int oPrice) {
		this.oPrice = oPrice;
	}

	public int getoPoint() {
		return oPoint;
	}

	public void setoPoint(int oPoint) {
		this.oPoint = oPoint;
	}

	public String getoAddress() {
		return oAddress;
	}

	public void setoAddress(String oAddress) {
		this.oAddress = oAddress;
	}

	public String getoStatus() {
		return oStatus;
	}

	public void setoStatus(String oStatus) {
		this.oStatus = oStatus;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public int getSmNo() {
		return smNo;
	}

	public void setSmNo(int smNo) {
		this.smNo = smNo;
	}

	public int getArrivalTime() {
		return arrivalTime;
	}

	public void setArrivalTime(int arrivalTime) {
		this.arrivalTime = arrivalTime;
	}

	@Override
	public String toString() {
		return "Order [oNo=" + oNo + ", oTime=" + oTime + ", request=" + request + ", oPrice=" + oPrice + ", oPoint="
				+ oPoint + ", oAddress=" + oAddress + ", oStatus=" + oStatus + ", mNo=" + mNo + ", smNo=" + smNo
				+ ", arrivalTime=" + arrivalTime + "]";
	}
	
	
	
	

}
