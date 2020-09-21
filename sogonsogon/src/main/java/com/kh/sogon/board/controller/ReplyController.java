package com.kh.sogon.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.sogon.board.model.service.ReplyService;
import com.kh.sogon.board.model.vo.Reply;
import com.kh.sogon.member.model.vo.Member;
import com.kh.sogon.roomboard.model.vo.RoomBoardReply;

@SessionAttributes({"loginMember"})
@Controller
@RequestMapping("/reply/*")
public class ReplyController {

	@Autowired
	private ReplyService replyService;
	
	//댓글 조회 
	@RequestMapping("selectList/{qnaNo}")
	@ResponseBody
	public String selectList(@PathVariable int qnaNo, Model model) {
		
		List<Reply> rList = replyService.selectList(qnaNo);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		return gson.toJson(rList);
	}
	
	
	// 댓글 삽입 
	@RequestMapping(value="insertReply/{qnaNo}", produces = "application/text; charset=utf-8;")
	@ResponseBody
	public String insertReply(@PathVariable int qnaNo, Reply reply, Model model) {
		
		reply.setReplyWriter( ((Member)(model.getAttribute("loginMember"))).getMemberNo() );
		reply.setParentBoardNo(qnaNo);
		
		int result = replyService.insertReply(reply);
		
		String str = "댓글 삽입";
		
		if(result > 0 ) str += "성공 ";
		else            str += "실패";
		return str;
	}

	// 댓글 수정
	@ResponseBody
	@RequestMapping(value="updateReply/{boardNo}",
    				produces = "application/text; charset=utf-8;")
	public String updateReply(@PathVariable int qnaNo, Reply reply) {
		// reply 커맨드 객체를 이용하여 전달받은 이름, 댓글내용을 한 객체에 저장
		
		reply.setParentBoardNo(qnaNo);
		
		int result = replyService.updateReply(reply);
		
		String str = "댓글 수정 ";
		
		if(result > 0) str += "성공";
		else           str += "실패";
		
		return str;
	}
	
	// 댓글 삭제
	@ResponseBody
	@RequestMapping(value="deleteReply/{replyNo}",
					produces = "application/text; charset=utf-8;")
	public String deleteReply(@PathVariable int replyNo) {
		
		int result = replyService.deleteReply(replyNo);
		
		String str = "댓글  삭제 ";
		
		if(result > 0) str += "성공";
		else           str += "실패";
		
		return str;
	}

}
