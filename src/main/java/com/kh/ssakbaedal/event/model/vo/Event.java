package com.kh.ssakbaedal.event.model.vo;

import java.sql.Date;

public class Event {
/*	ENO	NUMBER
	ETITLE	VARCHAR2(100 BYTE)
	ECONTENT	VARCHAR2(4000 BYTE)
	EWRITER	VARCHAR2(30 BYTE)
	E_POINT	NUMBER
	ECOUNT	NUMBER
	E_CREATE_DATE	DATE
	E_MODIFY_DATE	DATE
	E_STATUS	VARCHAR2(1 BYTE)
	E_START_DATE	DATE
	E_END_DATE	DATE
	E_LEVEL	NUMBER
	R_AVAILABLE	VARCHAR2(1 BYTE)
	MNO	NUMBER */
	private int eNo;
	private String eTitle;
	private String eContent;
	private String eWriter;
	private int ePoint;
	private int eCount;
	private Date eCreateDate;
	private Date eModifyDate;
	private String eStatus;
	private Date eStartDate;
	private Date eEndDate;
	private int eLevel;
	private String rAvailable;
	private int mNo;
	
	public Event() {}

	public Event(int eNo, String eTitle, String eContent, String eWriter, int ePoint, int eCount, Date eCreateDate,
			Date eModifyDate, String eStatus, Date eStartDate, Date eEndDate, int eLevel, String rAvailable, int mNo) {
		super();
		this.eNo = eNo;
		this.eTitle = eTitle;
		this.eContent = eContent;
		this.eWriter = eWriter;
		this.ePoint = ePoint;
		this.eCount = eCount;
		this.eCreateDate = eCreateDate;
		this.eModifyDate = eModifyDate;
		this.eStatus = eStatus;
		this.eStartDate = eStartDate;
		this.eEndDate = eEndDate;
		this.eLevel = eLevel;
		this.rAvailable = rAvailable;
		this.mNo = mNo;
	}

	public int geteNo() {
		return eNo;
	}

	public void seteNo(int eNo) {
		this.eNo = eNo;
	}

	public String geteTitle() {
		return eTitle;
	}

	public void seteTitle(String eTitle) {
		this.eTitle = eTitle;
	}

	public String geteContent() {
		return eContent;
	}

	public void seteContent(String eContent) {
		this.eContent = eContent;
	}

	public String geteWriter() {
		return eWriter;
	}

	public void seteWriter(String eWriter) {
		this.eWriter = eWriter;
	}

	public int getePoint() {
		return ePoint;
	}

	public void setePoint(int ePoint) {
		this.ePoint = ePoint;
	}

	public int geteCount() {
		return eCount;
	}

	public void seteCount(int eCount) {
		this.eCount = eCount;
	}

	public Date geteCreateDate() {
		return eCreateDate;
	}

	public void seteCreateDate(Date eCreateDate) {
		this.eCreateDate = eCreateDate;
	}

	public Date geteModifyDate() {
		return eModifyDate;
	}

	public void seteModifyDate(Date eModifyDate) {
		this.eModifyDate = eModifyDate;
	}

	public String geteStatus() {
		return eStatus;
	}

	public void seteStatus(String eStatus) {
		this.eStatus = eStatus;
	}

	public Date geteStartDate() {
		return eStartDate;
	}

	public void seteStartDate(Date eStartDate) {
		this.eStartDate = eStartDate;
	}

	public Date geteEndDate() {
		return eEndDate;
	}

	public void seteEndDate(Date eEndDate) {
		this.eEndDate = eEndDate;
	}

	public int geteLevel() {
		return eLevel;
	}

	public void seteLevel(int eLevel) {
		this.eLevel = eLevel;
	}

	public String getrAvailable() {
		return rAvailable;
	}

	public void setrAvailable(String rAvailable) {
		this.rAvailable = rAvailable;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	@Override
	public String toString() {
		return "Event [eNo=" + eNo + ", eTitle=" + eTitle + ", eContent=" + eContent + ", eWriter=" + eWriter
				+ ", ePoint=" + ePoint + ", eCount=" + eCount + ", eCreateDate=" + eCreateDate + ", eModifyDate="
				+ eModifyDate + ", eStatus=" + eStatus + ", eStartDate=" + eStartDate + ", eEndDate=" + eEndDate
				+ ", eLevel=" + eLevel + ", rAvailable=" + rAvailable + ", mNo=" + mNo + "]";
	}
	
	
}
