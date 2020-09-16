package com.kh.sogon.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.sogon.board.model.service.ReplyService;
import com.kh.sogon.board.model.vo.Reply;

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
		Gson gson = new GsonBuilder().create();
		return gson.toJson(rList);
	}
	
	
	// 댓글 삽입 
	@RequestMapping(value="insertReply/{qnaNo}", produces = "application/text; charset=utf-8;")
	@ResponseBody
	public String insertReply(@PathVariable int qnaNo, Reply reply) {
		
		reply.setParentBoardNo(qnaNo);
		
		int result = replyService.insertReply(reply);
		
		String str = "댓글 삽입";
		
		if(result > 0 ) str += "성공 ";
		else            str += "실패";
		return str;
	}
	
	// 댓글 삽입 
	@RequestMapping(value="insertReply2/{qnaNo}", produces = "application/text; charset=utf-8;")
	@ResponseBody
	public String insertReply2(@PathVariable int qnaNo, Reply reply) {
		
		reply.setParentBoardNo(qnaNo);
		
		int result = replyService.insertReply2(reply);
		
		String str = "댓글 삽입";
		
		if(result > 0 ) str += "성공 ";
		else            str += "실패";
		return str;
	}
}
