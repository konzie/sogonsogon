package com.kh.sogon.mypage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
import com.kh.sogon.mypage.model.service.MypageService;
import com.kh.sogon.mypage.model.vo.ReportMember;
import com.kh.sogon.room.model.vo.Room;
import com.kh.sogon.room.model.vo.RoomMember;

@SessionAttributes({"loginMember"})
@Controller
@RequestMapping("/mypage/*")
public class MypageController {

	@Autowired // bcrypt 암호화 객체 의존성 주입(DI)
	private BCryptPasswordEncoder bcPwd;
	

	@Autowired
	private MypageService mypageService;
	
	@RequestMapping("mypage")
	public String mypage(Model model) {	
	
		return "mypage/mypagemain";
	}
	
	@RequestMapping("adminpage")
	public String adminpage(Model model) {
		
		PageInfo pInfo = new PageInfo();
		
		pInfo.setCurrentPage(1);
		pInfo.setLimit(3);
		
		List<Board> reportList = mypageService.selectDList(pInfo);
		
		for(int i=0;i<reportList.size();i++) {
			if(reportList.get(i).getQnaContent().length()>20){
				reportList.get(i).setQnaContent(reportList.get(i).getQnaContent().substring(0,20)+"...");
			}
		}
		
		model.addAttribute("reportList", reportList);
		
		List<Help> helpList = mypageService.selectQList(pInfo);

		for(int i=0;i<helpList.size();i++) {
			if(helpList.get(i).getHelpContent().length()>20){
				helpList.get(i).setHelpContent(helpList.get(i).getHelpContent().substring(0,20)+"...");
			}
		}
		
		model.addAttribute("helpList", helpList);
		
		List<Board> noticeList = mypageService.selectNList(pInfo);
		for(int i=0;i<noticeList.size();i++) {
			if(noticeList.get(i).getQnaContent().length()>20){
				noticeList.get(i).setQnaContent(noticeList.get(i).getQnaContent().substring(0,20)+"...");
			}
		}
		
		model.addAttribute("noticeList", noticeList);
		return "mypage/adminmain";
	}
	
	@RequestMapping("myreply")
	public String myreply(@RequestParam(value="cp", required=false, defaultValue = "1") int cp, Model model) {
		
		Member loginMember = (Member)model.getAttribute("loginMember");
		
		PageInfo pInfo = mypageService.replyPage(cp, loginMember.getMemberNo());

		pInfo.setLimit(10);
		
		List<Reply> replyList = mypageService.selectRList(pInfo, loginMember.getMemberNo());
		                                                                   
		model.addAttribute("replyList", replyList);
		model.addAttribute("pInfo", pInfo);
		
		return "mypage/myreply";
		}
	
