package com.kh.sogon.roomboard.model.service;

import java.util.List;

import com.kh.sogon.roomboard.model.dao.RoomBoardReplyDAO;
import com.kh.sogon.roomboard.model.vo.RoomBoardReply;

public interface RoomBoardReplyService {

	
	/** 댓글 조회용 Service
	 * @param boardNo
	 * @return
	 */
	List<RoomBoardReplyDAO> selectList(int boardNo);

	/** 댓글 삽입용 Service
	 * @param reply
	 * @return result
	 */
	int insertReply(RoomBoardReply reply);
	
	/** 댓글 삽입용 Service
	 * @param reply
	 * @return result
	 */
	int insertReply2(RoomBoardReply reply);

	/** 댓글 수정 Service
	 * @param reply
	 * @return
	 */
	int updateReply(RoomBoardReply reply);
	
	/** 댓글 삭제 Service
	 * @param replyNo
	 * @return
	 */
	int deleteReply(int replyNo);

	/** 댓글 채택 Service
	 * @param replyNo
	 * @param memberNo
	 * @param roomBoardNo
	 * @return
	 */
	int adoptionReply(int replyNo, int memberNo, int roomBoardNo);

	/** 댓글 채택된거 있는지 확인하는 Service
	 * @param roomBoardNo
	 * @return
	 */
	int adoptionReplyChk(int roomBoardNo);

}
