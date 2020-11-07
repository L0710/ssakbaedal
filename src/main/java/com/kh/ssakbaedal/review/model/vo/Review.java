package com.kh.ssakbaedal.review.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import com.kh.ssakbaedal.common.attachment.Attachment;
import com.kh.ssakbaedal.common.reply.Reply;

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
	private String rWriter;
	private Date rCreateDate;
	private Date rModifyDate;
	private String rStatus;
	private int rStar;
	private ArrayList<Attachment> alist;
	private ArrayList<Reply> reply;
	
	public Review() {}

	public Review(int oNo, int rType, String rContent, String rWriter, Date rCreateDate, Date rModifyDate,
			String rStatus, int rStar, ArrayList<Attachment> alist, ArrayList<Reply> reply) {
		super();
		this.oNo = oNo;
		this.rType = rType;
		this.rContent = rContent;
		this.rWriter = rWriter;
		this.rCreateDate = rCreateDate;
		this.rModifyDate = rModifyDate;
		this.rStatus = rStatus;
		this.rStar = rStar;
		this.alist = alist;
		this.reply = reply;
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

	public String getrWriter() {
		return rWriter;
	}

	public void setrWriter(String rWriter) {
		this.rWriter = rWriter;
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

	public ArrayList<Reply> getReply() {
		return reply;
	}

	public void setReply(ArrayList<Reply> reply) {
		this.reply = reply;
	}

	@Override
	public String toString() {
		return "Review [oNo=" + oNo + ", rType=" + rType + ", rContent=" + rContent + ", rWriter=" + rWriter
				+ ", rCreateDate=" + rCreateDate + ", rModifyDate=" + rModifyDate + ", rStatus=" + rStatus + ", rStar="
				+ rStar + ", alist=" + alist + ", reply=" + reply + "]";
	}

}
