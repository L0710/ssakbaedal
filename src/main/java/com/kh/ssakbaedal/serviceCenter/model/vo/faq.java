package com.kh.ssakbaedal.serviceCenter.model.vo;

import java.sql.Date;

public class faq {
	
	/*FNO	NUMBER 질문번호
	FWRITER	VARCHAR2(30 BYTE) 		질문 작성자
	FTITLE	VARCHAR2(100 BYTE) 		질문 제목
	FCONTENT	VARCHAR2(4000 BYTE) 질문 내용
	F_STATUS	VARCHAR2(1 BYTE) 	질문상태
	F_CREATE_DATE	DATE			질문 작성일
	F_MODIFY_DATE	DATE 			질문 수정일*/
	
	private int fNo;			// FAQ번호
	private String fWriter; 	// FAQ작성자
	private String fTitle;		// FAQ제목
	private String fContent;	// FAQ내용
	private String fStatus;		// FAQ상태
	private Date fCreateDate;	// FAQ작성 날짜
	private Date fModifyDate;	// FAQ수정 날짜
	
	public faq() {}

	public faq(int fNo, String fWriter, String fTitle, String fContent, String fStatus, Date fCreateDate,
			Date fModifyDate) {
		super();
		this.fNo = fNo;
		this.fWriter = fWriter;
		this.fTitle = fTitle;
		this.fContent = fContent;
		this.fStatus = fStatus;
		this.fCreateDate = fCreateDate;
		this.fModifyDate = fModifyDate;
	}

	public int getfNo() {
		return fNo;
	}

	public void setfNo(int fNo) {
		this.fNo = fNo;
	}

	public String getfWriter() {
		return fWriter;
	}

	public void setfWriter(String fWriter) {
		this.fWriter = fWriter;
	}

	public String getfTitle() {
		return fTitle;
	}

	public void setfTitle(String fTitle) {
		this.fTitle = fTitle;
	}

	public String getfContent() {
		return fContent;
	}

	public void setfContent(String fContent) {
		this.fContent = fContent;
	}

	public String getfStatus() {
		return fStatus;
	}

	public void setfStatus(String fStatus) {
		this.fStatus = fStatus;
	}

	public Date getfCreateDate() {
		return fCreateDate;
	}

	public void setfCreateDate(Date fCreateDate) {
		this.fCreateDate = fCreateDate;
	}

	public Date getfModifyDate() {
		return fModifyDate;
	}

	public void setfModifyDate(Date fModifyDate) {
		this.fModifyDate = fModifyDate;
	}

	@Override
	public String toString() {
		return "faq [fNo=" + fNo + ", fWriter=" + fWriter + ", fTitle=" + fTitle + ", fContent=" + fContent
				+ ", fStatus=" + fStatus + ", fCreateDate=" + fCreateDate + ", fModifyDate=" + fModifyDate + "]";
	}

	

	

	

	

	
	
	
	
	
}
