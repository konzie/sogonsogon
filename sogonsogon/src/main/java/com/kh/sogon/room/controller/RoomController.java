package com.kh.sogon.room.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.sogon.room.model.service.RoomService;
import com.kh.sogon.room.model.vo.Room;

@SessionAttributes({"loginMember"})
@Controller
@RequestMapping("/room/*")
public class RoomController {
	
		@Autowired
		private RoomService roomService;
	
		@RequestMapping("roomList")
		public String roomView() {
			return "room/roomList";
		}
	   
		@RequestMapping("roomDetail/{roomNo}")
		public String roomDetailView(@PathVariable int roomNo, Model model, RedirectAttributes rdAttr, HttpServletRequest request) {
			
			Room roomDetail = roomService.roomDetailInfo(roomNo);
			System.out.println(roomDetail);
			
			String returnPath = null;
			if(roomDetail != null) {
				model.addAttribute("roomDetail", roomDetail);
				returnPath = "room/roomDetail";
			} else {
		        rdAttr.addFlashAttribute("status", "error");
		        rdAttr.addFlashAttribute("msg", "삭제되었거나 없는 방입니다.");
				returnPath = "redirect:/room/roomList";
			}
			
			return returnPath;
		}
}
