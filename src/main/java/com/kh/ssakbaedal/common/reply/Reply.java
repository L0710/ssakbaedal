package com.kh.ssakbaedal.common.reply;

import java.util.Date;

public class Reply {
	/*RNO	NUMBER
	RCONTENT	VARCHAR2(500 BYTE)
	RWRITER	VARCHAR2(10 BYTE)
	R_CREATE_DATE	DATE
	R_MODIFY_DATE	DATE
	R_STATUS	VARCHAR2(1 BYTE)
	R_TYPE	NUMBER
	REF_ENO	NUMBER
	REID	NUMBER
	MNO	NUMBER
	ONO	NUMBER*/
	
	private int rNo;
	private String rContent;
	private String rWriter;
	private Date rCreateDate;
	private Date rModifyDate;
	private String rStatus;
	private int rType;
	private int refENo;
	private int reId;
	private int mNo;
	private int oNo;
	
	public Reply() {}

	public Reply(int rNo, String rContent, String rWriter, Date rCreateDate, Date rModifyDate, String rStatus,
			int rType, int refENo, int reId, int mNo, int oNo) {
		super();
		this.rNo = rNo;
		this.rContent = rContent;
		this.rWriter = rWriter;
		this.rCreateDate = rCreateDate;
		this.rModifyDate = rModifyDate;
		this.rStatus = rStatus;
		this.rType = rType;
		this.refENo = refENo;
		this.reId = reId;
		this.mNo = mNo;
		this.oNo = oNo;
	}

	public int getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
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

	public int getrType() {
		return rType;
	}

	public void setrType(int rType) {
		this.rType = rType;
	}

	public int getRefENo() {
		return refENo;
	}

	public void setRefENo(int refENo) {
		this.refENo = refENo;
	}

	public int getReId() {
		return reId;
	}

	public void setReId(int reId) {
		this.reId = reId;
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

	@Override
	public String toString() {
		return "Reply [rNo=" + rNo + ", rContent=" + rContent + ", rWriter=" + rWriter + ", rCreateDate=" + rCreateDate
				+ ", rModifyDate=" + rModifyDate + ", rStatus=" + rStatus + ", rType=" + rType + ", refENo=" + refENo
				+ ", reId=" + reId + ", mNo=" + mNo + ", oNo=" + oNo + "]";
	}

}
