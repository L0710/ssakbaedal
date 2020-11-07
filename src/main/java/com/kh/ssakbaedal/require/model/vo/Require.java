package com.kh.ssakbaedal.require.model.vo;

import java.sql.Date;

public class Require {
	/*RENO	NUMBER						문의 번호
	RETITLE	VARCHAR2(100 BYTE)			문의 제목
	RECONTENT	VARCHAR2(4000 BYTE)		문의 내용
	REWRITER	VARCHAR2(15 BYTE)		문의 작성자
	RE_CREATE_DATE	DATE				작성날짜
	RE_MODIFY_DATE	DATE				수정날짜
	RE_STATUS	VARCHAR2(1 BYTE)		게시여부(Y/N)
	RE_ANSWER	VARCHAR2(1 BYTE)		답변여부(Y/N)
	MNO	NUMBER							회원번호		*/
	
	private int reNo;			// 문의 번호
	private String reTitle;		// 문의 제목
	private String reContent;	// 문의 내용
	private String reWriter;	// 문의 작성자
	private Date reCreateDate;	// 작성날짜
	private Date reModifyDate;	// 수정날짜
	private String reStatus;	// 게시여부(Y/N)
	private String reAnswer;	// 답변여부(Y/N)
	private int mNo;			// 회원번호
	
	public Require() {}

	public Require(int reNo, String reTitle, String reContent, String reWriter, Date reCreateDate, Date reModifyDate,
			String reStatus, String reAnswer, int mNo) {
		super();
		this.reNo = reNo;
		this.reTitle = reTitle;
		this.reContent = reContent;
		this.reWriter = reWriter;
		this.reCreateDate = reCreateDate;
		this.reModifyDate = reModifyDate;
		this.reStatus = reStatus;
		this.reAnswer = reAnswer;
		this.mNo = mNo;
	}

	public int getReNo() {
		return reNo;
	}

	public void setReNo(int reNo) {
		this.reNo = reNo;
	}

	public String getReTitle() {
		return reTitle;
	}

	public void setReTitle(String reTitle) {
		this.reTitle = reTitle;
	}

	public String getReContent() {
		return reContent;
	}

	public void setReContent(String reContent) {
		this.reContent = reContent;
	}

	public String getReWriter() {
		return reWriter;
	}

	public void setReWriter(String reWriter) {
		this.reWriter = reWriter;
	}

	public Date getReCreateDate() {
		return reCreateDate;
	}

	public void setReCreateDate(Date reCreateDate) {
		this.reCreateDate = reCreateDate;
	}

	public Date getReModifyDate() {
		return reModifyDate;
	}

	public void setReModifyDate(Date reModifyDate) {
		this.reModifyDate = reModifyDate;
	}

	public String getReStatus() {
		return reStatus;
	}

	public void setReStatus(String reStatus) {
		this.reStatus = reStatus;
	}

	public String getReAnswer() {
		return reAnswer;
	}

	public void setReAnswer(String reAnswer) {
		this.reAnswer = reAnswer;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	@Override
	public String toString() {
		return "Require [reNo=" + reNo + ", reTitle=" + reTitle + ", reContent=" + reContent + ", reWriter=" + reWriter
				+ ", reCreateDate=" + reCreateDate + ", reModifyDate=" + reModifyDate + ", reStatus=" + reStatus
				+ ", reAnswer=" + reAnswer + ", mNo=" + mNo + "]";
	};
	
	
	
}
