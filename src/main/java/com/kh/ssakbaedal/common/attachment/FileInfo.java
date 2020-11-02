package com.kh.ssakbaedal.common.attachment;

public class FileInfo {

	private String renamePath;
	
	private String renameFileName;

	public FileInfo(String renamePath, String renameFileName) {
		super();
		this.renamePath = renamePath;
		this.renameFileName = renameFileName;
	}

	public String getRenamePath() {
		return renamePath;
	}

	public void setRenamePath(String renamePath) {
		this.renamePath = renamePath;
	}

	public String getRenameFileName() {
		return renameFileName;
	}

	public void setRenameFileName(String renameFileName) {
		this.renameFileName = renameFileName;
	}

	@Override
	public String toString() {
		return "fileInfo [renamePath=" + renamePath + ", renameFileName=" + renameFileName + "]";
	}
	
	
}
