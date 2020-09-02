package com.kh.sogon.roomboard.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sogon.roomboard.model.dao.RoomBoardDAO;
import com.kh.sogon.roomboard.model.vo.RoomBoard;

@Service
public class RoomBoardServiceImpl implements RoomBoardService {
	
	@Autowired
	private RoomBoardDAO roomBoardDAO;

	// 방안의 게시판 Select Service 구현
	@Override
	public List<RoomBoard> roomBoardSelectList(int roomNo) {
		return roomBoardDAO.roomBoardSelectList(roomNo);
	}
}
