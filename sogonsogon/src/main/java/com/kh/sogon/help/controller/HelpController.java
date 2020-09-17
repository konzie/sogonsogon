package com.kh.sogon.help.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.sogon.help.model.service.HelpService;
import com.kh.sogon.help.model.vo.Help;
import com.kh.sogon.help.model.vo.HelpPageInfo;
import com.kh.sogon.member.model.vo.Member;

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
		   
		   Member loginMember = (Member)model.getAttribute("loginMember");
		   
		   String url = null;
		   Help help = helpService.selectView(boardNo);
		
		   System.out.println(help);
		   
		   if(loginMember == null) {
			   
			   if(help.getLockStatus().equals("Y") ){
				   //model.addAttribute("msg","비공개된 게시글 입니다.");		  
	 
				   return "help/helpView";
			   }
			   
			   
		   }else { // 로그인 상태일때 
		   
			   if(help.getLockStatus().equals("Y") ){
				   //model.addAttribute("msg","비공개된 게시글 입니다.");		  
	 
				   if(help.getHelpWriter().equals(loginMember.getMemberNick())) {
					   
					   model.addAttribute("help", help);
					   
					   
					   return "help/helpView";
					   
				   }
				   return "help/helpView";
			   }
			   
		   
		   

		   
		   }
		  
		   model.addAttribute("help", help);
		   

		   return "help/helpView";	
		   
	   
	   }
	   
	  // 게시글 등록 화면 이동
	  @RequestMapping(value="insertAction", method=RequestMethod.POST)
	  public String insertAction(Help help, Model model,RedirectAttributes rdAttr,
               @RequestParam(value="images", required=false) List<MultipartFile> images,
              HttpServletRequest request) {
		  
		 Member loginMember = (Member)model.getAttribute("loginMember");
	     
		 help.setHelpWriter(loginMember.getMemberNo()+"");
		 
		 
		 int result = helpService.insertHelp(help);
		 
		 String url = null;
         if(result > 0) {
            rdAttr.addFlashAttribute("status", "success");
             rdAttr.addFlashAttribute("msg", "게시글 작성 완료");
             url="no="+help.getHelpNo()+"?cp=1";
         }else {
            rdAttr.addFlashAttribute("status", "error");
             rdAttr.addFlashAttribute("msg", "게시글 작성 실패");
             url = "helpWrite";
         }
		 
		 return "redirect:" + url;
	  }
	  
	  //게시글 삭제
	  @RequestMapping("no={helpNo}/delete")
      public String deleteHelp(@PathVariable int helpNo, RedirectAttributes rdAttr, HttpServletRequest request) {
         
         int result = helpService.deleteBoard(helpNo);
         
         String url = null;
         String msg = null;
         String status = null;
         
         if(result > 0) {

            status = "success";
            msg = "문의글 삭제 완료";
             url = "/help/list/1";
         } else {

            status = "error";
            msg = "게시글 삭제 실패";
            url = request.getHeader("referer");
         }
         rdAttr.addFlashAttribute("status", status);
          rdAttr.addFlashAttribute("msg", msg);
          
         return "redirect:" + url;
      }
	  
	  
	  //문의글 수정 페이지로 가기
	  @RequestMapping("no={helpNo}/update")
	  //ModelAndView : View에서 보여줄 데이터와 View 페이지 명을 묶어서 보낼 때
	  public ModelAndView updateView(@PathVariable int helpNo, ModelAndView mv) {
		  
		  Help help = helpService.selectView(helpNo);
		  
		  mv.addObject("help", help);
		  mv.setViewName("help/helpUpdate");
		  
		  return mv;
	  }
	  
	  
	  
	  
	  
}
