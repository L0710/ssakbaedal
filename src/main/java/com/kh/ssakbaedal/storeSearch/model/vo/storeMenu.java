package com.kh.ssakbaedal.storeSearch.model.vo;

public class storeMenu {
	/*MN_NO	NUMBER					메뉴번호
	MN_NAME	VARCHAR2(50 BYTE)		메뉴명
	MN_CATEGORY	VARCHAR2(50 BYTE)	메뉴 카테고리
	MN_STATUS	VARCHAR2(1 BYTE)	메뉴상태
	MNO	NUMBER						매장회원번호
	SMALL_CATE	VARCHAR2(30 BYTE)	메뉴 소카테고리
	MN_PRICE	NUMBER				메뉴 가격*/
	
	private int mnNo;			// 메뉴 번호
	private String mnName;		// 메뉴 명
	private String mnCategory;	// 메뉴 카테고리
	private String mnStatus;	// 메뉴 상태
	private int mNo;			// 매장 회원 번호
	private String smallCate;	// 메뉴 소카테고리
	private String mnPrice;		// 메뉴 가격
	
	public storeMenu() {}

	public storeMenu(int mnNo, String mnName, String mnCategory, String mnStatus, int mNo, String smallCate,
			String mnPrice) {
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

	public String getMnPrice() {
		return mnPrice;
	}

	public void setMnPrice(String mnPrice) {
		this.mnPrice = mnPrice;
	}

	@Override
	public String toString() {
		return "storeMenu [mnNo=" + mnNo + ", mnName=" + mnName + ", mnCategory=" + mnCategory + ", mnStatus="
				+ mnStatus + ", mNo=" + mNo + ", smallCate=" + smallCate + ", mnPrice=" + mnPrice + "]";
	}
	
	

}
