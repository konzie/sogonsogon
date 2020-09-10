package com.kh.sogon.help.model.vo;

import java.sql.Timestamp;

public class Answer {
	private int answerNo;                  
    private String answerContent;         
    private int parentHelpNo;            
    private String memberId;            
    private Timestamp answerCreateDate;    
    private Timestamp answerModifyDate;    
    private String answerStatus;     
    
    public Answer() {
		// TODO Auto-generated constructor stub
	}

	public Answer(int answerNo, String answerContent, int parentHelpNo, String memberId, Timestamp answerCreateDate,
			Timestamp answerModifyDate, String answerStatus) {
		super();
		this.answerNo = answerNo;
		this.answerContent = answerContent;
		this.parentHelpNo = parentHelpNo;
		this.memberId = memberId;
		this.answerCreateDate = answerCreateDate;
		this.answerModifyDate = answerModifyDate;
		this.answerStatus = answerStatus;
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

	public int getParentHelpNo() {
		return parentHelpNo;
	}

	public void setParentHelpNo(int parentHelpNo) {
		this.parentHelpNo = parentHelpNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public Timestamp getAnswerCreateDate() {
		return answerCreateDate;
	}

	public void setAnswerCreateDate(Timestamp answerCreateDate) {
		this.answerCreateDate = answerCreateDate;
	}

	public Timestamp getAnswerModifyDate() {
		return answerModifyDate;
	}

	public void setAnswerModifyDate(Timestamp answerModifyDate) {
		this.answerModifyDate = answerModifyDate;
	}

	public String getAnswerStatus() {
		return answerStatus;
	}

	public void setAnswerStatus(String answerStatus) {
		this.answerStatus = answerStatus;
	}

	@Override
	public String toString() {
		return "Answer [answerNo=" + answerNo + ", answerContent=" + answerContent + ", parentHelpNo=" + parentHelpNo
				+ ", memberId=" + memberId + ", answerCreateDate=" + answerCreateDate + ", answerModifyDate="
				+ answerModifyDate + ", answerStatus=" + answerStatus + "]";
	}

    
}
