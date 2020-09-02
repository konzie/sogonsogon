package com.kh.sogon.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.sogon.member.model.service.MemberService;
import com.kh.sogon.member.model.vo.Member;
@SessionAttributes({"loginMember"})
@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	// 회원가입 화면 전환 메소드
	@RequestMapping("signUpView")
	   public String signUpView() {
		   return "member/signUpView";
	   }
	
	// 로그인 동작
	@RequestMapping("loginAction")
	public String loginAction(Member member, Model model, 
							RedirectAttributes rdAttr, String saveId, 
							HttpServletResponse response) { 
		
		
		System.out.println(member.getMemberId()+"/"+member.getMemberPwd());
		
		Member loginMember = memberService.login(member);
		System.out.println(loginMember);
		if(loginMember==null) {
			rdAttr.addFlashAttribute("status","error");
			rdAttr.addFlashAttribute("msg","로그인 실패");
			rdAttr.addFlashAttribute("text","아이디 또는 비밀번호를 확인해주세요");
		}else {
			model.addAttribute("loginMember",loginMember);

			Cookie cookie = new Cookie("saveId", member.getMemberId());
			if(saveId != null) { // 아이디 저장이 체크된 경우
				cookie.setMaxAge(60 * 60 * 24 * 3); // 쿠키 3일 유지
			}else {
				cookie.setMaxAge(0); // 쿠키 삭제
			}
			
			response.addCookie(cookie);		
		}
		
		return "redirect:/"; //메인 페이지 재요청
	}
	
	// 로그아웃
	@RequestMapping("logout")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:/";
	}
	
	
	
	
}
