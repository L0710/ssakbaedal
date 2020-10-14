package com.kh.ssakbaedal.common.attachment;

import java.sql.Date;

public class Attachment {
	/*ANO	NUMBER
	ORIGINAL_NAME	VARCHAR2(100 BYTE)
	CHANGE_NAME	VARCHAR2(100 BYTE)
	FILE_PATH	VARCHAR2(300 BYTE)
	UPLOAD_DATE	DATE
	FILE_LEVEL	NUMBER
	A_STATUS	VARCHAR2(1 BYTE)
	A_TYPE	NUMBER
	REF_ID	NUMBER*/
	
	private int aNo;
	private String originalFileName;
	private String changeFileName;
	private String filePath;
	private Date uploadDate;
	private int fileLevel;
	private String aStatus;
	private int aType;
	private int refId;
	
	public Attachment() {}

	public Attachment(int aNo, String originalFileName, String changeFileName, String filePath, Date uploadDate,
			int fileLevel, String aStatus, int aType, int refId) {
		super();
		this.aNo = aNo;
		this.originalFileName = originalFileName;
		this.changeFileName = changeFileName;
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

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getChangeFileName() {
		return changeFileName;
	}

	public void setChangeFileName(String changeFileName) {
		this.changeFileName = changeFileName;
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
		return "Attachment [aNo=" + aNo + ", originalFileName=" + originalFileName + ", changeFileName="
				+ changeFileName + ", filePath=" + filePath + ", uploadDate=" + uploadDate + ", fileLevel=" + fileLevel
				+ ", aStatus=" + aStatus + ", aType=" + aType + ", refId=" + refId + "]";
	}
	
}
