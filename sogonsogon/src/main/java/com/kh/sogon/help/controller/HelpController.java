package com.kh.sogon.help.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.sogon.help.model.service.HelpService;
import com.kh.sogon.help.model.vo.Help;
import com.kh.sogon.help.model.vo.HelpPageInfo;

@SessionAttributes({"loginMember"})
@Controller
@RequestMapping("/help/*")
public class HelpController {
	
	@Autowired
	private HelpService helpService;
	   
	   @RequestMapping("helpList")
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
	   
	   @RequestMapping("helpwrite")
	   public String helpWriteForm() {
		   return "help/helpWrite";
	   }
	   
}
