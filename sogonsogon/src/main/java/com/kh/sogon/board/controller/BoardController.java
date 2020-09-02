package com.kh.sogon.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@SessionAttributes({"loginMember"})
@Controller
@RequestMapping("/board/*")
public class BoardController {
	   @RequestMapping("freeBoard")
	   public String freeBoardView() {
		   return "board/freeBoard";
	   }
	   
	   @RequestMapping("boardList")
	   public String boardListView() {
		   return "board/boardList";
	   }
	   
}
