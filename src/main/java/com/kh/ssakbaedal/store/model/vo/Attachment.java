package com.kh.ssakbaedal.store.model.vo;

import java.sql.Date;

public class Attachment {
	private int aNo;
	private String originalName;
	private String chagneName;
	private String filePath;
	private Date uploadDate;
	private int fileLevel;
	private String aStatus;
	private int aType;
	private int refId;
	
	public Attachment(int aNo, String originalName, String chagneName, String filePath, Date uploadDate, int fileLevel,
			String aStatus, int aType, int refId) {
		super();
		this.aNo = aNo;
		this.originalName = originalName;
		this.chagneName = chagneName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.fileLevel = fileLevel;
		this.aStatus = aStatus;
		this.aType = aType;
		this.refId = refId;
	}

	public int getaNo() {
		return aNo;
	}

	public void setaNo(int aNo) {
		this.aNo = aNo;
	}

	public String getOriginalName() {
		return originalName;
	}

	public void setOriginalName(String originalName) {
		this.originalName = originalName;
	}

	public String getChagneName() {
		return chagneName;
	}

	public void setChagneName(String chagneName) {
		this.chagneName = chagneName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	public String getaStatus() {
		return aStatus;
	}

	public void setaStatus(String aStatus) {
		this.aStatus = aStatus;
	}

	public int getaType() {
		return aType;
	}

	public void setaType(int aType) {
		this.aType = aType;
	}

	public int getRefId() {
		return refId;
	}

	public void setRefId(int refId) {
		this.refId = refId;
	}

	@Override
	public String toString() {
		return "Attachment [aNo=" + aNo + ", originalName=" + originalName + ", chagneName=" + chagneName
				+ ", filePath=" + filePath + ", uploadDate=" + uploadDate + ", fileLevel=" + fileLevel + ", aStatus="
				+ aStatus + ", aType=" + aType + ", refId=" + refId + "]";
	}
	
	
}
