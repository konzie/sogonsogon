package com.kh.sogon.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@Autowired // bcrypt 암호화 객체 의존성 주입(DI)
	private BCryptPasswordEncoder bcPwd;
	
	// 회원가입 화면 전환 메소드
	@RequestMapping("signUpView")
	   public String signUpView() {
		   return "member/signUpView";
	   }
	
	// 로그인 동작
	@RequestMapping("loginAction")
	public String loginAction(Member member, Model model, 
							RedirectAttributes rdAttr, String saveId, 
							HttpServletResponse response, HttpServletRequest request) { 
		
		
		Member loginMember = memberService.login(member);
		
		
		if(loginMember==null) {
			rdAttr.addFlashAttribute("status","error");
			rdAttr.addFlashAttribute("msg","아이디 또는 비밀번호를 확인해주세요");

		}else if(loginMember.getMemberStatus().equals("R")){
			rdAttr.addFlashAttribute("status","error");
			rdAttr.addFlashAttribute("msg","신고된 회원입니다. 해당 사이트를 이용하실 수 없습니다.");
		}else {
			model.addAttribute("loginMember",loginMember);
		}
		
		 String referer = request.getHeader("Referer");
		 return "redirect:"+ referer;
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
										
	@RequestMapping(value="signUpAction", method= {RequestMethod.POST})
	public String signUpAction(Member signUpMember, 
								RedirectAttributes rdAttr) {
		
		
		try {
			memberService.signUp(signUpMember);
			
			String msg=null;
			String status=null;
			
	        rdAttr.addFlashAttribute("msg", "로그인 전 가입시 사용한 이메일로 인증 완료해 주세요");
	        rdAttr.addFlashAttribute("status", "error");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/";
	}
	
	// 회원가입 (이메일 인증)
    @RequestMapping("emailConfirm")
    public String emailConfirm(@RequestParam("authKey")String authKey, 
                                Model model, RedirectAttributes rdAttr) throws Exception { 
        
        if(authKey == null) {
        	rdAttr.addFlashAttribute("msg", "인증키가 잘못되었습니다. 다시 인증해 주세요");
            return "redirect:/";
        }
        
        Member member = memberService.userAuth(authKey);
        
        
        if(member == null) {
        	rdAttr.addFlashAttribute("msg", "잘못된 접근 입니다. 다시 인증해 주세요");
            rdAttr.addFlashAttribute("status", "error");

        }
        
        rdAttr.addFlashAttribute("msg", "이메일 인증이 완료되었습니다. 이제 로그인이 가능합니다.");
        rdAttr.addFlashAttribute("status", "success");

        return  "redirect:/";
    }
	
	
	// 아이디찾기 화면 전환 메소드
	@RequestMapping("findIdForm")
	   public String findID() {
		   return "member/findIdForm";
	   }
	
	
	
	// 아이디찾기 동작
		@RequestMapping("findIdAction")
		public String findIdAction(HttpServletRequest request, HttpServletResponse response,
									Model model,RedirectAttributes rdAttr) {
			
		String memberName = request.getParameter("memberName");
		String memberPhone = request.getParameter("memberPhone");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberName", memberName);
		map.put("memberPhone", memberPhone);
		
		String findEmail = memberService.findId(map);
		
		String url = null;
		
		if(findEmail == null ) {
			
			rdAttr.addFlashAttribute("status","error");
			rdAttr.addFlashAttribute("msg","해당 정보의 아이디가 존재하지 않습니다.");	
			url="redirect:/member/findIdForm";
			
		} else { // 아이디찾기 성공시
			// 결과가 올바르면 model로 네임과 체크값, 이메일을 보내준다.
			model.addAttribute("memberName",memberName);
			model.addAttribute("findEmail",findEmail);
			url = "member/foundIdView";
		}
            return url;
		}
		
	

		// 비밀번호 찾기 화면 전환 메소드
		@RequestMapping("findPwdForm")
		   public String findPwd() {
			   return "member/findPwdForm";
		   }
		
		
		// 비밀번호 찾기
		
		@Autowired
		private JavaMailSender mailSender;
		
		@RequestMapping("sendPwd")
		public String sendEmailAction (@RequestParam Map<String, Object> paramMap,
										RedirectAttributes rdAttr) throws Exception {
		     
			
		        
		        // 임시 비밀번호 생성
		        String pw="";
		        for (int i=0; i<12 ; i++) {
		        	pw += (char) ((Math.random()*26)+97);
		        }
		        
		        paramMap.put("pw",pw);
		        
		        int result=memberService.findPwd(paramMap);

		        
		    
				String url="";
		        
		        if( result >0 ) {
		            
		            try {
		            	
		        		memberService.sendPwd(paramMap);
		            	
		            
		            } catch (Exception e) {
		            	e.printStackTrace();
		            }
		            
		            rdAttr.addFlashAttribute("status","success");
					rdAttr.addFlashAttribute("msg","임시비밀번호가 발송되었습니다. 메일함을 확인해주세요.");	
		          
		            url="redirect:/";
		            
		        }else {
		        	rdAttr.addFlashAttribute("status","error");
					rdAttr.addFlashAttribute("msg","아이디, 이름, 휴대폰번호를 확인해주세요.");	
					url="redirect:/member/findPwdForm";
		        }
		        
		        return url;
		    }


		// 회원가입 약관 화면 전환 메소드
		@RequestMapping("termsForm")
		   public String termsForm() {
			   return "member/termsForm";
		   }
		
	
}
