package com.kh.sogon.roomboard.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

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
	
	
	/** 게시글 삭제 Service
	 * @param boardNo
	 * @return result
	 */
	int deleteBoard(int boardNo);

	/** 게시글 상세 정보 조회 Service
	 * @param boardNo
	 * @return roomBoard
	 */
	RoomBoard selectBoard(int boardNo);

	/** 게시글 등록 Service
	 * @param board
	 * @param savePath 
	 * @param images 
	 * @return result
	 */
	int insertBoard(RoomBoard board, List<MultipartFile> images, String savePath);

}