	@RequestMapping("myroom")
	public String myroom(@RequestParam(value="cp", required=false, defaultValue = "1") int cp, Model model) {
		
		Member loginMember = (Member)model.getAttribute("loginMember");

		List<RoomMember> roomMemberList = mypageService.selectRoomMemberList(loginMember.getMemberNo());
		
		System.out.println(roomMemberList);
		
		PageInfo pInfo = null;
		List<Room> roomList = null;
		
		if(roomMemberList.size()>0) {
			pInfo = mypageService.roomPage(cp, roomMemberList);
			pInfo.setLimit(6);
			roomList = mypageService.selectRoomList(pInfo, roomMemberList);
		}

		model.addAttribute("roomList", roomList);
		model.addAttribute("pInfo", pInfo);
		
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
	public String myInfo2(String memberPwd,String memberNick, String memberInterest, String memberPhone,
					Member upMember, Model model, RedirectAttributes rdAttr) {
		

		
		Member loginMember = (Member)model.getAttribute("loginMember");

		String encPwd = bcPwd.encode(memberPwd);
		
		upMember.setMemberNo(loginMember.getMemberNo());
		upMember.setMemberPwd(encPwd);
		upMember.setMemberNick(memberNick);
		upMember.setMemberPhone(memberPhone);
		upMember.setMemberInterest(memberInterest);
		
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
		
		return "redirect:/";
	}
	
	// 신고사항 조회
	@RequestMapping("adminreport")
	public String adminreport(Model model, @RequestParam(value="cp", required=false, defaultValue="1") int cp) {
		
		PageInfo pInfo = mypageService.reportPage(cp);

		pInfo.setLimit(10);
		
		List<Board> reportList = mypageService.selectDList(pInfo);
		
		for(int i=0;i<reportList.size();i++) {
			if(reportList.get(i).getQnaContent().length()>20) {
				reportList.get(i).setQnaContent(reportList.get(i).getQnaContent().substring(0,20)+"...");
			}
		}                           
		
		model.addAttribute("reportList", reportList);
		model.addAttribute("pInfo", pInfo);

		return "mypage/adminreport";
		}
	
	// 고객센터 조회
	@RequestMapping("adminhelp")
	public String adminqna(@RequestParam(value="cp", required=false, defaultValue = "1") int cp, Model model) {
		
		PageInfo pInfo = mypageService.qnaPage(cp);
		
		pInfo.setLimit(10);
		
		List<Help> helpList = mypageService.selectQList(pInfo);
		
		for(int i=0;i<helpList.size();i++) {
			if(helpList.get(i).getHelpContent().length()>20) {
				helpList.get(i).setHelpContent(helpList.get(i).getHelpContent().substring(0,20)+"...");
			}
		}                                                                   
		model.addAttribute("helpList", helpList);
		model.addAttribute("pInfo", pInfo);

		return "mypage/adminhelp";
		}
	
	// 공지사항 조회
	@RequestMapping("adminnotice")
	public String adminnotice(@RequestParam(value="cp", required=false, defaultValue = "1") int cp, Model model) {
		
		PageInfo pInfo = mypageService.noticePage(cp);
		
		pInfo.setLimit(10);
		
		List<Board> qnaList = mypageService.selectNList(pInfo);
		
		for(int i=0;i<qnaList.size();i++) {
			if(qnaList.get(i).getQnaContent().length()>20) {
				qnaList.get(i).setQnaContent(qnaList.get(i).getQnaContent().substring(0,20)+"...");
			}
		}
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("pInfo", pInfo);
		
		return "mypage/adminnotice";
		}
	
	// 멤버 조회
	@RequestMapping("adminmember")
	public String adminmember(@RequestParam(value="cp", required=false, defaultValue = "1") int cp, Model model) {
		
		PageInfo pInfo = mypageService.memberPage(cp);
		
		pInfo.setLimit(10);
		
		List<Member> memberList = mypageService.selectMList(pInfo);
		
		model.addAttribute("memberList", memberList);
		model.addAttribute("pInfo", pInfo);
		
		return "mypage/adminmember";
		}
		
	@ResponseBody
	@RequestMapping("qnaCount")
	public int qnaCount() {
		
		int count = mypageService.qnaCount();
		
		return count;
	}
	
	@ResponseBody
	@RequestMapping("reportCount")
	public int reportCount() {
		
		int count = mypageService.reportCount();
		
		return count;
	}
	
	@ResponseBody
	@RequestMapping("roomCount")
	public int roomCount() {
		
		int count = mypageService.roomCount();
		
		return count;
	}
	
	@ResponseBody
	@RequestMapping("memberCount")
	public int memberCount() {
		
		int count = mypageService.memberCount();
		
		return count;
	}

	// 회원 탈퇴
	@RequestMapping("deleteInfo")
	public String deleteInfo(Model model, RedirectAttributes rdAttr, SessionStatus sessionstatus) {
		Member loginMember = (Member)model.getAttribute("loginMember");
		
		int result = mypageService.deleteInfo(loginMember.getMemberNo());
		
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
	
	@RequestMapping("reportView/{boardNo}")
	public String reportView(@PathVariable int boardNo, Model model) {
		
		
		Board report = mypageService.noticeView(boardNo);
		
		model.addAttribute("report", report);
		
		return "mypage/reportView";
	}
	
	@RequestMapping("helpView/{boardNo}")
	public String helpView(@PathVariable int boardNo, Model model) {
		
		Help help = mypageService.helpView(boardNo);

		model.addAttribute("help", help);
		
		return "mypage/helpView";
	}
	
	@RequestMapping("noticeWrite")
	public String noticeWrite() {
		return "mypage/noticeWrite";
	}
	
	@RequestMapping("noticeView/{boardNo}")
	public String noticeView(@PathVariable int boardNo, Model model) {
		
		Board notice = mypageService.noticeView(boardNo);
		
		model.addAttribute("notice",notice);
		
		return "mypage/noticeView";
	}
	
	@RequestMapping("updateNotice/{boardNo}")
	public String updateNotice(@PathVariable int boardNo, Model model) {
		
		Board notice = mypageService.noticeView(boardNo);

		model.addAttribute("notice", notice);
		
		return "mypage/updateNotice";
	} 
	
	@RequestMapping("updateNotice2/{boardNo}")
	public String updateNotice2(@PathVariable int boardNo, @RequestParam("category") String category, @RequestParam("title") String title, @RequestParam("content") String content, RedirectAttributes rdAttr, Model model) {
		
		Board notice = new Board();
		
		notice.setQnaCategory(category);
		notice.setQnaNo(boardNo);
		notice.setQnaTitle(title);
		notice.setQnaContent(content);
		
		int result = mypageService.updateNotice(notice);
		
		String status=null;
		String msg = null;
		
		if(result > 0) {
			status = "success";
			msg = "공지사항 수정 성공";
		}else {
			status = "error";
			msg = "공지사항 수정 실패";
		}
				
		rdAttr.addFlashAttribute("status",status);
		rdAttr.addFlashAttribute("msg",msg);

		return "redirect:/mypage/adminnotice";
	}	
	
	@RequestMapping("noticeInsert")
	public String noticeInsert(@RequestParam(value="title") String title, @RequestParam(value="content") String content, RedirectAttributes rdAttr, Model model) {

		Member loginMember = (Member)model.getAttribute("loginMember");
		
		Board board = new Board();
		
		board.setQnaTitle(title);
		board.setQnaContent(content);
		board.setWriter(loginMember.getMemberNo());
		
		int result = mypageService.noticeWrite(board);
		
		String status = null;
		String msg = null;
		String text = null;
		String url =null;
		
		if(result > 0) {
			status = "success";
			msg = "공지사항 작성 성공";
			url ="/mypage/noticeView/"+board.getQnaNo();
		}else{
			msg = "공지사항 작성 실패";
			url = "/mypage/noticeWrite";
		}
				
		rdAttr.addFlashAttribute("status",status);
		rdAttr.addFlashAttribute("msg",msg);
		rdAttr.addFlashAttribute("text",text);
		
		return "redirect:"+url;
	}
		
	@RequestMapping("deleteNotice/{boardNo}")
	public String deleteNotice(@PathVariable int boardNo, RedirectAttributes rdAttr) {
		
		int result = mypageService.deleteNotice(boardNo);
		
		String status = null;
		String msg = null;
		String url =null;
		
		if(result > 0) {
			status = "success";
			msg = "게시글 삭제 성공";
			url ="mypage/adminnotice";
		}else {
			status = "error";
			msg = "게시글 삭제 실패";
			url = "mypage/noticeView/boardNo";
		}
				
		rdAttr.addFlashAttribute("status",status);
		rdAttr.addFlashAttribute("msg",msg);
		
		return url;
	}	
		
	@RequestMapping("updateReport/{memberNick}/{boardNo}")
	public String updateReport(@PathVariable String memberNick, @PathVariable int boardNo, Model model, RedirectAttributes rdAttr){
		
		ReportMember member = new ReportMember();
		
		member.setBoardNo(boardNo);
		member.setMemberNick(memberNick);

		int memberNo = mypageService.findMember(member);
		
		member.setMemberNo(memberNo);

		int result= mypageService.updateReport(member);

		String status = null;
		String msg = null;
		
		if(result>0) {
			int result2 = deleteReport(boardNo);
			
			if(result2>0) {
				status = "success";
				msg = "신고 처리 완료";
				PageInfo pInfo = mypageService.reportPage(1);
				
				List<Board> reportList = mypageService.selectDList(pInfo);
				
				for(int i=0;i<reportList.size();i++) {
					if(reportList.get(i).getQnaContent().length()>20) {
						reportList.get(i).setQnaContent(reportList.get(i).getQnaContent().substring(0,20)+"...");
					}
				}                           
				
				model.addAttribute("reportList", reportList);
				model.addAttribute("pInfo", pInfo);
				
			}
		}else {
			status = "error";
			msg = "신고 처리 실패";
		}
		
		rdAttr.addFlashAttribute("status",status);
		rdAttr.addFlashAttribute("msg",msg);
		
		return "redirect:/mypage/adminreport";
	}
	
	private int deleteReport(int boardNo) {
		int result = mypageService.deleteNotice(boardNo);
		
		return result;
		
	}

	@RequestMapping("restoreReport/{writerNick}/{boardNo}")
	public String restoreReport(@PathVariable int boardNo, @PathVariable String writerNick, Model model, RedirectAttributes rdAttr){
		
		int result = mypageService.restoreReport(boardNo);
		
		ReportMember member = new ReportMember();
		
		member.setMemberNick(writerNick);
		int result2=0;
		if(result > 0) {
			int memberNo = mypageService.findMember(member);
			result2 = mypageService.restoreMember(memberNo);
		}
		
		String status = null;
		String msg = null;
		String url =null;
		
		if(result2 > 0) {
			status = "success";
			msg = "게시글 복원 성공";
			url = "mypage/adminreport";
					
			PageInfo pInfo = mypageService.reportPage(1);
			
			List<Board> reportList = mypageService.selectDList(pInfo);
			
			for(int i=0;i<reportList.size();i++) {
				if(reportList.get(i).getQnaContent().length()>20) {
					reportList.get(i).setQnaContent(reportList.get(i).getQnaContent().substring(0,20)+"...");
				}
			}                           
			
			model.addAttribute("reportList", reportList);
			model.addAttribute("pInfo", pInfo);
			
		}else {
			status = "error";
			msg = "게시글 복원 실패";
			url = "mypage/noticeView/"+boardNo;
		}
		
		return url;
	}
	
	@RequestMapping("answerhelp/{boardNo}")
	public String answerhelp() {
		return "";
	}
}
