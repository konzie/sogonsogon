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
	private String qnaWriter;
	private String writerName;
	private String qnaContent;
	private String writerNick;
	private int writer;
	
	public Board(){
		
	}

	public Board(int qnaNo, String qnaCategory, String qnaTitle, String qnaStatus, String qnaAnswer, Date qnaModifyDate,
			Date qnaCreateDate, String qnaWriter, String writerName, String qnaContent, String writerNick) {
		super();
		this.qnaNo = qnaNo;
		this.qnaCategory = qnaCategory;
		this.qnaTitle = qnaTitle;
		this.qnaStatus = qnaStatus;
		this.qnaAnswer = qnaAnswer;
		this.qnaModifyDate = qnaModifyDate;
		this.qnaCreateDate = qnaCreateDate;
		this.qnaWriter = qnaWriter;
		this.writerName = writerName;
		this.qnaContent = qnaContent;
		this.writerNick = writerNick;
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
	
	public String getQnaWriter() {
		return qnaWriter;
	}

	public void setQnaWriter(String qnaWriter) {
		this.qnaWriter = qnaWriter;
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

	public String getWriterNick() {
		return writerNick;
	}

	public void setWriterNick(String writerNick) {
		this.writerNick = writerNick;
	}
  
	public Board(int qnaNo) {
		super();
		this.qnaNo = qnaNo;
	}

	public int getWriter() {
		return writer;
	}

	public void setWriter(int writer) {
		this.writer = writer;
	}

	@Override
	public String toString() {
		return "Board [qnaNo=" + qnaNo + ", qnaCategory=" + qnaCategory + ", qnaTitle=" + qnaTitle + ", qnaStatus="
				+ qnaStatus + ", qnaAnswer=" + qnaAnswer + ", qnaModifyDate=" + qnaModifyDate + ", qnaCreateDate="
				+ qnaCreateDate + ", qnaWriter=" + qnaWriter + ", writerName=" + writerName + ", qnaContent="
				+ qnaContent + ", writerNick=" + writerNick + ", writer=" + writer + "]";
	}


}