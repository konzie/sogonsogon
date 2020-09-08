package com.kh.sogon.mypage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.sogon.board.model.vo.Board;
import com.kh.sogon.board.model.vo.HelpBoard;
import com.kh.sogon.member.model.vo.Member;
import com.kh.sogon.board.model.vo.PageInfo;
import com.kh.sogon.mypage.model.service.MypageService;

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
	public String myInfo2(Member upMember, Model model, RedirectAttributes rdAttr) {

		Member loginMember = (Member)model.getAttribute("loginMember");
		
		upMember.setMemberNo(loginMember.getMemberNo());
		upMember.setMemberId(loginMember.getMemberId());
		upMember.setMemberName(loginMember.getMemberName());
		upMember.setMemberNick(loginMember.getMemberNick());
		upMember.setMemberAge(loginMember.getMemberAge());
		upMember.setMemberPhone(loginMember.getMemberPhone());
		upMember.setMemberEmail(loginMember.getMemberEmail());
		upMember.setMemberInterest(loginMember.getMemberInterest());
		
		// 회원 정보 수정 Service 호출
		int result = mypageService.updateMember(upMember);
		String status=null;
		String msg=null;
		
		if(result>0) {
			model.addAttribute("loginMember", upMember);
			status="success";
			msg="회원 정보 수정 성공";
		}else {
			status="error";
			msg="회원 정보 수정 실패";
		}

		rdAttr.addFlashAttribute("status",status);
		rdAttr.addFlashAttribute("msg",msg);
		
		return "mypage/myInfo2";
		}
	
	// 신고사항 조회
	@RequestMapping("adminreport")
	public String adminreport() {
		return "mypage/adminreport";
		}
	
	// 고객센터 조회
	@RequestMapping("adminhelp")
	public String adminqna(@RequestParam(value="cp", required=false, defaultValue = "1") int cp, Model model) {
		
		PageInfo pInfo = mypageService.qnaPage(cp);
		
		List<HelpBoard> helpList = mypageService.selectQList(pInfo);
		                                                                   
		model.addAttribute("helpList", helpList);
		model.addAttribute("pInfo", pInfo);

		return "mypage/adminhelp";
		}
	
	// 공지사항 조회
	@RequestMapping("adminnotice")
	public String adminnotice(@RequestParam(value="cp", required=false, defaultValue = "1") int cp, Model model) {
		
		PageInfo pInfo = mypageService.noticePage(cp);
		
		List<Board> qnaList = mypageService.selectNList(pInfo);
		                                                                   
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("pInfo", pInfo);
		
		return "mypage/adminnotice";
		}
	
	// 멤버 조회
	@RequestMapping("adminmember")
	public String adminmember(@RequestParam(value="cp", required=false, defaultValue = "1") int cp, Model model) {
		
		PageInfo pInfo = mypageService.memberPage(cp);
		
		List<Member> memberList = mypageService.selectMList(pInfo);
		
		model.addAttribute("memberList", memberList);
		model.addAttribute("pInfo", pInfo);
		
		return "mypage/adminmember";
		}
	
	// 회원 탈퇴
	@RequestMapping("deleteInfo")
	public String deleteInfo(Model model, RedirectAttributes rdAttr, SessionStatus sessionstatus) {
		Member loginMember = (Member)model.getAttribute("loginMember");
		System.out.println("loginMember :" + loginMember);
		int result = mypageService.deleteInfo(loginMember.getMemberNo());
		System.out.println(result);
		String status = null;
		String msg = null;
		String text = null;
		String url =null;
		
		if(result > 0) {
			status = "success";
			msg = "회원 탈퇴 성공";
			url ="/";
			
			sessionstatus.setComplete(); // 로그인 된 계정 세션 만료
		
		}else {
			status = "error";
			msg = "회원 탈퇴 실패";
			url = "/updateInfo2";
		}
				
		rdAttr.addFlashAttribute("status",status);
		rdAttr.addFlashAttribute("msg",msg);
		rdAttr.addFlashAttribute("text",text);
		
		return "redirect:"+url;
		}	
	
}
