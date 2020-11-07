package com.kh.ssakbaedal.store.model.vo;

import java.sql.Date;

public class OpenDB {
	
	private int mNo;
	private int sStatus;
	private String startDate;
	private String endDate;
	private Date today;
	
	public OpenDB() {}

	public OpenDB(int mNo, int sStatus, String startDate, String endDate, Date today) {
		super();
		this.mNo = mNo;
		this.sStatus = sStatus;
		this.startDate = startDate;
		this.endDate = endDate;
		this.today = today;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public int getsStatus() {
		return sStatus;
	}

	public void setsStatus(int sStatus) {
		this.sStatus = sStatus;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public Date getToday() {
		return today;
	}

	public void setToday(Date today) {
		this.today = today;
	}

	@Override
	public String toString() {
		return "OpenDB [mNo=" + mNo + ", sStatus=" + sStatus + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", today=" + today + "]";
	}



}

