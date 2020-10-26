package com.kh.ssakbaedal.review.model.vo;

import java.util.ArrayList;
import java.util.Date;

import com.kh.ssakbaedal.common.attachment.Attachment;
import com.kh.ssakbaedal.order.model.vo.ODetail;


public class V_Review {
	/*ORIGINAL_NAME	VARCHAR2(100)
	CHANGE_NAME	VARCHAR2(100)
	SNAME	VARCHAR2(50)
	STEL	VARCHAR2(15)
	OTIME	DATE
	RCONTENT	VARCHAR2(4000)
	RSTAR	NUMBER
	R_STATUS	VARCHAR2(1)
	ODMN	VARCHAR2(50)
	ODNUM	NUMBER
	MNO	NUMBER
	ONO	NUMBER*/
	
	private String originalFileName;	// 기존파일명
	private String changeFileName;	// 변경파일명
	private String sName;	// 점포명
	private String sTel;	// 점포연락처
	private Date oTime; // 주문날짜
	private String rContent;	// 리뷰내용
	private int rStar;	// 리뷰 별점
	private String rStatus;	// 리뷰 상태
	private int mnName;	// 메뉴명
	private int odNum;	// 주문수량
	private int mNo;	// 주문회원번호
	private int oNo;	// 주문번호
	private ArrayList<ODetail> oDetail;	// 메뉴
	private ArrayList<Attachment> attachment;	// 첨부파일
	
	public V_Review() {}

	public V_Review(String originalFileName, String changeFileName, String sName, String sTel, Date oTime,
			String rContent, int rStar, String rStatus, int mnName, int odNum, int mNo, int oNo,
			ArrayList<ODetail> oDetail, ArrayList<Attachment> attachment) {
		super();
		this.originalFileName = originalFileName;
		this.changeFileName = changeFileName;
		this.sName = sName;
		this.sTel = sTel;
		this.oTime = oTime;
		this.rContent = rContent;
		this.rStar = rStar;
		this.rStatus = rStatus;
		this.mnName = mnName;
		this.odNum = odNum;
		this.mNo = mNo;
		this.oNo = oNo;
		this.oDetail = oDetail;
		this.attachment = attachment;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getChangeFileName() {
		return changeFileName;
	}

	public void setChangeFileName(String changeFileName) {
		this.changeFileName = changeFileName;
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

	public Date getoTime() {
		return oTime;
	}

	public void setoTime(Date oTime) {
		this.oTime = oTime;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public int getrStar() {
		return rStar;
	}

	public void setrStar(int rStar) {
		this.rStar = rStar;
	}

	public String getrStatus() {
		return rStatus;
	}

	public void setrStatus(String rStatus) {
		this.rStatus = rStatus;
	}

	public int getMnName() {
		return mnName;
	}

	public void setMnName(int mnName) {
		this.mnName = mnName;
	}

	public int getOdNum() {
		return odNum;
	}

	public void setOdNum(int odNum) {
		this.odNum = odNum;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public int getoNo() {
		return oNo;
	}

	public void setoNo(int oNo) {
		this.oNo = oNo;
	}

	public ArrayList<ODetail> getoDetail() {
		return oDetail;
	}

	public void setoDetail(ArrayList<ODetail> oDetail) {
		this.oDetail = oDetail;
	}

	public ArrayList<Attachment> getAttachment() {
		return attachment;
	}

	public void setAttachment(ArrayList<Attachment> attachment) {
		this.attachment = attachment;
	}

	@Override
	public String toString() {
		return "V_Review [originalFileName=" + originalFileName + ", changeFileName=" + changeFileName + ", sName="
				+ sName + ", sTel=" + sTel + ", oTime=" + oTime + ", rContent=" + rContent + ", rStar=" + rStar
				+ ", rStatus=" + rStatus + ", mnName=" + mnName + ", odNum=" + odNum + ", mNo=" + mNo + ", oNo=" + oNo
				+ ", oDetail=" + oDetail + ", attachment=" + attachment + "]";
	}


}
