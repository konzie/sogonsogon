package com.kh.sogon.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.sogon.board.model.service.BoardService;

@SessionAttributes({"loginMember"})
@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	
	@Autowired
	private BoardService BoardService;
	
	   @RequestMapping("boardList")
	   public String boardListView() {
		   return "board/boardList";
	   }
	  
	   
	   @RequestMapping("boardWrite")
	   public String boardWriteForm() {
		   return "board/boardWrite";
	   }
		
		
		
}
