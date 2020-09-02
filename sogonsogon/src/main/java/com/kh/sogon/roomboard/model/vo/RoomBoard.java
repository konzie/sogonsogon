package com.kh.sogon.roomboard.model.vo;

import java.sql.Timestamp;

public class RoomBoard {

	private int roomBoardNo;
	private int roomNo;
	private String roomBoardType;
	private String roomBoardTitle;
	private String roomBoardContent;
	private int roomBoardWriterNo;
	private String roomBoardWriter;
	private Timestamp roomBoardCreateDate;
	private Timestamp roomBoardModifyDate;
	private int roomBoardReadCount;
	
	public RoomBoard() {
		// TODO Auto-generated constructor stub
	}

	public int getRoomBoardNo() {
		return roomBoardNo;
	}

	public void setRoomBoardNo(int roomBoardNo) {
		this.roomBoardNo = roomBoardNo;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public String getRoomBoardType() {
		return roomBoardType;
	}

	public void setRoomBoardType(String roomBoardType) {
		this.roomBoardType = roomBoardType;
	}

	public String getRoomBoardTitle() {
		return roomBoardTitle;
	}

	public void setRoomBoardTitle(String roomBoardTitle) {
		this.roomBoardTitle = roomBoardTitle;
	}

	public String getRoomBoardContent() {
		return roomBoardContent;
	}

	public void setRoomBoardContent(String roomBoardContent) {
		this.roomBoardContent = roomBoardContent;
	}

	public int getRoomBoardWriterNo() {
		return roomBoardWriterNo;
	}

	public void setRoomBoardWriterNo(int roomBoardWriterNo) {
		this.roomBoardWriterNo = roomBoardWriterNo;
	}

	public String getRoomBoardWriter() {
		return roomBoardWriter;
	}

	public void setRoomBoardWriter(String roomBoardWriter) {
		this.roomBoardWriter = roomBoardWriter;
	}

	public Timestamp getRoomBoardCreateDate() {
		return roomBoardCreateDate;
	}

	public void setRoomBoardCreateDate(Timestamp roomBoardCreateDate) {
		this.roomBoardCreateDate = roomBoardCreateDate;
	}

	public Timestamp getRoomBoardModifyDate() {
		return roomBoardModifyDate;
	}

	public void setRoomBoardModifyDate(Timestamp roomBoardModifyDate) {
		this.roomBoardModifyDate = roomBoardModifyDate;
	}

	public int getRoomBoardReadCount() {
		return roomBoardReadCount;
	}

	public void setRoomBoardReadCount(int roomBoardReadCount) {
		this.roomBoardReadCount = roomBoardReadCount;
	}

	@Override
	public String toString() {
		return "RoomBoard [roomBoardNo=" + roomBoardNo + ", roomNo=" + roomNo + ", roomBoardType=" + roomBoardType
				+ ", roomBoardTitle=" + roomBoardTitle + ", roomBoardContent=" + roomBoardContent
				+ ", roomBoardWriterNo=" + roomBoardWriterNo + ", roomBoardWriter=" + roomBoardWriter
				+ ", roomBoardCreateDate=" + roomBoardCreateDate + ", roomBoardModifyDate=" + roomBoardModifyDate
				+ ", roomBoardReadCount=" + roomBoardReadCount + "]";
	}
	
	
}
