package com.kh.sogon.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
@SessionAttributes({"loginMember"})
@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	
	@RequestMapping("signUpView")
	   public String signUpView() {
		   return "member/signUpView";
	   }
}
