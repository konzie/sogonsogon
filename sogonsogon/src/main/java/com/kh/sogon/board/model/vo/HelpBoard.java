package com.kh.sogon.board.model.vo;

import java.sql.Date;

public class HelpBoard {

	private int helpNo;
	private String helpCategory;
	private String helpTitle;
	private String helpContent;
	private String helpWwriter;
	private Date helpCreateDate;
	private Date helpModifyDate;
	private int helpStatus;
	private int boardType;
	private String writerName;
	
	public HelpBoard() {
		// TODO Auto-generated constructor stub
	}

	public HelpBoard(int helpNo, String helpCategory, String helpTitle, String helpContent, String helpWwriter,
			Date helpCreateDate, Date helpModifyDate, int helpStatus, int boardType, String writerName) {
		super();
		this.helpNo = helpNo;
		this.helpCategory = helpCategory;
		this.helpTitle = helpTitle;
		this.helpContent = helpContent;
		this.helpWwriter = helpWwriter;
		this.helpCreateDate = helpCreateDate;
		this.helpModifyDate = helpModifyDate;
		this.helpStatus = helpStatus;
		this.boardType = boardType;
		this.writerName = writerName;
	}

	public int getHelpNo() {
		return helpNo;
	}

	public void setHelpNo(int helpNo) {
		this.helpNo = helpNo;
	}

	public String getHelpCategory() {
		return helpCategory;
	}

	public void setHelpCategory(String helpCategory) {
		this.helpCategory = helpCategory;
	}

	public String getHelpTitle() {
		return helpTitle;
	}

	public void setHelpTitle(String helpTitle) {
		this.helpTitle = helpTitle;
	}

	public String getHelpContent() {
		return helpContent;
	}

	public void setHelpContent(String helpContent) {
		this.helpContent = helpContent;
	}

	public String getHelpWwriter() {
		return helpWwriter;
	}

	public void setHelpWwriter(String helpWwriter) {
		this.helpWwriter = helpWwriter;
	}

	public Date getHelpCreateDate() {
		return helpCreateDate;
	}

	public void setHelpCreateDate(Date helpCreateDate) {
		this.helpCreateDate = helpCreateDate;
	}

	public Date getHelpModifyDate() {
		return helpModifyDate;
	}

	public void setHelpModifyDate(Date helpModifyDate) {
		this.helpModifyDate = helpModifyDate;
	}

	public int getHelpStatus() {
		return helpStatus;
	}

	public void setHelpStatus(int helpStatus) {
		this.helpStatus = helpStatus;
	}

	public int getBoardType() {
		return boardType;
	}

	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}

	public String getWriterName() {
		return writerName;
	}

	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}

	@Override
	public String toString() {
		return "HelpBoard [helpNo=" + helpNo + ", helpCategory=" + helpCategory + ", helpTitle=" + helpTitle
				+ ", helpContent=" + helpContent + ", helpWwriter=" + helpWwriter + ", helpCreateDate=" + helpCreateDate
				+ ", helpModifyDate=" + helpModifyDate + ", helpStatus=" + helpStatus + ", boardType=" + boardType
				+ ", writerName=" + writerName + "]";
	}
	
	
}
