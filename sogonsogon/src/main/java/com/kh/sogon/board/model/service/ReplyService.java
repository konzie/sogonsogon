package com.kh.sogon.board.model.service;

import java.util.List;

import com.kh.sogon.board.model.vo.Reply;
import com.kh.sogon.roomboard.model.vo.RoomBoardReply;

public interface ReplyService {

	
	/** 댓글 조회용 Service
	 * @param qnaNo
	 * @return
	 */
	List<Reply> selectList(int qnaNo);

	/** 댓글 삽입용 Service
	 * @param reply
	 * @return result
	 */
	int insertReply(Reply reply);


	/** 댓글 수정 Service
	 * @param reply
	 * @return
	 */
	int updateReply(Reply reply);
	
	/** 댓글 삭제 Service
	 * @param replyNo
	 * @return
	 */
	int deleteReply(int replyNo);

	int adoptionReply(int replyNo, int memberNo, int qnaNo);

	int adoptionReplyChk(int qnaNo);
	




}
