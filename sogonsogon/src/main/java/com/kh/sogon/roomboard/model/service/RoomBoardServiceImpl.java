package com.kh.sogon.roomboard.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sogon.roomboard.model.vo.RoomBoardPageInfo;
import com.kh.sogon.roomboard.model.dao.RoomBoardDAO;
import com.kh.sogon.roomboard.model.vo.RoomBoard;

@Service
public class RoomBoardServiceImpl implements RoomBoardService {
	
	@Autowired
	private RoomBoardDAO roomBoardDAO;
	
	@Autowired // 의존성 주입(DI)
	private RoomBoardPageInfo pInfo;

	
	// 방안의 게시판 Select Service 구현
	@Override
	public List<RoomBoard> roomBoardSelectList(RoomBoardPageInfo pInfo) {
		return roomBoardDAO.roomBoardSelectList(pInfo);
	}
	
	// 페이징 처리를 위한 Service 구현
	@Override
	public RoomBoardPageInfo pagination(int roomNo, int cp) {
		// 1) 전체 게시글 수 조회
		int listCount = roomBoardDAO.getListCount(roomNo);
		
		// 2) setPageInfo 호출
		pInfo.setPageInfo(cp, listCount, roomNo);
		
		return pInfo;
	}
}
