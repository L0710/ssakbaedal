package com.kh.ssakbaedal.order.model.vo;

import java.util.ArrayList;
import java.util.Date;

public class V_Order {
	/*MNO	NUMBER
	OPHONE	VARCHAR2(15)
	OADDRESS	VARCHAR2(500)
	OTIME	DATE
	O_STATUS	VARCHAR2(1)
	MN_NAME	VARCHAR2(50)
	ODNUM	NUMBER
	MN_PRICE NUMBER
	FEE	NUMBER
	OPRICE	NUMBER
	REQUEST	VARCHAR2(100)
	SNAME	VARCHAR2(50)
	STEL	VARCHAR2(15)
	FILE_PATH	VARCHAR2(300)
	PNO	NUMBER
	OPOINT	NUMBER
	ARRIVAL_TIME	NUMBER
	ONO	NUMBER*/
	
	private int mNo;	// 주문자번호
	private String oPhone;	// 주문자연락처
	private String oAddress;	// 주문자주소
	private Date oTime;	// 주문날짜
	private String oStatus;	// 주문상태
	private String mnName;	// 메뉴명
	private int odNum;	// 주문수량
	private int mnPrice;	// 단가
	private int fee;	// 배달비
	private int oPrice;	// 총결제금액
	private String request;	// 요청사항
	private String sName;	// 점포명
	private String sTel;	// 점포연락처
	private String filePath;	// 점포이미지
	private int pNo;	// 결제번호
	private int oPoint;	// 사용포인트
	private int arrivalTime;	// 도착예정시간
	private int oNo;	// 주문번호
	private ArrayList<ODetail> ODetail;	// 메뉴
	
	public V_Order() {}

	public V_Order(int mNo, String oPhone, String oAddress, Date oTime, String oStatus, String mnName, int odNum,
			int mnPrice, int fee, int oPrice, String request, String sName, String sTel, String filePath, int pNo,
			int oPoint, int arrivalTime, int oNo, ArrayList<com.kh.ssakbaedal.order.model.vo.ODetail> oDetail) {
		super();
		this.mNo = mNo;
		this.oPhone = oPhone;
		this.oAddress = oAddress;
		this.oTime = oTime;
		this.oStatus = oStatus;
		this.mnName = mnName;
		this.odNum = odNum;
		this.mnPrice = mnPrice;
		this.fee = fee;
		this.oPrice = oPrice;
		this.request = request;
		this.sName = sName;
		this.sTel = sTel;
		this.filePath = filePath;
		this.pNo = pNo;
		this.oPoint = oPoint;
		this.arrivalTime = arrivalTime;
		this.oNo = oNo;
		ODetail = oDetail;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getoPhone() {
		return oPhone;
	}

	public void setoPhone(String oPhone) {
		this.oPhone = oPhone;
	}

	public String getoAddress() {
		return oAddress;
	}

	public void setoAddress(String oAddress) {
		this.oAddress = oAddress;
	}

	public Date getoTime() {
		return oTime;
	}

	public void setoTime(Date oTime) {
		this.oTime = oTime;
	}

	public String getoStatus() {
		return oStatus;
	}

	public void setoStatus(String oStatus) {
		this.oStatus = oStatus;
	}

	public String getMnName() {
		return mnName;
	}

	public void setMnName(String mnName) {
		this.mnName = mnName;
	}

	public int getOdNum() {
		return odNum;
	}

	public void setOdNum(int odNum) {
		this.odNum = odNum;
	}

	public int getMnPrice() {
		return mnPrice;
	}

	public void setMnPrice(int mnPrice) {
		this.mnPrice = mnPrice;
	}

	public int getFee() {
		return fee;
	}

	public void setFee(int fee) {
		this.fee = fee;
	}

	public int getoPrice() {
		return oPrice;
	}

	public void setoPrice(int oPrice) {
		this.oPrice = oPrice;
	}

	public String getRequest() {
		return request;
	}

	public void setRequest(String request) {
		this.request = request;
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

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public int getoPoint() {
		return oPoint;
	}

	public void setoPoint(int oPoint) {
		this.oPoint = oPoint;
	}

	public int getArrivalTime() {
		return arrivalTime;
	}

	public void setArrivalTime(int arrivalTime) {
		this.arrivalTime = arrivalTime;
	}

	public int getoNo() {
		return oNo;
	}

	public void setoNo(int oNo) {
		this.oNo = oNo;
	}

	public ArrayList<ODetail> getODetail() {
		return ODetail;
	}

	public void setODetail(ArrayList<ODetail> oDetail) {
		ODetail = oDetail;
	}

	@Override
	public String toString() {
		return "V_Order [mNo=" + mNo + ", oPhone=" + oPhone + ", oAddress=" + oAddress + ", oTime=" + oTime
				+ ", oStatus=" + oStatus + ", mnName=" + mnName + ", odNum=" + odNum + ", mnPrice=" + mnPrice + ", fee="
				+ fee + ", oPrice=" + oPrice + ", request=" + request + ", sName=" + sName + ", sTel=" + sTel
				+ ", filePath=" + filePath + ", pNo=" + pNo + ", oPoint=" + oPoint + ", arrivalTime=" + arrivalTime
				+ ", oNo=" + oNo + ", ODetail=" + ODetail + "]";
	}

}
