package com.kh.sogon.help.model.vo;

public class HelpAttachment {
	private int fileNo;
	private int parentHelpNo;
	private String fileOriginName;
	private String fileChangeName;
	private String filePath;
	private int fileLevel;
	
	public HelpAttachment() {
		// TODO Auto-generated constructor stub
	}

	public HelpAttachment(int fileNo, int parentHelpNo, String fileOriginName, String fileChangeName, String filePath,
			int fileLevel) {
		super();
		this.fileNo = fileNo;
		this.parentHelpNo = parentHelpNo;
		this.fileOriginName = fileOriginName;
		this.fileChangeName = fileChangeName;
		this.filePath = filePath;
		this.fileLevel = fileLevel;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public int getParentHelpNo() {
		return parentHelpNo;
	}

	public void setParentHelpNo(int parentHelpNo) {
		this.parentHelpNo = parentHelpNo;
	}

	public String getFileOriginName() {
		return fileOriginName;
	}

	public void setFileOriginName(String fileOriginName) {
		this.fileOriginName = fileOriginName;
	}

	public String getFileChangeName() {
		return fileChangeName;
	}

	public void setFileChangeName(String fileChangeName) {
		this.fileChangeName = fileChangeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	@Override
	public String toString() {
		return "HelpAttachment [fileNo=" + fileNo + ", parentHelpNo=" + parentHelpNo + ", fileOriginName="
				+ fileOriginName + ", fileChangeName=" + fileChangeName + ", filePath=" + filePath + ", fileLevel="
				+ fileLevel + "]";
	}

	
	
}
