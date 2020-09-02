package com.kh.sogon.board.model.vo;

import java.sql.Date;

public class Board {

	private int qnaNo;
	private String qnaCategory;
	private String qnaTitle;
	private String qnaStatus;
	private String qnaAnswer;
	private Date qnaModifyDate;
	private Date qnaCreateDate;
	
	public Board(){
		
	}

	public Board(int qnaNo, String qnaTitle, String qnaStatus, String qnaAnswer, Date qnaModifyDate,
			Date qnaCreateDate, String qnaCategory) {
		super();
		this.qnaNo = qnaNo;
		this.qnaTitle = qnaTitle;
		this.qnaStatus = qnaStatus;
		this.qnaAnswer = qnaAnswer;
		this.qnaModifyDate = qnaModifyDate;
		this.qnaCreateDate = qnaCreateDate;
		this.qnaCategory = qnaCategory;
	}

	public String getQnaCategory() {
		return qnaCategory;
	}

	public void setQnaCategory(String qnaCategory) {
		this.qnaCategory = qnaCategory;
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaStatus() {
		return qnaStatus;
	}

	public void setQnaStatus(String qnaStatus) {
		this.qnaStatus = qnaStatus;
	}

	public String getQnaAnswer() {
		return qnaAnswer;
	}

	public void setQnaAnswer(String qnaAnswer) {
		this.qnaAnswer = qnaAnswer;
	}

	public Date getQnaModifyDate() {
		return qnaModifyDate;
	}

	public void setQnaModifyDate(Date qnaModifyDate) {
		this.qnaModifyDate = qnaModifyDate;
	}

	public Date getQnaCreateDate() {
		return qnaCreateDate;
	}

	public void setQnaCreateDate(Date qnaCreateDate) {
		this.qnaCreateDate = qnaCreateDate;
	}

	@Override
	public String toString() {
		return "Board [qnaNo=" + qnaNo + ", qnaCategory=" + qnaCategory + ", qnaTitle=" + qnaTitle + ", qnaStatus="
				+ qnaStatus + ", qnaAnswer=" + qnaAnswer + ", qnaModifyDate=" + qnaModifyDate + ", qnaCreateDate="
				+ qnaCreateDate + "]";
	}

	
	
	
}
