package com.kh.sogon.room.controller;

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

import com.kh.sogon.board.model.vo.PageInfo;
import com.kh.sogon.member.model.vo.Member;
import com.kh.sogon.room.model.service.RoomService;
import com.kh.sogon.room.model.vo.Room;

@SessionAttributes({"loginMember"})
@Controller
@RequestMapping("/room/*")
public class RoomController {
	
		@Autowired
		private RoomService roomService;
		
		@Autowired
		private PageInfo pInfo;
	
		@RequestMapping("roomList")
		public String roomView(@RequestParam(value="cp" , required=false, defaultValue ="1" )  int cp,
												Model model) {
			PageInfo pInfo = roomService.pagination(cp);
			 System.out.println(pInfo);
			
			 List<Room> roomList = roomService.selectList(pInfo);
			
				/*
				 * for(Room r : roomList) { System.out.println(r); }
				 */
			 
			 model.addAttribute("roomList", roomList);
			 model.addAttribute("pInfo", pInfo);
			 
			return "room/roomList";
		}
		
		@RequestMapping("insertRoom")
		public String insertRoom() {
			return "room/insertRoom";
		}
		
		@RequestMapping("enterRoom")
		public String enterRoom(Room room,RedirectAttributes rdAttr) {
			
			int result = roomService.enterRoom(room);

			String path = null;
			if(result>0) {
				System.out.println("비밀번호일치");
				path = "room/roomDetail";
			}else {
				System.out.println("비밀번호 불일치");
				 rdAttr.addFlashAttribute("status", "error");
			     rdAttr.addFlashAttribute("msg", "패스워드가 일치하지 않습니다.");
				path = "redirect:/room/roomList";
			}
			
			return path;
		}

	   
		@RequestMapping("roomDetail/{roomNo}")
		public String roomDetailView(@PathVariable int roomNo, @RequestParam(value = "inputPwd", required = false, defaultValue = "-1") String inputPwd, Model model, RedirectAttributes rdAttr, HttpServletRequest request) {
			
			Member loginMember = (Member)model.getAttribute("loginMember");
			
			if(loginMember != null)
				loginMember.setMemberPwd(inputPwd);
			
			Room roomDetail = roomService.roomDetailInfo(roomNo, loginMember);
			
			String returnPath = null;
			if(roomDetail != null) {
				model.addAttribute("roomDetail", roomDetail);
				returnPath = "room/roomDetail";
			} else {
		        rdAttr.addFlashAttribute("status", "error");
		        rdAttr.addFlashAttribute("msg", "삭제되었거나 없는 방 또는 권한이 없습니다");
				returnPath = "redirect:/room/roomList";
			}
			
			return returnPath;
		}
}
