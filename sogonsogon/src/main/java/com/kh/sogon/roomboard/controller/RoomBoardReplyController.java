package com.kh.sogon.roomboard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.sogon.roomboard.model.dao.RoomBoardReplyDAO;
import com.kh.sogon.roomboard.model.service.RoomBoardReplyService;
import com.kh.sogon.roomboard.model.vo.RoomBoardReply;

@Controller
@RequestMapping("/roomBoard/reply/*")
public class RoomBoardReplyController {

	@Autowired
	private RoomBoardReplyService roomBoardReplyService;
	
	@ResponseBody
	@RequestMapping("selectList/{boardNo}")
	public String selectList(@PathVariable int boardNo) {
		List<RoomBoardReplyDAO> list = roomBoardReplyService.selectList(boardNo);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		return gson.toJson(list);
	}
	
	// 댓글 등록
	@ResponseBody
	@RequestMapping(value="insertReply/{boardNo}",
    				produces = "application/text; charset=utf-8;")
	public String insertReply(@PathVariable int boardNo, RoomBoardReply reply) {
		// reply 커맨드 객체를 이용하여 전달받은 이름, 댓글내용을 한 객체에 저장
		
		reply.setParentBoardNo(boardNo);
		
		int result = roomBoardReplyService.insertReply(reply);
		
		String str = "댓글 삽입 ";
		
		if(result > 0) str += "성공";
		else           str += "실패";
		
		return str;
	}
	
	// 답글 삽입
	@ResponseBody
	@RequestMapping(value="insertReply2/{boardNo}",
    				produces = "application/text; charset=utf-8;")
	public String insertReply2(@PathVariable int boardNo, RoomBoardReply reply) {
		// reply 커맨드 객체를 이용하여 전달받은 이름, 댓글내용을 한 객체에 저장
		
		reply.setParentBoardNo(boardNo);
		
		int result = roomBoardReplyService.insertReply2(reply);
		
		String str = "댓글 삽입 ";
		
		if(result > 0) str += "성공";
		else           str += "실패";
		
		return str;
	}
	
	// 댓글 수정
	@ResponseBody
	@RequestMapping(value="updateReply/{boardNo}",
    				produces = "application/text; charset=utf-8;")
	public String updateReply(@PathVariable int boardNo, RoomBoardReply reply) {
		// reply 커맨드 객체를 이용하여 전달받은 이름, 댓글내용을 한 객체에 저장
		
		reply.setParentBoardNo(boardNo);
		
		int result = roomBoardReplyService.updateReply(reply);
		
		String str = "댓글 수정 ";
		
		if(result > 0) str += "성공";
		else           str += "실패";
		
		return str;
	}
}
