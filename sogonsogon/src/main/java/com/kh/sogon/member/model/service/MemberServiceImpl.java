package com.kh.sogon.member.model.service;

import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.sogon.member.model.dao.MemberDAO;
import com.kh.sogon.member.model.vo.MailHandler;
import com.kh.sogon.member.model.vo.Member;
import com.kh.sogon.member.model.vo.TempKey;

@Service
public class MemberServiceImpl implements MemberService {

	   @Autowired 
	   private MemberDAO memberDAO;
	   @Autowired // bcrypt 암호화 객체 의존성 주입(DI)
	   private BCryptPasswordEncoder bcPwd;
	   
	   @Autowired
	private JavaMailSender mailSender;

	
	//로그인
	@Override
	public Member login(Member member) {
		
		
	      Member loginMember = memberDAO.login(member);
	      if(loginMember!=null) {
	    	  if(!bcPwd.matches(member.getMemberPwd(), loginMember.getMemberPwd())) {
	    		 
	    		  // 임시비밀번호 발급받은사람일때
	    		  if(member.getMemberPwd().equals(loginMember.getMemberPwd())) {
	    			  loginMember.setMemberPwd(null);
	    			  
	    		  } else {
	    		  // 임시비밀번호 발급받은사람아닐때	    		  
	    		  loginMember = null;
	    		  
	    		  }
	    	  }else {
	              loginMember.setMemberPwd(null);
	           }
	      }
	      
	      return loginMember;
	}

	// id 중복검사
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int idDupCheck(String memberId) {
		return memberDAO.idDupCheck(memberId);
	}

	// 회원가입
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void signUp(Member signUpMember) throws Exception {

		// 인증키 생성 & 세팅 
		String key= new TempKey().generateKey(30); 
		signUpMember.setAuthKey(key);
		
		
		//비밀번호 암호화 처리
		String encPwd = bcPwd.encode(signUpMember.getMemberPwd());
		signUpMember.setMemberPwd(encPwd);
		
		//db에 가입 정보 등록
		memberDAO.signUp(signUpMember);
		
		// 메일 전송
		MailHandler sendMail = new MailHandler(mailSender);
		 sendMail.setSubject("서비스 이메일 인증");
	  
	        sendMail.setText(
	                new StringBuffer().append("<h1>메일인증</h1>")
	                					.append("<a href='http://localhost:8080/sogon/member/emailConfirm?memberId=").
	                							append(signUpMember.getMemberId()).
												append("&authKey=").append(key).
												append("' target='_blank'>이메일 인증 확인</a>").toString());
												sendMail.setFrom("sogontest@gmail.com", "소곤소곤 ");

	        sendMail.setTo(signUpMember.getMemberId());
	        sendMail.send();
		
	}

	
	 //회원가입 (이메일 인증 키 검증)
    public Member userAuth(String authKey) throws Exception {
        Member member = new Member();
        member = memberDAO.chkAuth(authKey);
        System.out.println(authKey);
        
        System.out.println(member.toString());
        
        if(member!=null){
            try{
            	memberDAO.successAuthkey(member);
            	
            }catch (Exception e) {
                e.printStackTrace();
            }
        }
        return member;
    }



	// 아이디찾기
	@Override
	public String findId(Map<String, Object> map) {
		return memberDAO.findId(map);
	}

	// 비밀번호 찾기
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int findPwd(Map<String, Object> paramMap) {
		
		return memberDAO.findPwd(paramMap);
	}

	// 비밀번호 찾기 인증메일
	@Override
	public void sendPwd(Map<String, Object> paramMap) throws MessagingException {

		String setFrom = "sogontest@gmail.com";
        String memberName=(String) paramMap.get("memberName");
        String memberId=(String) paramMap.get("memberId"); // 받는사람 이메일(아이디)
        String memberPhone=(String) paramMap.get("memberPhone");
        String pw = (String) paramMap.get("pw");
        
        
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(message,
				true, "UTF-8");
		
		messageHelper.setFrom(setFrom); // 보내는사람 생략하면 정상작동을 안함
		messageHelper.setTo(memberId); // 받는사람 이메일
		messageHelper.setSubject(memberName+"님 비밀번호 찾기 메일입니다."); // 메일제목은 생략이 가능하다
		messageHelper.setText("임시 비밀번호는 "+pw+" 입니다."); // 메일 내용
    	
		mailSender.send(message);
		  
		
	}

	
	
	
	
	
	
	
	
	
}
