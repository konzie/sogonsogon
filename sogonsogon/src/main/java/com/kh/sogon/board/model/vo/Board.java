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
	private String writer;
	private String writerName;
	private String qnaContent;
	private String qnaWriter;
	public Board(){
		
	}



	public Board(int qnaNo, String qnaCategory, String qnaTitle, String qnaStatus, String qnaAnswer, Date qnaModifyDate,
			Date qnaCreateDate, String qnaContent, String qnaWriter) {
		super();
		this.qnaNo = qnaNo;
		this.qnaCategory = qnaCategory;
		this.qnaTitle = qnaTitle;
		this.qnaStatus = qnaStatus;
		this.qnaAnswer = qnaAnswer;
		this.qnaModifyDate = qnaModifyDate;
		this.qnaCreateDate = qnaCreateDate;
		this.qnaContent = qnaContent;
		this.qnaWriter = qnaWriter;
	}



	public int getQnaNo() {
		return qnaNo;
	}



	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}



	public String getQnaCategory() {
		return qnaCategory;
	}



	public void setQnaCategory(String qnaCategory) {
		this.qnaCategory = qnaCategory;
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

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getWriterName() {
		return writerName;
	}

	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}
	
	public String getQnaContent() {
		return qnaContent;
	}



	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}



	public String getQnaWriter() {
		return qnaWriter;
	}



	public void setQnaWriter(String qnaWriter) {
		this.qnaWriter = qnaWriter;
	}

	@Override
	public String toString() {
		return "Board [qnaNo=" + qnaNo + ", qnaCategory=" + qnaCategory + ", qnaTitle=" + qnaTitle + ", qnaStatus="
				+ qnaStatus + ", qnaAnswer=" + qnaAnswer + ", qnaModifyDate=" + qnaModifyDate + ", qnaCreateDate="
				+ qnaCreateDate + ", writer=" + writer + ", writerName=" + writerName + ", qnaContent=" + qnaContent
				+ ", qnaWriter=" + qnaWriter + "]";
	}
	
}
