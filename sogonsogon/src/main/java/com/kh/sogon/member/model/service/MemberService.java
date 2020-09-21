package com.kh.sogon.member.model.service;

import java.util.Map;

import javax.mail.MessagingException;

import com.kh.sogon.member.model.vo.Member;

public interface MemberService {

	// 로그인 
	Member login(Member member);

	//회원가입(중복체크)
	int idDupCheck(String memberId);

	//회원가입
	void signUp(Member signUpMember) throws Exception ;
	
	// 회원가입 (이메일 인증 키 검증)
	Member userAuth(String authKey) throws Exception ;
	
	// 아이디찾기
	String findId(Map<String, Object> map);

	// 비밀번호 찾기
	int findPwd(Map<String, Object> paramMap);

	// 비밀번호 찾기 (메일인증 보내기)
	void sendPwd(Map<String, Object> paramMap) throws MessagingException;



}
