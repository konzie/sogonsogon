package com.kh.sogon.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
			rdAttr.addFlashAttribute("msg","아이디 또는 비밀번호를 확인해주세요");

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
	
	
	// 회원가입 (아이디 중복체크)
	
	@ResponseBody
	@RequestMapping("idDupCheck")
	public String idDupCheck(String memberId) {
		int result = memberService.idDupCheck(memberId);
		
		return result+""; // int를 string으로
	}
	
	
	
	// 회원가입
										//여기서 POST방식으로 했는데.. GET이라서 안 넘어온다구..
										//그래서 일단 GET을 같이써주니까 되긴되는데..괜찮은건가
										//- > 해결... 
//	@RequestMapping(value="signUpAction", method= {RequestMethod.POST,RequestMethod.GET})
	@RequestMapping(value="signUpAction", method= {RequestMethod.POST})
	public String signUpAction(Member signUpMember, 
								RedirectAttributes rdAttr) {
		System.out.println(signUpMember);
		
		
		try {
			int result = memberService.signUp(signUpMember);
			
			String msg=null;
			String status=null;
			
			if(result>0) {
	            status = "success";
	            msg = "회원 가입 성공!";
	         }else {
	            status= "error";
	            msg = "회원 가입 실패";
	         }
			
			rdAttr.addFlashAttribute("msg", msg);
	        rdAttr.addFlashAttribute("status", status);

			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "redirect:/";
	}
	
	
	
}
