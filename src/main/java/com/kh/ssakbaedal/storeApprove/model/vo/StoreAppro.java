package com.kh.ssakbaedal.storeApprove.model.vo;

public class StoreAppro {

	/*MNO	NUMBER					회원번호
	SNAME	VARCHAR2(50 BYTE)		매장명
	SNO	VARCHAR2(20 BYTE)			사업자번호
	STEL	VARCHAR2(15 BYTE)		매장전화번호
	S_ADDRESS	VARCHAR2(100 BYTE)	매장주소
	DELIVERY_KM	NUMBER				배달가능거리
	SINFO	VARCHAR2(600 BYTE)		매장소개
	OPEN_TIME	VARCHAR2(300 BYTE)	운영시간
	S_STATUS	NUMBER				매장상태
	SACCEPT	VARCHAR2(2 BYTE)		매장승인여부
	S_CATEGORY	VARCHAR2(20 BYTE)	카테고리
	DELIVERY_CHARGE	NUMBER			배달비
	MIN_PRICE	NUMBER				최소배달금액
	SOFF	VARCHAR2(50 BYTE)		??			*/
	
	private int mNo;			// 회원번호
	private String sName;		// 매장명
	private String sNo;			// 사업자번호
	private String sTel;		// 매장전화번호
	private String sAddress;	// 매장주소
	private int deliveryKm;		// 배달가능거리
	private String sInfo;		// 매장 소개
	private String openTime;	// 운영시간
	private int sStatus;		// 매장상태
	private String sAccept;		// 매장승인여부
	private String sCategory;	// 카테고리
	private int deliveryCharge;	// 배달비
	private int minPrice;		// 최소배달금액
	private String soff;		// ??
	
	public StoreAppro() {}

	public StoreAppro(int mNo, String sName, String sNo, String sTel, String sAddress, int deliveryKm, String sInfo,
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
		return "StoreAppro [mNo=" + mNo + ", sName=" + sName + ", sNo=" + sNo + ", sTel=" + sTel + ", sAddress="
				+ sAddress + ", deliveryKm=" + deliveryKm + ", sInfo=" + sInfo + ", openTime=" + openTime + ", sStatus="
				+ sStatus + ", sAccept=" + sAccept + ", sCategory=" + sCategory + ", deliveryCharge=" + deliveryCharge
				+ ", minPrice=" + minPrice + ", soff=" + soff + "]";
	}
	
	
	
}
