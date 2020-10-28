package com.kh.ssakbaedal.review.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import com.kh.ssakbaedal.common.attachment.Attachment;

public class Review {
	/*ONO	NUMBER
	R_TYPE	NUMBER
	RCONTENT	VARCHAR2(4000 BYTE)
	R_CREATE_DATE	DATE
	R_MODIFY_DATE	DATE
	R_STATUS	VARCHAR2(1 BYTE)
	RSTAR	NUMBER*/
	
	private int oNo;
	private int rType;
	private String rContent;
	private Date rCreateDate;
	private Date rModifyDate;
	private String rStatus;
	private int rStar;
	private ArrayList<Attachment> alist;
	
	public Review() {}

	public Review(int oNo, int rType, String rContent, Date rCreateDate, Date rModifyDate, String rStatus, int rStar,
			ArrayList<Attachment> alist) {
		super();
		this.oNo = oNo;
		this.rType = rType;
		this.rContent = rContent;
		this.rCreateDate = rCreateDate;
		this.rModifyDate = rModifyDate;
		this.rStatus = rStatus;
		this.rStar = rStar;
		this.alist = alist;
	}

	public int getoNo() {
		return oNo;
	}

	public void setoNo(int oNo) {
		this.oNo = oNo;
	}

	public int getrType() {
		return rType;
	}

	public void setrType(int rType) {
		this.rType = rType;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public Date getrCreateDate() {
		return rCreateDate;
	}

	public void setrCreateDate(Date rCreateDate) {
		this.rCreateDate = rCreateDate;
	}

	public Date getrModifyDate() {
		return rModifyDate;
	}

	public void setrModifyDate(Date rModifyDate) {
		this.rModifyDate = rModifyDate;
	}

	public String getrStatus() {
		return rStatus;
	}

	public void setrStatus(String rStatus) {
		this.rStatus = rStatus;
	}

	public int getrStar() {
		return rStar;
	}

	public void setrStar(int rStar) {
		this.rStar = rStar;
	}

	public ArrayList<Attachment> getAlist() {
		return alist;
	}

	public void setAlist(ArrayList<Attachment> alist) {
		this.alist = alist;
	}

	@Override
	public String toString() {
		return "Review [oNo=" + oNo + ", rType=" + rType + ", rContent=" + rContent + ", rCreateDate=" + rCreateDate
				+ ", rModifyDate=" + rModifyDate + ", rStatus=" + rStatus + ", rStar=" + rStar + ", alist=" + alist
				+ "]";
	}

}
