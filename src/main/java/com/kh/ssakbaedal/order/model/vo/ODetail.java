package com.kh.ssakbaedal.order.model.vo;

public class ODetail {
	/*ODNO	NUMBER
	ODNUM	NUMBER
	OD_PRICE	NUMBER
	ONO	NUMBER
	MN_NO	NUMBER
	ODMN	VARCHAR2(50 BYTE)*/
	private int odNo;
	private int odNum;		// 수량
	private int odPrice;	// 단가
	private int oNo;
	private int mnNo;	// 메뉴번호
	private String mnName;	// 메뉴명
	private int price;		// 단가
	
	public ODetail() {}

	public ODetail(int odNo, int odNum, int odPrice, int oNo, int mnNo, String mnName, int price) {
		super();
		this.odNo = odNo;
		this.odNum = odNum;
		this.odPrice = odPrice;
		this.oNo = oNo;
		this.mnNo = mnNo;
		this.mnName = mnName;
		this.price = price;
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

	public int getOdPrice() {
		return odPrice;
	}

	public void setOdPrice(int odPrice) {
		this.odPrice = odPrice;
	}

	public int getoNo() {
		return oNo;
	}

	public void setoNo(int oNo) {
		this.oNo = oNo;
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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "ODetail [odNo=" + odNo + ", odNum=" + odNum + ", odPrice=" + odPrice + ", oNo=" + oNo + ", mnNo=" + mnNo
				+ ", mnName=" + mnName + ", price=" + price + "]";
	}

	
}
