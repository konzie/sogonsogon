package com.kh.sogon.room.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@SessionAttributes({"loginMember"})
@Controller
@RequestMapping("/room/*")
public class RoomController {
	   @RequestMapping("roomList")
	   public String roomView() {
		   return "room/roomList";
	   }
	   
	   @RequestMapping("roomDetail")
	   public String roomDetailView() {
		   return "room/roomDetail";
	   }
}
