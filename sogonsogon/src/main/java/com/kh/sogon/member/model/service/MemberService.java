package com.kh.sogon.member.model.service;

import java.util.Map;

import com.kh.sogon.member.model.vo.Member;

public interface MemberService {

	// 로그인 
	Member login(Member member);

	//회원가입(중복체크)
	int idDupCheck(String memberId);

	//회원가입
	int signUp(Member signUpMember) throws Exception;

	// 아이디찾기
	String findId(Map<String, Object> map);

}
