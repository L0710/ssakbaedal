package com.kh.ssakbaedal.store.model.vo;

public class SetMenu {
	
/*	SMNO	NUMBER 세트메뉴 번호
SMNAME	VARCHAR2(30 BYTE) 세트메뉴 이름
SETLIST	VARCHAR2(200 BYTE) 세트메뉴에 포함되는 메뉴이름내역
SET_PRICE	NUMBER 세트메뉴 가격
MNO	NUMBER	회원번호
SET_MNNO VARCHAR2(100) 세트메뉴에 포함되는 메뉴번호내역
SET_STATUS VARCHAR2(1) 세트메뉴 상태*/
	
	private int smNo;
	private String smName;
	private String setList;
	private int setPrice;
	private int mNo;
	private String set_mnNo;
	private String setStatus;
	
	public SetMenu() {}

	public SetMenu(int smNo, String smName, String setList, int setPrice, int mNo, String set_mnNo, String setStatus) {
		super();
		this.smNo = smNo;
		this.smName = smName;
		this.setList = setList;
		this.setPrice = setPrice;
		this.mNo = mNo;
		this.set_mnNo = set_mnNo;
		this.setStatus = setStatus;
	}

	public int getSmNo() {
		return smNo;
	}

	public void setSmNo(int smNo) {
		this.smNo = smNo;
	}

	public String getSmName() {
		return smName;
	}

	public void setSmName(String smName) {
		this.smName = smName;
	}

	public String getSetList() {
		return setList;
	}

	public void setSetList(String setList) {
		this.setList = setList;
	}

	public int getSetPrice() {
		return setPrice;
	}

	public void setSetPrice(int setPrice) {
		this.setPrice = setPrice;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getSet_mnNo() {
		return set_mnNo;
	}

	public void setSet_mnNo(String set_mnNo) {
		this.set_mnNo = set_mnNo;
	}

	public String getSetStatus() {
		return setStatus;
	}

	public void setSetStatus(String setStatus) {
		this.setStatus = setStatus;
	}

	@Override
	public String toString() {
		return "SetMenu [smNo=" + smNo + ", smName=" + smName + ", setList=" + setList + ", setPrice=" + setPrice
				+ ", mNo=" + mNo + ", set_mnNo=" + set_mnNo + ", setStatus=" + setStatus + "]";
	}
	
	

}