package com.kh.sogon.help.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.sogon.help.model.service.AnswerService;
import com.kh.sogon.help.model.vo.Answer;

@SessionAttributes({"loginMember"})
@Controller
@RequestMapping("/answer/*")
public class AnswerController {
	
	@Autowired
	private AnswerService answerService;
	   
	   
	   //글쓰기
	   @RequestMapping("helpwrite")
	   public String helpWriteForm() {
		   return "help/helpWrite";
	   }
	   
	   //답변 조회
	   @ResponseBody
	   @RequestMapping("selectAnswer/{boardNo}")
	   public String answerView(@PathVariable int helpNo) {
		   
		   Answer answer = answerService.selectAnswer(helpNo);
		   
		   Gson gson = new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create();
		   

		   return gson.toJson(answer);	
		   
	   
	   }
	   	
	  
}
