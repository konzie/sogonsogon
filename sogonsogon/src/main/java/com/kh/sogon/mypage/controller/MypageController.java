package com.kh.sogon.mypage.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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

import com.google.gson.Gson;
import com.kh.sogon.board.model.vo.Board;
import com.kh.sogon.help.model.vo.Help;
import com.kh.sogon.member.model.vo.Member;
import com.kh.sogon.board.model.vo.PageInfo;
import com.kh.sogon.board.model.vo.Reply;
import com.kh.sogon.mypage.model.service.MypageService;
import com.kh.sogon.mypage.model.vo.HelpAnswer;
import com.kh.sogon.mypage.model.vo.ReportMember;
import com.kh.sogon.room.model.vo.Room;
import com.kh.sogon.room.model.vo.RoomMember;
import com.kh.sogon.roomboard.model.vo.RoomBoard;
import com.kh.sogon.roomboard.model.vo.RoomBoardReply;

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
		Member loginMember = (Member)model.getAttribute("loginMember");
		
		List<ReportMember> reportList = mypageService.findMember(loginMember.getMemberNo());
		
		if(reportList.size()>0) {
			if(reportList.get(0).getRoomNo()>0) {
				RoomBoard board = new RoomBoard();
				board.setRoomBoardNo(reportList.get(0).getRoomBoardNo());
				board.setRoomNo(reportList.get(0).getRoomNo());
				board = mypageService.selectBoard(board);
				
					model.addAttribute("board", board);		
			}else {
				Board reportView = mypageService.noticeView(reportList.get(0).getBoardNo());
				model.addAttribute("reportView", reportView);
			}

			model.addAttribute("report", reportList.get(0));
		}
		model.addAttribute("loginMember", loginMember);
		
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
		
		
		PageInfo roomPInfo = new PageInfo();

		roomPInfo.setCurrentPage(1);
		roomPInfo.setLimit(3);
		
		List<RoomBoard> roomReportList = mypageService.selectRoomReportList(roomPInfo);
		
		for(int i=0;i<roomReportList.size();i++) {
			if(roomReportList.get(i).getRoomBoardContent().length()>20) {
				roomReportList.get(i).setRoomBoardContent(roomReportList.get(i).getRoomBoardContent().substring(0,20)+"...");
			}
		}
		
		model.addAttribute("roomReportList", roomReportList);

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
	
	@RequestMapping("myRoomReply")
	public String myRoomReply(@RequestParam(value="cp", required=false, defaultValue = "1") int cp, Model model) {
		
		Member loginMember = (Member)model.getAttribute("loginMember");
		
		PageInfo pInfo = mypageService.myRoomReplyPage(cp, loginMember.getMemberNo());

		pInfo.setLimit(10);
		
		List<RoomBoardReply> myRoomReply = mypageService.selectRoomReplyList(pInfo, loginMember.getMemberNo());

		int[] boardNoList = new int[myRoomReply.size()];
		
		for(int i=0;i<myRoomReply.size();i++) {
			boardNoList[i] = myRoomReply.get(i).getParentBoardNo(); 
			myRoomReply.get(i).setRoomNo(mypageService.findRoomNo(boardNoList[i]));
		}

		model.addAttribute("myRoomReply", myRoomReply);
		model.addAttribute("pInfo", pInfo);
		
		return "mypage/myRoomReply";
		}
		
	@RequestMapping("myroom")
	public String myroom(@RequestParam(value="cp", required=false, defaultValue = "1") int cp, Model model) {
		
		Member loginMember = (Member)model.getAttribute("loginMember");

		List<RoomMember> roomMemberList = mypageService.selectRoomMemberList(loginMember.getMemberNo());
		
		PageInfo pInfo = null;
		List<Room> roomList = null;
		
		if(roomMemberList.size()>0) {
			pInfo = mypageService.roomPage(cp, roomMemberList);
			pInfo.setLimit(6);
			roomList = mypageService.selectRoomList(pInfo, roomMemberList);
			model.addAttribute("pInfo", pInfo);
		}

		model.addAttribute("loginMember", loginMember);
		model.addAttribute("roomList", roomList);
		
		return "mypage/myroom";
		
	}
	
	@RequestMapping("myboard")
	public String mypage(Member member, Model model, @RequestParam(value="cp", required=false, defaultValue = "1") int cp) {
		
		Member loginMember = (Member)model.getAttribute("loginMember");
		
		PageInfo pInfo = mypageService.boardPage(cp, loginMember.getMemberNo());
		pInfo.setLimit(10);
		List<Board> boardList = mypageService.selectBList(pInfo, loginMember.getMemberNo());
		                                                                   
		model.addAttribute("boardList", boardList);
		model.addAttribute("pInfo", pInfo);	
		
		return "mypage/myboard";
	}
		
	@RequestMapping("myRoomboard")
	public String myRoomboard(Member member, Model model, @RequestParam(value="cp", required=false, defaultValue = "1") int cp) {
		
		Member loginMember = (Member)model.getAttribute("loginMember");
		
		PageInfo roomPInfo = mypageService.roomBoardPage(cp, loginMember.getMemberNo());
		roomPInfo.setLimit(10);
		List<RoomBoard> roomBoard = mypageService.selectRoomBoardList(roomPInfo, loginMember.getMemberNo());
		                           
		model.addAttribute("roomBoard", roomBoard);
		model.addAttribute("roomPInfo", roomPInfo);	
		
		return "mypage/myRoomboard";
	}
	
	@RequestMapping("boardView/{boardNo}")
	public String boardView(@PathVariable int boardNo, Model model) {
		
		Board board = mypageService.boardView(boardNo);
		
		model.addAttribute("board", board);

		return "mypage/boardView";
	}
	
	@RequestMapping("roomBoardView/{boardNo}/{roomNo}")
	public String roomBoardView(@PathVariable int boardNo, @PathVariable int roomNo, Model model) {
		
		RoomBoard roomBoard = new RoomBoard();
		
		roomBoard.setRoomBoardNo(boardNo);
		roomBoard.setRoomNo(roomNo);
		
		roomBoard = mypageService.roomBoard(roomBoard);

		model.addAttribute("roomBoard", roomBoard);

		return "mypage/roomBoardView";
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
	@RequestMapping("reportBoard")
	public String reportBoard(Model model, @RequestParam(value="cp", required=false, defaultValue="1") int cp) {
		
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
		return "mypage/reportBoard";
		}	
	
	@RequestMapping("reportRoom")
	public String reportRoom(Model model, @RequestParam(value="cp", required=false, defaultValue="1") int cp) {
		
		PageInfo roomPInfo = mypageService.roomReportPage(cp);

		roomPInfo.setLimit(10);
		
		List<RoomBoard> roomReportList = mypageService.selectRoomReportList(roomPInfo);
		
		for(int i=0;i<roomReportList.size();i++) {
			if(roomReportList.get(i).getRoomBoardContent().length()>20) {
				roomReportList.get(i).setRoomBoardContent(roomReportList.get(i).getRoomBoardContent().substring(0,20)+"...");
			}
		}
		
		model.addAttribute("roomReportList", roomReportList);
		model.addAttribute("roomPInfo", roomPInfo);

		return "mypage/reportRoom";
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
		int count2 = mypageService.reportCount2();
		return count+count2;
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
		
		Member loginMember = (Member)model.getAttribute("loginMember");
		
		Board report = mypageService.noticeView(boardNo);
		
		model.addAttribute("report", report);
		model.addAttribute("loginMember", loginMember);
		return "mypage/reportView";
	}
	
	@RequestMapping("helpView/{boardNo}")
	public String helpView(@PathVariable int boardNo, Model model) {
		
		Help help = mypageService.helpView(boardNo);
		
		model.addAttribute("help", help);

		HelpAnswer answer = mypageService.selectAnswer(boardNo);
		
		if(answer!=null) {
			model.addAttribute("answer", answer);			
		}
		
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
		
		Member member = (Member)model.getAttribute("loginMember");

		Board notice = mypageService.noticeView(boardNo);

		model.addAttribute("notice", notice);
		model.addAttribute("member", member);
		return "mypage/updateNotice";
	} 
	
	@RequestMapping("updateNotice2/{boardNo}")
	public String updateNotice2(@PathVariable int boardNo, @RequestParam("category") String category, @RequestParam("title") String title, @RequestParam("content") String content, RedirectAttributes rdAttr, Model model) {
		
		Member member = (Member)model.getAttribute("loginMember");
		Board notice = new Board();
		
		notice.setQnaCategory(category);
		notice.setQnaNo(boardNo);
		notice.setQnaTitle(title);
		notice.setQnaContent(content);

		int result = mypageService.updateNotice(notice);
		
		String status=null;
		String msg = null;
		String url =null;
		
		if(result > 0) {
			status = "success";
			msg = "게시글 수정 성공";
		}else {
			status = "error";
			msg = "게시글 수정 실패";
		}
				
		rdAttr.addFlashAttribute("status",status);
		rdAttr.addFlashAttribute("msg",msg);
		
		if(member.getMemberGrade().equals("G")) {
			url="redirect:/mypage/myboard";
		}else{
			url = "redirect:/mypage/adminnotice";
		}
		return url;
	}	
	
	@RequestMapping("noticeInsert")
	public String noticeInsert(@RequestParam(value="title") String title, @RequestParam(value="content") String content, @RequestParam(value="category") String category, RedirectAttributes rdAttr, Model model) {

		Member loginMember = (Member)model.getAttribute("loginMember");
		
		Board board = new Board();
		
		board.setQnaTitle(title);
		board.setQnaContent(content);
		board.setQnaCategory(category);
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
	public String deleteNotice(@PathVariable int boardNo, RedirectAttributes rdAttr, Model model) {
		Member member = (Member)model.getAttribute("loginMember");
		
		int result = mypageService.deleteNotice(boardNo);
		
		String status = null;
		String msg = null;
		String url =null;
		
		if(result > 0) {
			status = "success";
			msg = "게시글 삭제 성공";
			if(member.getMemberGrade().equals("G")) {
				url="redirect:/mypage/myboard";
			}else {
				url = "redirect:/mypage/adminnotice";
			}
		}else {
			status = "error";
			msg = "게시글 삭제 실패";
			if(member.getMemberGrade().equals("G")) {
				url="redirect:/mypage/myboard";
			}else{
				url = "redirect:/mypage/adminnotice";
			}
		}
				
		rdAttr.addFlashAttribute("status",status);
		rdAttr.addFlashAttribute("msg",msg);
		
		return url;
	}	

	@RequestMapping("updateReport/{memberNo}/{boardNo}/{roomNo}")
	public String updateReport(@PathVariable int memberNo, @PathVariable int boardNo, @PathVariable int roomNo, Model model, RedirectAttributes rdAttr, SessionStatus sessionstatus){

		List<ReportMember> memberList = mypageService.findMember(memberNo);

		ReportMember member = new ReportMember();
		if(memberList.size()>0){
			member = memberList.get(0);
			member.setRoomNo(roomNo);
			if(roomNo>0) { // roomNo 있을 때
				member.setRoomBoardNo(boardNo);
				member.setBoardNo(0);
			}else { // roomNo 없을 때
				member.setRoomBoardNo(0);
				member.setBoardNo(boardNo);
			}
		}else {
			member.setMemberNo(memberNo);
			member.setRoomNo(roomNo);

			if(roomNo>0) { // roomNo 있을 때
				member.setRoomBoardNo(boardNo);
				member.setBoardNo(0);
			}else { // roomNo 없을 때
				member.setRoomBoardNo(0);
				member.setBoardNo(boardNo);
			}
			
			int result = mypageService.insertMember(member);

			if(result>0) {
				memberList = mypageService.findMember(memberNo);
			}
		}
		
		member.setMemberNo(memberNo);
		int result= mypageService.updateReport(member);			

		String status = null;
		String msg = null;
		
		if(result>0) {
			int result2=0;
			if(roomNo>0) {
				RoomBoard board = new RoomBoard();
				board.setRoomBoardNo(boardNo);
				board.setRoomNo(roomNo);
				result2=mypageService.deleteRoomReport(board);
			}else {
				result2=mypageService.deleteNotice(boardNo);				
			}

			if(result2>0) {
				status = "success";
				msg = "신고 처리 완료";
				
				if(member.getReportCount()>=3) {
					mypageService.reportInfo(memberNo);
				}
				
				PageInfo pInfo = mypageService.reportPage(1);

				pInfo.setLimit(5);
				
				List<Board> reportList = mypageService.selectDList(pInfo);
				
				for(int i=0;i<reportList.size();i++) {
					if(reportList.get(i).getQnaContent().length()>20) {
						reportList.get(i).setQnaContent(reportList.get(i).getQnaContent().substring(0,20)+"...");
					}
				}      
				
				model.addAttribute("reportList", reportList);
				model.addAttribute("pInfo", pInfo);	
			
				PageInfo roomPInfo = mypageService.roomReportPage(1);

				roomPInfo.setLimit(5);
				
				List<RoomBoard> roomReportList = mypageService.selectRoomReportList(roomPInfo);
				
				for(int i=0;i<roomReportList.size();i++) {
					if(roomReportList.get(i).getRoomBoardContent().length()>20) {
						roomReportList.get(i).setRoomBoardContent(roomReportList.get(i).getRoomBoardContent().substring(0,20)+"...");
					} 
				}
				
				model.addAttribute("roomReportList", roomReportList);
				model.addAttribute("roomPInfo", roomPInfo);

			}else {
				status = "error";
				msg = "신고 처리 실패";
			}
		}
		
		rdAttr.addFlashAttribute("status",status);
		rdAttr.addFlashAttribute("msg",msg);
		
		String url = null;
		if(roomNo>0) {
			url = "redirect:/mypage/reportRoom";
		}else {
			url = "redirect:/mypage/reportBoard";
		}
		return url;
	}
	
	@RequestMapping("restoreReport/{writerNo}/{boardNo}")
	public String restoreReport(@PathVariable int boardNo, @PathVariable int writerNo, Model model, RedirectAttributes rdAttr){
		
		int result = mypageService.restoreReport(boardNo);
		
		ReportMember member = new ReportMember();
		
		member.setMemberNo(writerNo);

		int result2=0;
		if(result > 0) {
			List<ReportMember> reportList = mypageService.findMember(writerNo);
			result2 = mypageService.restoreMember(reportList.get(0).getMemberNo());
		}
		
		String status = null;
		String msg = null;
		String url =null;
		
		if(result2 > 0) {
			status = "success";
			msg = "게시글 복원 성공";
			url = "mypage/reportBoard";
					
			PageInfo pInfo = mypageService.reportPage(1);
			
			pInfo.setLimit(5);
			
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
		
		rdAttr.addFlashAttribute("status", status);
		rdAttr.addFlashAttribute("msg", msg);
		
		return url;
	}
	
	@RequestMapping("restoreReportRoom/{memberNo}/{roomBoardNo}/{roomNo}")
	public String restorReportRoom(@PathVariable int memberNo, @PathVariable int roomBoardNo, @PathVariable int roomNo, Model model, RedirectAttributes rdAttr) {
		
		RoomBoard board = new RoomBoard();
		board.setRoomBoardNo(roomBoardNo);
		board.setRoomNo(roomNo);
		int result = mypageService.restorReportRoom(board);
		
		ReportMember member = new ReportMember();
		
		member.setMemberNo(memberNo);

		int result2=0;
		if(result > 0) {
			List<ReportMember> reportList = mypageService.findMember(memberNo);
			result2 = mypageService.restoreMember(reportList.get(0).getMemberNo());
		}
		
		String status = null;
		String msg = null;
		
		if(result2 > 0) {
			status = "success";
			msg = "게시글 복원 성공";
			
			PageInfo roomPInfo = mypageService.roomReportPage(1);

			roomPInfo.setLimit(5);
			
			List<RoomBoard> roomReportList = mypageService.selectRoomReportList(roomPInfo);
			
			for(int i=0;i<roomReportList.size();i++) {
				if(roomReportList.get(i).getRoomBoardContent().length()>20) {
					roomReportList.get(i).setRoomBoardContent(roomReportList.get(i).getRoomBoardContent().substring(0,20)+"...");
				} 
			
			model.addAttribute("roomReportList", roomReportList);
			model.addAttribute("roomPInfo", roomPInfo);
			}
			
		}else {
			status = "error";
			msg = "게시글 복원 실패";
		}
		
		
		rdAttr.addFlashAttribute("status", status);
		rdAttr.addFlashAttribute("msg", msg);
		
		return "redirect:/mypage/reportRoom";
	}
	
	@RequestMapping("answerView/{helpNo}")
	public String answerView(@PathVariable int helpNo, Model model, RedirectAttributes rdAttr){
		
		Help help = mypageService.helpView(helpNo);
		
		model.addAttribute("help", help);
		return "mypage/answerView";
	}
	
	@RequestMapping("insertAnswer/{helpNo}")
	public String insertAnswer(@PathVariable int helpNo, String answer, Model model, RedirectAttributes rdAttr){

		HelpAnswer helpAnswer = new HelpAnswer();
		
		helpAnswer.setParentHelpNo(helpNo);
		helpAnswer.setAnswerContent(answer);
		int result = mypageService.insertAnswer(helpAnswer);
		
		String status = null;
		String msg = null;
		
		if(result > 0) {
			status = "success";
			msg = "답변 달기 성공";
		}else {
			status = "error";
			msg = "답변 달기 실패";
		}
		
		rdAttr.addFlashAttribute("status",status);
		rdAttr.addFlashAttribute("msg",msg);
		
		return "redirect:/mypage/adminhelp";
	}
	
	// 메인에서 공지사항 조회
	@ResponseBody
	@RequestMapping("mainNoticeList")
	public String mainNoticeList() {
		List<Board> noticeList = mypageService.mainNoticeList();
		
		Gson gson = new Gson();
		return gson.toJson(noticeList);
	}
	
	@ResponseBody
	@RequestMapping("myReportBoard")
	public List<Board> myReportBoard(HttpServletRequest request) {
		String writer = request.getParameter("writer");
		
		return mypageService.myReportBoard(writer);
	}
	
	@RequestMapping("reportView2/{boardNo}/{roomNo}")
	public String reportView2(@PathVariable int boardNo, @PathVariable int roomNo, Model model) {
		
		RoomBoard board = new RoomBoard();
		
		board.setRoomBoardNo(boardNo);
		board.setRoomNo(roomNo);
		board = mypageService.roomBoard(board);
		model.addAttribute("board",board);
		
		return "mypage/reportView2";
	}
}
