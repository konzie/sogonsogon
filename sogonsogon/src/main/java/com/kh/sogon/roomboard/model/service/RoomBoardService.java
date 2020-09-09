package com.kh.sogon.roomboard.model.service;

import java.util.List;

import com.kh.sogon.board.model.vo.PageInfo;
import com.kh.sogon.roomboard.model.vo.RoomBoard;
import com.kh.sogon.roomboard.model.vo.RoomBoardPageInfo;

public interface RoomBoardService {

	/** 방안의 게시판 Select Service
	 * @param roomNo
	 * @return list
	 */
	List<RoomBoard> roomBoardSelectList(RoomBoardPageInfo pInfo);

	/** 페이징 구현을 위한 Service
	 * @param type
	 * @param cp
	 * @return
	 */
	RoomBoardPageInfo pagination(int roomNo, int cp);

}
