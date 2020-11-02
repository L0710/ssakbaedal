package com.kh.ssakbaedal.notice.model.vo;

import java.sql.Date;

public class Notice {

	/*NID	NUMBER
	NTITLE	VARCHAR2(100 BYTE)
	NCONTENT	VARCHAR2(4000 BYTE)
	NWRITER	VARCHAR2(15 BYTE)
	N_CREATE_DATE	DATE
	N_MODIFY_DATE	DATE
	N_STATUS	VARCHAR2(1 BYTE)
	MNO	NUMBER
	NSORT	VARCHAR2(6 BYTE)*/
	
	private int nId;
	private String nTitle;
	private String nContent;
	private String nWriter;
	private Date nCreateDate;
	private Date nModifyDate;
	private String nStatus;
	private int mNo;
	private String nSort;
	
	public Notice() {}

	public Notice(int nId, String nTitle, String nContent, String nWriter, Date nCreateDate, Date nModifyDate,
			String nStatus, int mNo, String nSort) {
		super();
		this.nId = nId;
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.nWriter = nWriter;
		this.nCreateDate = nCreateDate;
		this.nModifyDate = nModifyDate;
		this.nStatus = nStatus;
		this.mNo = mNo;
		this.nSort = nSort;
	}

	public int getnId() {
		return nId;
	}

	public void setnId(int nId) {
		this.nId = nId;
	}

	public String getnTitle() {
		return nTitle;
	}

	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}

	public String getnContent() {
		return nContent;
	}

	public void setnContent(String nContent) {
		this.nContent = nContent;
	}

	public String getnWriter() {
		return nWriter;
	}

	public void setnWriter(String nWriter) {
		this.nWriter = nWriter;
	}

	public Date getnCreateDate() {
		return nCreateDate;
	}

	public void setnCreateDate(Date nCreateDate) {
		this.nCreateDate = nCreateDate;
	}

	public Date getnModifyDate() {
		return nModifyDate;
	}

	public void setnModifyDate(Date nModifyDate) {
		this.nModifyDate = nModifyDate;
	}

	public String getnStatus() {
		return nStatus;
	}

	public void setnStatus(String nStatus) {
		this.nStatus = nStatus;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getnSort() {
		return nSort;
	}

	public void setnSort(String nSort) {
		this.nSort = nSort;
	}

	@Override
	public String toString() {
		return "Notice [nId=" + nId + ", nTitle=" + nTitle + ", nContent=" + nContent + ", nWriter=" + nWriter
				+ ", nCreateDate=" + nCreateDate + ", nModifyDate=" + nModifyDate + ", nStatus=" + nStatus + ", mNo="
				+ mNo + ", nSort=" + nSort + "]";
	}
	
	
	
	
}
