package com.kh.sogon.roomboard.model.service;

import java.util.List;

import com.kh.sogon.roomboard.model.vo.RoomBoard;

public interface RoomBoardService {

	/** 방안의 게시판 Select Service
	 * @param roomNo
	 * @return list
	 */
	List<RoomBoard> roomBoardSelectList(int roomNo);

}
