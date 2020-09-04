package com.kh.sogon.mypage.service;

import com.kh.sogon.member.model.vo.Member;


public interface MypageService {

	// 비밀번호 확인 Service
	public abstract String checkPwd(Member loginMember);

	// 회원 정보 수정 Service
	public abstract int updateInfo(Member loginMember, String newPwd1);

}
