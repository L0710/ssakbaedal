package com.kh.ssakbaedal.order.model.vo;

import java.util.Date;

public class PayAPI {
	/*PNO	NUMBER
	PRICE	NUMBER
	PDATE	DATE
	P_STATUS	VARCHAR2(1 BYTE)
	ONO	NUMBER*/
	private int pNo;
	private int price;
	private Date pDate;
	private String pStatus;
	private int oNo;
	
	public PayAPI() {}

	public PayAPI(int pNo, int price, Date pDate, String pStatus, int oNo) {
		super();
		this.pNo = pNo;
		this.price = price;
		this.pDate = pDate;
		this.pStatus = pStatus;
		this.oNo = oNo;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getpDate() {
		return pDate;
	}

	public void setpDate(Date pDate) {
		this.pDate = pDate;
	}

	public String getpStatus() {
		return pStatus;
	}

	public void setpStatus(String pStatus) {
		this.pStatus = pStatus;
	}

	public int getoNo() {
		return oNo;
	}

	public void setoNo(int oNo) {
		this.oNo = oNo;
	}

	@Override
	public String toString() {
		return "PayAPI [pNo=" + pNo + ", price=" + price + ", pDate=" + pDate + ", pStatus=" + pStatus + ", oNo=" + oNo
				+ "]";
	}

}
