package com.kh.sogon.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.sogon.member.model.dao.MemberDAO;
import com.kh.sogon.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	   @Autowired 
	   private MemberDAO memberDAO;
	   @Autowired // bcrypt 암호화 객체 의존성 주입(DI)
	   private BCryptPasswordEncoder bcPwd;
	
	@Override
	public Member login(Member member) {
		
		
	      Member loginMember = memberDAO.login(member);
//	      if(loginMember!=null) {
//	    	  if(!bcPwd.matches(member.getMemberPwd(), loginMember.getMemberPwd())) {
//	    		  loginMember = null;
//	    	  }else {
//	              loginMember.setMemberPwd(null);
//	           }
//	      }
		return loginMember;
	}

}
