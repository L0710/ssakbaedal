package com.kh.ssakbaedal.event.model.vo;

import java.sql.Date;

public class PointHistory {
	/*ENO	NUMBER
	MNO	NUMBER
	POINT	NUMBER
	P_DATE	DATE*/
	
	private int eNo;
	private int mNo;
	private int point;
	private Date pDate;
	
	public PointHistory() {}

	public PointHistory(int eNo, int mNo, int point, Date pDate) {
		super();
		this.eNo = eNo;
		this.mNo = mNo;
		this.point = point;
		this.pDate = pDate;
	}

	public int geteNo() {
		return eNo;
	}

	public void seteNo(int eNo) {
		this.eNo = eNo;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public Date getpDate() {
		return pDate;
	}

	public void setpDate(Date pDate) {
		this.pDate = pDate;
	}

	@Override
	public String toString() {
		return "PointHistory [eNo=" + eNo + ", mNo=" + mNo + ", point=" + point + ", pDate=" + pDate + "]";
	}
	
	
}
