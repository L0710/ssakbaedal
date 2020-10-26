package com.kh.ssakbaedal.store.model.vo;

import java.util.List;

public class Menu {
	
	private int mnNo;
	private String mnName;
	private String mnCategory;
	private String mnStatus;
	private int mNo;
	private String smallCate;
	private int mnPrice;
	
	public Menu() {}

	public Menu(int mnNo, String mnName, String mnCategory, String mnStatus, int mNo, String smallCate, int mnPrice) {
		super();
		this.mnNo = mnNo;
		this.mnName = mnName;
		this.mnCategory = mnCategory;
		this.mnStatus = mnStatus;
		this.mNo = mNo;
		this.smallCate = smallCate;
		this.mnPrice = mnPrice;
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

	public String getMnCategory() {
		return mnCategory;
	}

	public void setMnCategory(String mnCategory) {
		this.mnCategory = mnCategory;
	}

	public String getMnStatus() {
		return mnStatus;
	}

	public void setMnStatus(String mnStatus) {
		this.mnStatus = mnStatus;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getSmallCate() {
		return smallCate;
	}

	public void setSmallCate(String smallCate) {
		this.smallCate = smallCate;
	}

	public int getMnPrice() {
		return mnPrice;
	}

	public void setMnPrice(int mnPrice) {
		this.mnPrice = mnPrice;
	}

	@Override
	public String toString() {
		return "Menu [mnNo=" + mnNo + ", mnName=" + mnName + ", mnCategory=" + mnCategory + ", mnStatus=" + mnStatus
				+ ", mNo=" + mNo + ", smallCate=" + smallCate + ", mnPrice=" + mnPrice + "]";
	}
}
