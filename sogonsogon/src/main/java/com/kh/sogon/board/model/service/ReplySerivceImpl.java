package com.kh.sogon.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.sogon.board.model.dao.ReplyDAO;
import com.kh.sogon.board.model.vo.Reply;
import com.kh.sogon.roomboard.model.vo.RoomBoardReply;

@Service
public class ReplySerivceImpl implements ReplyService {

	@Autowired
	private ReplyDAO replyDAO;
	
	@Override
	public List<Reply> selectList(int qnaNo) {
		
	 return replyDAO.selectList(qnaNo);
	}
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertReply(Reply reply) {
		
        reply.setContent(
                replaceParameter(reply.getContent()));

        reply.setContent(
                reply.getContent().replaceAll("\n", "<br>"));
		return replyDAO.insertReply(reply);
	}
	
    private String replaceParameter(String param) {
        String result = param;
        if(param != null) {
            result = result.replaceAll("&", "&amp;");
            result = result.replaceAll("<", "&lt;");
            result = result.replaceAll(">", "&gt;");
            result = result.replaceAll("\"", "&quot;");
        }

        return result;
    }

	// 댓글 수정 서비스 구현
		public int updateReply(RoomBoardReply reply) {
			// 크로스 사이트 스크립팅 방지
			reply.setReplyContent(replaceParameter(reply.getReplyContent()));

			// 개행문자 처리 \n -> <br>
			reply.setReplyContent(reply.getReplyContent().replaceAll("\n", "<br>"));

			return replyDAO.updateReply(reply);
		}
		
		// 댓글 삭제 서비스 구현
		@Override
		public int deleteReply(int replyNo) {
			return replyDAO.deleteReply(replyNo);
		}
		
		// 댓글 채택 구현 Service
		@Override
		public int adoptionReply(int replyNo, int memberNo, int qnaNo) {
			return replyDAO.adoptionReply(replyNo, memberNo, qnaNo);
		}

		// 댓글 채택된거 있는지 확인하는 Service 구현
		@Override
		public int adoptionReplyChk(int qnaNo) {
			return replyDAO.adoptionReplyChk(qnaNo);
		}

	
}
