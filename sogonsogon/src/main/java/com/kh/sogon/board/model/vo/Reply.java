package com.kh.sogon.board.model.vo;

import java.sql.Date;

public class Reply {
	
	private int replyNo;
	private String content;
	private Date replyCreateDate;
	private Date replyModifyDate;
	private String replyStatus;
	private String replySelect;
	private int qnaNo;
	private int replyWriter;
	private String writerNick;
	private String qnaTitle;
	private String qnaContent;
	private int qnaWriter;
	

	public Reply() {
		// TODO Auto-generated constructor stub
	}

	public Reply(int replyNo, String content, Date replyCreateDate, Date replyModifyDate, String replyStatus,
			String replySelect, int qnaNo, int replyWriter, String writerNick) {
		super();
		this.replyNo = replyNo;
		this.content = content;
		this.replyCreateDate = replyCreateDate;
		this.replyModifyDate = replyModifyDate;
		this.replyStatus = replyStatus;
		this.replySelect = replySelect;
		this.qnaNo = qnaNo;
		this.replyWriter = replyWriter;
		this.writerNick = writerNick;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getReplyCreateDate() {
		return replyCreateDate;
	}

	public void setReplyCreateDate(Date replyCreateDate) {
		this.replyCreateDate = replyCreateDate;
	}

	public Date getReplyModifyDate() {
		return replyModifyDate;
	}

	public void setReplyModifyDate(Date replyModifyDate) {
		this.replyModifyDate = replyModifyDate;
	}

	public String getReplyStatus() {
		return replyStatus;
	}

	public void setReplyStatus(String replyStatus) {
		this.replyStatus = replyStatus;
	}

	public String getReplySelect() {
		return replySelect;
	}

	public void setReplySelect(String replySelect) {
		this.replySelect = replySelect;
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public int getReplyWriter() {
		return replyWriter;
	}

	public void setReplyWriter(int replyWriter) {
		this.replyWriter = replyWriter;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}
	
	public int getQnaWriter() {
		return qnaWriter;
	}

	public void setQnaWriter(int qnaWriter) {
		this.qnaWriter = qnaWriter;
	}

	public String getWriterNick() {
		return writerNick;
	}

	public void setWriterNick(String writerNick) {
		this.writerNick = writerNick;
	}

	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", content=" + content + ", replyCreateDate=" + replyCreateDate
				+ ", replyModifyDate=" + replyModifyDate + ", replyStatus=" + replyStatus + ", replySelect="
				+ replySelect + ", qnaNo=" + qnaNo + ", replyWriter=" + replyWriter + ", writerNick=" + writerNick
				+ ", qnaTitle=" + qnaTitle + ", qnaContent=" + qnaContent + ", qnaWriter=" + qnaWriter + "]";
	}
}
