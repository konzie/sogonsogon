package com.kh.sogon.room.model.vo;

import java.sql.Timestamp;

public class Room {

	private int roomNo;
	private int memberNo;
	private String memberId;
	private String roomTitle;
	private String roomContent;
	private String roomPassword;
	private int roomType;
	private String roomTypeName; // roomType에 따른 구분명
	private Timestamp roomCreateDate;
	private Timestamp roomModifyDate;
	private char roomOpen;

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int rommNo) {
		this.roomNo = rommNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getRoomTitle() {
		return roomTitle;
	}

	public void setRoomTitle(String roomTitle) {
		this.roomTitle = roomTitle;
	}

	public String getRoomContent() {
		return roomContent;
	}

	public void setRoomContent(String roomContent) {
		this.roomContent = roomContent;
	}

	public String getRoomPassword() {
		return roomPassword;
	}

	public void setRoomPassword(String roomPassword) {
		this.roomPassword = roomPassword;
	}

	public int getRoomType() {
		return roomType;
	}

	public void setRoomType(int roomType) {
		this.roomType = roomType;
	}

	public String getRoomTypeName() {
		return roomTypeName;
	}

	public void setRoomTypeName(String roomTypeName) {
		this.roomTypeName = roomTypeName;
	}

	public Timestamp getRoomCreateDate() {
		return roomCreateDate;
	}

	public void setRoomCreateDate(Timestamp roomCreateDate) {
		this.roomCreateDate = roomCreateDate;
	}

	public Timestamp getRoomModifyDate() {
		return roomModifyDate;
	}

	public void setRoomModifyDate(Timestamp roomModifyDate) {
		this.roomModifyDate = roomModifyDate;
	}

	public char getRoomOpen() {
		return roomOpen;
	}

	public void setRoomOpen(char roomOpen) {
		this.roomOpen = roomOpen;
	}

	@Override
	public String toString() {
		return "Room [roomNo=" + roomNo + ", memberNo=" + memberNo + ", memberId=" + memberId + ", roomTitle="
				+ roomTitle + ", roomContent=" + roomContent + ", roomPassword=" + roomPassword + ", roomType="
				+ roomType + ", roomTypeName=" + roomTypeName + ", roomCreateDate=" + roomCreateDate
				+ ", roomModifyDate=" + roomModifyDate + ", roomOpen=" + roomOpen + "]";
	}

}
