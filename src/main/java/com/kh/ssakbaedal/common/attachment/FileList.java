package com.kh.ssakbaedal.common.attachment;

import java.util.List;

public class FileList {
	 private List<Attachment> fileList;
	 
	 public  FileList () {}

	public FileList(List<Attachment> fileList) {
		super();
		this.fileList = fileList;
	}

	public List<Attachment> getFileList() {
		return fileList;
	}

	public void setFileList(List<Attachment> fileList) {
		this.fileList = fileList;
	}

	@Override
	public String toString() {
		return "FileList [fileList=" + fileList + "]";
	}
	 
	 
}
