package com.kh.sogon.mypage.model.vo;

public class memberSearch {
	private String sKey;
	private String sVal;
	
	public memberSearch() {
		// TODO Auto-generated constructor stub
	}

	public memberSearch(String sKey, String sVal) {
		super();
		this.sKey = sKey;
		this.sVal = sVal;
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
		return "memberSearch [sKey=" + sKey + ", sVal=" + sVal + "]";
	}
	
	
}
