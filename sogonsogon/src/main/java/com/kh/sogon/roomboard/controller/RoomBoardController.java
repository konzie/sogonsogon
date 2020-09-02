package com.kh.sogon.roomboard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.sogon.roomboard.model.service.RoomBoardService;
import com.kh.sogon.roomboard.model.vo.RoomBoard;

@Controller
@RequestMapping("/roomBoard/*")
public class RoomBoardController {

	@Autowired
	private RoomBoardService roomBoardService;
	
	@ResponseBody
	@RequestMapping("boardList/{roomNo}")
	public String selectList(@PathVariable int roomNo) {
		List<RoomBoard> rbList = roomBoardService.roomBoardSelectList(roomNo);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		return gson.toJson(rbList);
	}

	
}
