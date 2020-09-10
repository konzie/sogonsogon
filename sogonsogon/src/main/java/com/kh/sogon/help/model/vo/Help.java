package com.kh.sogon.help.model.vo;

import java.sql.Timestamp;

public class Help {
	private int helpNo;
	private String helpCategory;
	private String helpTitle;
	private String helpContent;
	private String helpWriter;
	private Timestamp helpCreateDate;
	private Timestamp helpModifyDate;
	private String helpStatus;
	private String WriterName;
	
	
	public Help() {
		// TODO Auto-generated constructor stub
	}


	public Help(int helpNo, String helpCategory, String helpTitle, String helpContent, String helpWriter,
			Timestamp helpCreateDate, Timestamp helpModifyDate) {
		super();
		this.helpNo = helpNo;
		this.helpCategory = helpCategory;
		this.helpTitle = helpTitle;
		this.helpContent = helpContent;
		this.helpWriter = helpWriter;
		this.helpCreateDate = helpCreateDate;
		this.helpModifyDate = helpModifyDate;
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


	public String getHelpWriter() {
		return helpWriter;
	}


	public void setHelpWriter(String helpWriter) {
		this.helpWriter = helpWriter;
	}


	public Timestamp getHelpCreateDate() {
		return helpCreateDate;
	}


	public void setHelpCreateDate(Timestamp helpCreateDate) {
		this.helpCreateDate = helpCreateDate;
	}


	public Timestamp getHelpModifyDate() {
		return helpModifyDate;
	}


	public void setHelpModifyDate(Timestamp helpModifyDate) {
		this.helpModifyDate = helpModifyDate;
	}


	public String getHelpStatus() {
		return helpStatus;
	}


	public void setHelpStatus(String helpStatus) {
		this.helpStatus = helpStatus;
	}


	public String getWriterName() {
		return WriterName;
	}


	public void setWriterName(String writerName) {
		WriterName = writerName;
	}


	@Override
	public String toString() {
		return "Help [helpNo=" + helpNo + ", helpCategory=" + helpCategory + ", helpTitle=" + helpTitle
				+ ", helpContent=" + helpContent + ", helpWriter=" + helpWriter + ", helpCreateDate=" + helpCreateDate
				+ ", helpModifyDate=" + helpModifyDate + ", helpStatus=" + helpStatus + ", WriterName=" + WriterName
				+ "]";
	}

	
	

}
