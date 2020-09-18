package com.kh.sogon.mypage.model.vo;

import java.sql.Date;

public class HelpAnswer {
	
	private int answerNo;
	private String answerContent;
	private Date answerCreateDate;
	private String answerStatus;
	private int helpNo;
	
	public HelpAnswer() {
		// TODO Auto-generated constructor stub
	}

	public HelpAnswer(int answerNo, String answerContent, Date answerCreateDate, String answerStatus, int helpNo) {
		super();
		this.answerNo = answerNo;
		this.answerContent = answerContent;
		this.answerCreateDate = answerCreateDate;
		this.answerStatus = answerStatus;
		this.helpNo = helpNo;
	}

	public int getAnswerNo() {
		return answerNo;
	}

	public void setAnswerNo(int answerNo) {
		this.answerNo = answerNo;
	}

	public String getAnswerContent() {
		return answerContent;
	}

	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}

	public Date getAnswerCreateDate() {
		return answerCreateDate;
	}

	public void setAnswerCreateDate(Date answerCreateDate) {
		this.answerCreateDate = answerCreateDate;
	}

	public String getAnswerStatus() {
		return answerStatus;
	}

	public void setAnswerStatus(String answerStatus) {
		this.answerStatus = answerStatus;
	}

	public int getHelpNo() {
		return helpNo;
	}

	public void setHelpNo(int helpNo) {
		this.helpNo = helpNo;
	}

	@Override
	public String toString() {
		return "HelpAnswer [answerNo=" + answerNo + ", answerContent=" + answerContent + ", answerCreateDate="
				+ answerCreateDate + ", answerStatus=" + answerStatus + ", helpNo=" + helpNo + "]";
	}
}
