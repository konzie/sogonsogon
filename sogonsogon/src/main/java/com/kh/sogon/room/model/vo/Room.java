package com.kh.sogon.room.model.vo;

import java.sql.Timestamp;

public class Room {

	private int roomNo;
	private int memberNo;
	private String memberId; // 삭제한 컬럼임
	private String roomTitle;
	private String roomContent;
	private String roomPassword;
	private int roomType;
	private String roomTypeName; // roomType에 따른 구분명
	private Timestamp roomCreateDate;
	private Timestamp roomModifyDate;
	private char roomOpen;
	private String memberNick;
	private String roomTag;
	private int roomMemberCount;

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

	public String getMemberNick() {
		return memberNick;
	}

	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}

	public String getRoomTag() {
		return roomTag;
	}

	public void setRoomTag(String roomTag) {
		this.roomTag = roomTag;
	}

	public int getRoomMemberCount() {
		return roomMemberCount;
	}

	public void setRoomMemberCount(int roomMemberCount) {
		this.roomMemberCount = roomMemberCount;
	}

	@Override
	public String toString() {
		return "Room [roomNo=" + roomNo + ", memberNo=" + memberNo + ", memberId=" + memberId + ", roomTitle="
				+ roomTitle + ", roomContent=" + roomContent + ", roomPassword=" + roomPassword + ", roomType="
				+ roomType + ", roomTypeName=" + roomTypeName + ", roomCreateDate=" + roomCreateDate
				+ ", roomModifyDate=" + roomModifyDate + ", roomOpen=" + roomOpen + ", memberNick=" + memberNick
				+ ", roomTag=" + roomTag + ", roomMemberCount=" + roomMemberCount + "]";
	}

}
