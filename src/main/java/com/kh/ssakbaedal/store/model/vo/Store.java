package com.kh.ssakbaedal.store.model.vo;

public class Store {
	private String sNo;
	private String sName;
	private String sTel;
	private String sAddress;
	private int deliveryKm;
	private String sInfo;
	private String openTime;
	private int sStatus;
	private String sAccept;
	private String sCategory;
	private int delivercharge;
	private int minPrice;
	
	public Store () {}

	public Store(String sNo, String sName, String sTel, String sAddress, int deliveryKm, String sInfo, String openTime,
			int sStatus, String sAccept, String sCategory, int delivercharge, int minPrice) {
		super();
		this.sNo = sNo;
		this.sName = sName;
		this.sTel = sTel;
		this.sAddress = sAddress;
		this.deliveryKm = deliveryKm;
		this.sInfo = sInfo;
		this.openTime = openTime;
		this.sStatus = sStatus;
		this.sAccept = sAccept;
		this.sCategory = sCategory;
		this.delivercharge = delivercharge;
		this.minPrice = minPrice;
	}

	public String getsNo() {
		return sNo;
	}

	public void setsNo(String sNo) {
		this.sNo = sNo;
	}

	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
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

	public int getDelivercharge() {
		return delivercharge;
	}

	public void setDelivercharge(int delivercharge) {
		this.delivercharge = delivercharge;
	}

	public int getMinPrice() {
		return minPrice;
	}

	public void setMinPrice(int minPrice) {
		this.minPrice = minPrice;
	}

	@Override
	public String toString() {
		return "Store [sNo=" + sNo + ", sName=" + sName + ", sTel=" + sTel + ", sAddress=" + sAddress + ", deliveryKm="
				+ deliveryKm + ", sInfo=" + sInfo + ", openTime=" + openTime + ", sStatus=" + sStatus + ", sAccept="
				+ sAccept + ", sCategory=" + sCategory + ", delivercharge=" + delivercharge + ", minPrice=" + minPrice
				+ "]";
	}
	
	
}
