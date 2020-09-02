package com.kh.sogon.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@SessionAttributes({"loginMember"})
@Controller
@RequestMapping("/mypage/*")
public class MypageController {
	
	@RequestMapping("myboard")
	public String myboard() {
		return "mypage/myboard";
		}
	   
	@RequestMapping("myreply")
	public String myreply() {
		return "mypage/myreply";
		}
	
	@RequestMapping("myroom")
	public String myroom() {
		return "mypage/myroom";
		}
	
	@RequestMapping("myInfo")
	public String myInfo() {
		return "mypage/myInfo";
		}
	
	@RequestMapping("updateInfo")
	public String myInfo2() {
		return "mypage/myInfo2";
		}
}
