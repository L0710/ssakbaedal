package com.kh.ssakbaedal.storeSearch.model.vo;

public class storeSearch {
	/*
	MNO	NUMBER
	SNAME	VARCHAR2(50 BYTE)
	SNO	VARCHAR2(20 BYTE)
	STEL	VARCHAR2(15 BYTE)
	S_ADDRESS	VARCHAR2(100 BYTE)
	DELIVERY_KM	NUMBER
	SINFO	VARCHAR2(600 BYTE)
	OPEN_TIME	VARCHAR2(300 BYTE)
	S_STATUS	NUMBER
	SACCEPT	VARCHAR2(2 BYTE)
	S_CATEGORY	VARCHAR2(20 BYTE)
	DELIVERY_CHARGE	NUMBER
	MIN_PRICE	NUMBER
	*/
	
	private int mNo;
	private String sName;
	private String sNo;
	private String sTel;
	private String sAddress;
	private int deliveryKm;
	private String sInfo;
	private String openTime;
	private int sStatus;
	private String sAccept;
	private String sCategory;
	private int deliveryCharge;
	private int minPrice;
	private String soff;
	
	public storeSearch() {}

	public storeSearch(int mNo, String sName, String sNo, String sTel, String sAddress, int deliveryKm, String sInfo,
			String openTime, int sStatus, String sAccept, String sCategory, int deliveryCharge, int minPrice,
			String soff) {
		super();
		this.mNo = mNo;
		this.sName = sName;
		this.sNo = sNo;
		this.sTel = sTel;
		this.sAddress = sAddress;
		this.deliveryKm = deliveryKm;
		this.sInfo = sInfo;
		this.openTime = openTime;
		this.sStatus = sStatus;
		this.sAccept = sAccept;
		this.sCategory = sCategory;
		this.deliveryCharge = deliveryCharge;
		this.minPrice = minPrice;
		this.soff = soff;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
	}

	public String getsNo() {
		return sNo;
	}

	public void setsNo(String sNo) {
		this.sNo = sNo;
	}

	public String getsTel() {
		return sTel;
	}

	public void setsTel(String sTel) {
		this.sTel = sTel;
	}

	public String getsAddress() {
		return sAddress;
	}

	public void setsAddress(String sAddress) {
		this.sAddress = sAddress;
	}

	public int getDeliveryKm() {
		return deliveryKm;
	}

	public void setDeliveryKm(int deliveryKm) {
		this.deliveryKm = deliveryKm;
	}

	public String getsInfo() {
		return sInfo;
	}

	public void setsInfo(String sInfo) {
		this.sInfo = sInfo;
	}

	public String getOpenTime() {
		return openTime;
	}

	public void setOpenTime(String openTime) {
		this.openTime = openTime;
	}

	public int getsStatus() {
		return sStatus;
	}

	public void setsStatus(int sStatus) {
		this.sStatus = sStatus;
	}

	public String getsAccept() {
		return sAccept;
	}

	public void setsAccept(String sAccept) {
		this.sAccept = sAccept;
	}

	public String getsCategory() {
		return sCategory;
	}

	public void setsCategory(String sCategory) {
		this.sCategory = sCategory;
	}

	public int getDeliveryCharge() {
		return deliveryCharge;
	}

	public void setDeliveryCharge(int deliveryCharge) {
		this.deliveryCharge = deliveryCharge;
	}

	public int getMinPrice() {
		return minPrice;
	}

	public void setMinPrice(int minPrice) {
		this.minPrice = minPrice;
	}

	public String getSoff() {
		return soff;
	}

	public void setSoff(String soff) {
		this.soff = soff;
	}

	@Override
	public String toString() {
		return "storeSearch [mNo=" + mNo + ", sName=" + sName + ", sNo=" + sNo + ", sTel=" + sTel + ", sAddress="
				+ sAddress + ", deliveryKm=" + deliveryKm + ", sInfo=" + sInfo + ", openTime=" + openTime + ", sStatus="
				+ sStatus + ", sAccept=" + sAccept + ", sCategory=" + sCategory + ", deliveryCharge=" + deliveryCharge
				+ ", minPrice=" + minPrice + ", soff=" + soff + "]";
	}

	
	
	

}
