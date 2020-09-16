package com.kh.sogon.room.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.sogon.board.model.vo.PageInfo;
import com.kh.sogon.member.model.vo.Member;
import com.kh.sogon.room.model.service.RoomService;
import com.kh.sogon.room.model.vo.Room;
import com.kh.sogon.room.model.vo.RoomMember;

@SessionAttributes({"loginMember"})
@Controller
@RequestMapping("/room/*")
public class RoomController {
	
		@Autowired
		private RoomService roomService;
		
		@Autowired
		private PageInfo pInfo;
		

		@RequestMapping("roomList/{type}")
		public String roomView(@PathVariable int type, @RequestParam(value="cp" , required=false, defaultValue ="1" )  int cp, Model model) {
			PageInfo pInfo = roomService.pagination(cp);
			
			 List<Room> roomList = roomService.selectList(pInfo);
			 //for(Room r : roomList) { System.out.println(r); }
			 //System.out.println(pInfo);
			 
			 model.addAttribute("roomList", roomList);
			 model.addAttribute("pInfo", pInfo);
			 model.addAttribute("roomPath", "roomList");
			 model.addAttribute("type", type);
			 		 
			return "room/roomList";
		}
		
		@RequestMapping("insertRoom")
		public String insertRoom() {
			return "room/insertRoom";
		}
		
		
		@RequestMapping("roomDetail/{roomNo}")
		public String roomDetailView(@PathVariable int roomNo, @RequestParam(value = "inputPwd", required = false, defaultValue = "-1") String inputPwd, Model model, RedirectAttributes rdAttr, HttpServletRequest request,Room room) {
			System.out.println(roomNo);
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

		@RequestMapping("createRoom")
		public String createRoom(Room room, RedirectAttributes rdAttr, Model model) {
			
			Member loginMember = (Member)model.getAttribute("loginMember");
			int memberNo = loginMember.getMemberNo();
			room.setMemberNo(memberNo);
			
			int result = roomService.createRoom(room);
			
			String path = null;
			if(result>0) {
				path = "/room/roomList?cp=1";
				 rdAttr.addFlashAttribute("msg", "방 만들기 완료!");
			}else {
				path = "/room/createRoom";
				 rdAttr.addFlashAttribute("msg", "방 만들기 실패!");
			}
			return  "redirect:"+ path;
		}
		
		// 모달 영역에 방 데이터 & 로그인한 멤버 가입한 방정보
		@ResponseBody
		@RequestMapping("roomMList/{roomNo}")
		public String roomMList(@PathVariable int roomNo, Model model) {
			Room room = roomService.roomMList(roomNo);
			
			 Member loginMember = (Member)model.getAttribute("loginMember");
			 int MemberNo = loginMember.getMemberNo();
			 List<RoomMember> roomMember = roomService.selectRoomMember(MemberNo);
			for(RoomMember no : roomMember) { System.out.println(no); }
	 	
			Map<String, Object> map = new HashMap<>();
			map.put("room", room);
			map.put("roomMember", roomMember);
			
			Gson gson = new Gson();
			return gson.toJson(map);
		}
		
		// 카테고리별 조회
		 @RequestMapping("select/{option}") 
		 public String selectOption(@RequestParam(value="cp" , required=false, defaultValue ="1" )  int cp, @PathVariable int option, Model model) { 
			 PageInfo pInfo = roomService.getListCount2(cp,option);
			 List<Room> roomList = roomService.selectOption(pInfo, option);

			 model.addAttribute("pInfo", pInfo);
			 model.addAttribute("roomList", roomList);
			 model.addAttribute("roomPath", "select");
			 model.addAttribute("type", option);
			 
		     return  "room/roomList"; 
		    		 
		 }
		 
		 // 검색어 조회
		 @RequestMapping("search/{search}")
		 public String searchList(@RequestParam(value="cp" , required=false, defaultValue ="1" )  int cp, @PathVariable String search, Model model) {
			 System.out.println("검색어 " + search);
			 
			 PageInfo pInfo = roomService.getListCount3(cp,search);
			 List<Room> roomList = roomService.searchList(pInfo,search);
			 //for(Room r : roomList) { System.out.println(r); }
			 
			 model.addAttribute("pInfo", pInfo);
			 model.addAttribute("roomList", roomList);
			 model.addAttribute("roomPath", "search");
			 model.addAttribute("type", search);
			 
			return  "room/roomList";  
		 }
		 
		 @ResponseBody
		 @RequestMapping("mainRoomList")
		 public String mainRoomList() {
			 List<Room> roomList = roomService.mainRoomList();

			 // for(Room r : roomList) { System.out.println(r); };
			Gson gson = new Gson();
			 gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			
			return gson.toJson(roomList);
		 }

}
