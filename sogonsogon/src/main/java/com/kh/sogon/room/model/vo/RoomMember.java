package com.kh.sogon.room.model.vo;

import java.sql.Timestamp;

public class RoomMember {
	private int roomMemberRoomNo;
	private int roomMemberMemberNo;
	private char roomMemberMemberGrade;
	private Timestamp roomMemberEnrollDate;
	
	public RoomMember() {
	}



	public int getRoomMemberRoomNo() {
		return roomMemberRoomNo;
	}



	public void setRoomMemberRoomNo(int roomMemberRoomNo) {
		this.roomMemberRoomNo = roomMemberRoomNo;
	}



	public RoomMember(int roomMemberRoomNo, int roomMemberMemberNo, char roomMemberMemberGrade,
			Timestamp roomMemberEnrollDate) {
		super();
		this.roomMemberRoomNo = roomMemberRoomNo;
		this.roomMemberMemberNo = roomMemberMemberNo;
		this.roomMemberMemberGrade = roomMemberMemberGrade;
		this.roomMemberEnrollDate = roomMemberEnrollDate;
	}



	public int getRoomMemberMemberNo() {
		return roomMemberMemberNo;
	}

	public void setRoomMemberMemberNo(int roomMemberMemberNo) {
		this.roomMemberMemberNo = roomMemberMemberNo;
	}

	public char getRoomMemberMemberGrade() {
		return roomMemberMemberGrade;
	}

	public void setRoomMemberMemberGrade(char roomMemberMemberGrade) {
		this.roomMemberMemberGrade = roomMemberMemberGrade;
	}

	public Timestamp getRoomMemberEnrollDate() {
		return roomMemberEnrollDate;
	}

	public void setRoomMemberEnrollDate(Timestamp roomMemberEnrollDate) {
		this.roomMemberEnrollDate = roomMemberEnrollDate;
	}

	@Override
	public String toString() {
		return "RoomMember [roomMemberRoomNo=" + roomMemberRoomNo + ", roomMemberMemberNo=" + roomMemberMemberNo
				+ ", roomMemberMemberGrade=" + roomMemberMemberGrade + ", roomMemberEnrollDate=" + roomMemberEnrollDate
				+ "]";
	}

	
	
	
}
