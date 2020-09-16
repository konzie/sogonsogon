package com.kh.sogon.mypage.model.vo;

import java.sql.Date;

public class ReportMember {
	
	private int memberNo;
	private String reportStatus;
	private int reportCount;
	private Date reportDate;
	private String memberNick;
	private int boardNo;
	
	public ReportMember() {
		// TODO Auto-generated constructor stub
	}

	public ReportMember(int memberNo, String reportStatus, int reportCount, Date reportDate, String memberNick) {
		super();
		this.memberNo = memberNo;
		this.reportStatus = reportStatus;
		this.reportCount = reportCount;
		this.reportDate = reportDate;
		this.memberNick = memberNick;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getReportStatus() {
		return reportStatus;
	}

	public void setReportStatus(String reportStatus) {
		this.reportStatus = reportStatus;
	}

	public int getReportCount() {
		return reportCount;
	}

	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
	}

	public Date getReportDate() {
		return reportDate;
	}

	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}

	public String getMemberNick() {
		return memberNick;
	}

	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	@Override
	public String toString() {
		return "ReportMember [memberNo=" + memberNo + ", reportStatus=" + reportStatus + ", reportCount=" + reportCount
				+ ", reportDate=" + reportDate + ", memberNick=" + memberNick + ", boardNo=" + boardNo + "]";
	}
	
	
}
