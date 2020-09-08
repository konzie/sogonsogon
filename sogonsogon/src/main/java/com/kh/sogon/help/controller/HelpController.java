package com.kh.sogon.help.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@SessionAttributes({"loginMember"})
@Controller
@RequestMapping("/board/*")
public class HelpController {
	   
	   @RequestMapping("helpList")
	   public String helpListView() {
		   return "board/helpList";
	   }
	   
	   @RequestMapping("helpwrite")
	   public String helpWriteForm() {
		   return "board/helpWrite";
	   }
	   
}
