package com.kh.sogon.roomboard.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.kh.sogon.roomboard.model.vo.RoomBoardPageInfo;
import com.kh.sogon.roomboard.model.service.RoomBoardService;
import com.kh.sogon.roomboard.model.vo.RoomBoard;

@Controller
@RequestMapping("/roomBoard/*")
public class RoomBoardController {

	@Autowired
	private RoomBoardService roomBoardService;
	
	@ResponseBody
	@RequestMapping("boardList/{roomNo}")
	public String selectList(@PathVariable int roomNo, @RequestParam(value="cp", required = false, defaultValue = "1") int cp) {

		
		RoomBoardPageInfo pInfo = roomBoardService.pagination(roomNo, cp);
		
		List<RoomBoard> rbList = roomBoardService.roomBoardSelectList(pInfo);		
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		

		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("rbList", rbList);
		map.put("pInfo", pInfo);
		
		return gson.toJson(map);
	}

	
}
