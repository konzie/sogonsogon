package com.kh.sogon.mypage.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.sogon.member.model.vo.Member;
import com.kh.sogon.mypage.dao.MypageDAO;

@Service
public class MypageServiceImpl implements MypageService{

	private MypageDAO mypageDAO;
	
	// 비밀번호 확인 Service 구현
	@Transactional(rollbackFor = Exception.class)	
	@Override
	public String checkPwd(Member loginMember) {
		return mypageDAO.checkPwd(loginMember);
	}

	// 회원정보 수정 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateInfo(Member loginMember, String newPwd1) {
		return mypageDAO.updateInfo(loginMember, newPwd1);
	}

}
