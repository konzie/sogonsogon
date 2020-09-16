package com.kh.sogon.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.sogon.board.model.dao.ReplyDAO;
import com.kh.sogon.board.model.vo.Reply;

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

    
    // 답글 작성 
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertReply2(Reply reply) {
		// 크로스 사이트 스크립팅 방지
        reply.setContent(
                replaceParameter(reply.getQnaContent()));

        // 개행문자 처리 \n -> <br>
        reply.setContent(
                reply.getQnaContent().replaceAll("\n", "<br>"));
		return replyDAO.insertReply2(reply);
	}
}
