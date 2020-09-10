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
import com.kh.sogon.help.model.vo.Help;
import com.kh.sogon.member.model.vo.Member;
import com.kh.sogon.board.model.vo.PageInfo;
import com.kh.sogon.board.model.vo.Reply;
import com.kh.sogon.boardreply.model.vo.BoardReply;
import com.kh.sogon.mypage.model.service.MypageService;

import sun.security.util.Length;

@SessionAttributes({"loginMember"})
@Controller
@RequestMapping("/mypage/*")
public class MypageController {
	
	@Autowired
	private MypageService mypageService;
	
	@RequestMapping("adminpage")
	public String adminpage() {
			return "mypage/adminmain";
	}
	
	@RequestMapping("myreply")
	public String myreply(@RequestParam(value="cp", required=false, defaultValue = "1") int cp, Model model) {
		
		Member loginMember = (Member)model.getAttribute("loginMember");
		
		PageInfo pInfo = mypageService.replyPage(cp, loginMember.getMemberNo());
		
		List<Reply> replyList = mypageService.selectRList(pInfo, loginMember.getMemberNo());
		                                                                   
		model.addAttribute("replyList", replyList);
		model.addAttribute("pInfo", pInfo);
		
		return "mypage/myreply";
		}
	
	@RequestMapping("myroom")
	public String myroom(@RequestParam(value="cp", required=false, defaultValue = "1") int cp, Model model) {
		return "mypage/myroom";
		}
	
	@RequestMapping("myboard")
	public String mypage(Member member, Model model, @RequestParam(value="cp", required=false, defaultValue = "1") int cp) {
		
		Member loginMember = (Member)model.getAttribute("loginMember");
		
		PageInfo pInfo = mypageService.boardPage(cp, loginMember.getMemberNo());
		
		List<Board> boardList = mypageService.selectBList(pInfo, loginMember.getMemberNo());
		                                                                   
		model.addAttribute("boardList", boardList);
		model.addAttribute("pInfo", pInfo);	
		
		return "mypage/myboard";
	}
	
	// 회원 정보 수정 메뉴 클릭 시
	@RequestMapping("myInfo")
	public String myInfo() {

		return "mypage/myInfo";
	}
	
	// 비밀번호 확인
	@ResponseBody
	@RequestMapping("checkPwd")
	public int checkPwd(String memberPass, Model model, RedirectAttributes rdAttr) {
		
		Member loginMember = (Member)model.getAttribute("loginMember");
		
		loginMember.setMemberPwd(memberPass);
		
		int result = mypageService.checkPwd(loginMember);
		
		return result;
	}
	
	// 비밀번호 확인 후 넘어가기
	@RequestMapping("myInfoView")
	public String myInfoView(Member member, Model model, RedirectAttributes rdAttr) {
		
		Member loginMember = (Member)model.getAttribute("loginMember");
		
		String tel2 = loginMember.getMemberPhone().substring(3,7);
		String tel3 = loginMember.getMemberPhone().substring(7,11);	
	
		model.addAttribute("tel2", tel2);
		model.addAttribute("tel3", tel3);
		
		return "mypage/myInfoView";
	}
	
	// 회원 정보 수정
	@RequestMapping("updateInfo")
	public String myInfo2(String pwd1,String nick, String tel1, String tel2, String tel3, String interest, Member upMember, Model model, RedirectAttributes rdAttr) {

		Member loginMember = (Member)model.getAttribute("loginMember");
		
		System.out.println("loginMember : " + loginMember);
		
		String tel = tel1 + "-" + tel2 + "-" + tel3;
		
		upMember.setMemberPwd(pwd1);
		upMember.setMemberNick(nick);
		upMember.setMemberPhone(tel);
		
		System.out.println(interest);
		upMember.setMemberInterest(interest);
		
		System.out.println("upMember : " +upMember);
		// 회원 정보 수정 Service 호출
		int result = mypageService.updateInfo(upMember);
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
		
		return "mypage/board";
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
		
		List<Help> helpList = mypageService.selectQList(pInfo);
		                                                                   
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
