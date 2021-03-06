package com.kh.ssakbaedal.order.model.vo;

public class SODetail {
	
	private int odNo; //주문상세번호
	private int odNum; //수량
	private int oPrice; //단가
	private int mnNo; //메뉴번호
	private String mnName; //메뉴이름
	private int oNo; //주문번호
	
	public SODetail() {}

	public SODetail(int odNo, int odNum, int oPrice, int mnNo, String mnName, int oNo) {
		super();
		this.odNo = odNo;
		this.odNum = odNum;
		this.oPrice = oPrice;
		this.mnNo = mnNo;
		this.mnName = mnName;
		this.oNo = oNo;
	}

	public int getOdNo() {
		return odNo;
	}

	public void setOdNo(int odNo) {
		this.odNo = odNo;
	}

	public int getOdNum() {
		return odNum;
	}

	public void setOdNum(int odNum) {
		this.odNum = odNum;
	}

	public int getoPrice() {
		return oPrice;
	}

	public void setoPrice(int oPrice) {
		this.oPrice = oPrice;
	}

	public int getMnNo() {
		return mnNo;
	}

	public void setMnNo(int mnNo) {
		this.mnNo = mnNo;
	}

	public String getMnName() {
		return mnName;
	}

	public void setMnName(String mnName) {
		this.mnName = mnName;
	}

	public int getoNo() {
		return oNo;
	}

	public void setoNo(int oNo) {
		this.oNo = oNo;
	}

	@Override
	public String toString() {
		return "SODetail [odNo=" + odNo + ", odNum=" + odNum + ", oPrice=" + oPrice + ", mnNo=" + mnNo + ", mnName="
				+ mnName + ", oNo=" + oNo + "]";
	}


}
