package com.kh.sogon.help.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.sogon.help.model.service.HelpService;
import com.kh.sogon.help.model.vo.Help;
import com.kh.sogon.help.model.vo.HelpPageInfo;

@SessionAttributes({"loginMember"})
@Controller
@RequestMapping("/help/*")
public class HelpController {
	
	@Autowired
	private HelpService helpService;
	   
		//게시글 목록
	   @RequestMapping("list/1")
	   public String helpList(@RequestParam(value="cp", required = false, defaultValue = "1") int cp, Model model) {
		   //cp -> 현재 페이지						
		   
		   HelpPageInfo hInfo = helpService.pagination(cp);
		   
		   List<Help> helpList = helpService.selectList(hInfo);
		   
		   for(Help b : helpList) {
			   System.out.println(b);
	      }
		   
		   //응답 페이지 전달
		   model.addAttribute("helpList", helpList);
		   model.addAttribute("hInfo", hInfo);
		   
		   return "help/helpList";
	   }
	   
	   //글쓰기
	   @RequestMapping("helpwrite")
	   public String helpWriteForm() {
		   return "help/helpWrite";
	   }
	   
	   //문의글 자세히보기
	   //help/no=1?cp=1
	   @RequestMapping("no={boardNo}")
	   public String helpView(@PathVariable int boardNo, Model model, RedirectAttributes rdAttr, HttpServletRequest request) {
		   
		   Help help = helpService.selectView(boardNo);
		   
		   System.out.println(help);
		   
		   model.addAttribute("help", help);
		   
		   
		   
		   return "help/helpView";		   
	   }
	   
}
