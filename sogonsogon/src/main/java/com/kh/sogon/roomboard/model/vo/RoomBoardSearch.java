package com.kh.sogon.roomboard.model.vo;

public class RoomBoardSearch {
	private String sKey;
	private String sVal;

	public RoomBoardSearch() {
	}

	public String getsKey() {
		return sKey;
	}

	public void setsKey(String sKey) {
		this.sKey = sKey;
	}

	public String getsVal() {
		return sVal;
	}

	public void setsVal(String sVal) {
		this.sVal = sVal;
	}

	@Override
	public String toString() {
		return "RoomBoardSearch [sKey=" + sKey + ", sVal=" + sVal + "]";
	}


}
