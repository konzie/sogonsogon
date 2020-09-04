package com.kh.sogon.mypage.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.sogon.member.model.vo.Member;
import com.kh.sogon.mypage.service.MypageService;

@SessionAttributes({"loginMember"})
@Controller
@RequestMapping("/mypage/*")
public class MypageController {
	
	@Autowired
	private MypageService mypageService;
	
	
	@RequestMapping("myboard")
	public String mypage() {
			return "mypage/myboard";
	}
	
	@RequestMapping("adminpage")
	public String adminpage() {
			return "mypage/adminmain";
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
	
	@Autowired // bcrypt 암호화 객체 의존성 주입(DI)
	private BCryptPasswordEncoder bcPwd;
	@ResponseBody
	@RequestMapping("checkPwd")
	public int checkPwd(String memberPass, Model model, RedirectAttributes rdAttr) {
		
		System.out.println("memberPass : " + memberPass);
		Member loginMember = (Member)model.getAttribute("loginMember");
		loginMember.setMemberPwd(memberPass);
		
		String checkPass = mypageService.checkPwd(loginMember);
		
		int result = 1;
		
		if(checkPass != null) { 
			if(bcPwd.matches(loginMember.getMemberPwd(), checkPass)) {
				result=0;
			}
		}
		
		return result;
	}
	// 회원 정보 수정
	@RequestMapping("updateInfo")
	public String myInfo2(Model model, RedirectAttributes rdAttr) {

		return "mypage/myInfo2";
		}
	
	@RequestMapping("adminreport")
	public String adminreport() {
		return "mypage/adminreport";
		}
	
	@RequestMapping("adminqna")
	public String adminqna() {
		return "mypage/adminqna";
		}
	
	@RequestMapping("adminnotice")
	public String adminnotice() {
		return "mypage/adminnotice";
		}
	
	@RequestMapping("adminmember")
	public String adminmember() {
		return "mypage/adminmember";
		}
}
