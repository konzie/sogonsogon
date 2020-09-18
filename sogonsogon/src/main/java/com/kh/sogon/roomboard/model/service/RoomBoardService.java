package com.kh.sogon.roomboard.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.sogon.board.model.vo.PageInfo;
import com.kh.sogon.roomboard.model.vo.RoomBoard;
import com.kh.sogon.roomboard.model.vo.RoomBoardAttachment;
import com.kh.sogon.roomboard.model.vo.RoomBoardPageInfo;
import com.kh.sogon.roomboard.model.vo.RoomBoardSearch;

/**
 * @author KSHan
 *
 */
/**
 * @author KSHan
 *
 */
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

	/** 게시글 이미지 조회 Service
	 * @param boardNo
	 * @return files
	 */
	List<RoomBoardAttachment> selectFiles(int boardNo);

	/** 게시글 썸네일 목록 조회 Service
	 * @param boardList
	 * @return thList
	 */
	List<RoomBoardAttachment> selectThumbnailList(List<RoomBoard> rbList);

	/** 게시글 수정 Service
	 * @param upBoard
	 * @param savePath
	 * @param images
	 * @param deleteImages
	 * @return
	 */
	int updateBoard(RoomBoard upBoard, String savePath, List<MultipartFile> images, boolean[] deleteImages);

	/** 검색 조건이 추가된 페이징 처리 Service
	 * @param roomNo
	 * @param cp
	 * @param roomBoardSearch
	 * @return pInfo
	 */ 
	RoomBoardPageInfo pagination(int roomNo, int cp, RoomBoardSearch roomBoardSearch);

	/** 검색 목록 조회 Service
	 * @param pInfo
	 * @param roomBoardSearch
	 * @return
	 */
	List<RoomBoard> roomBoardSelectSearchList(RoomBoardPageInfo pInfo, RoomBoardSearch roomBoardSearch);

	/** 게시글 좋아요 Service
	 * @param roomBoardNo
	 * @return
	 */
	int boardLike(int roomBoardNo, int memberNo);

	/** 게시글 좋아요 갯수 Service
	 * @param roomBoardNo
	 * @param memberNo
	 * @return
	 */
	int boardLikeCount(int roomBoardNo);

	/** 사용자 좋아요 여부 Service
	 * @param roomBoardNo
	 * @param memberNo
	 * @return
	 */
	int boardLikeUserChk(int roomBoardNo, int memberNo);


}
