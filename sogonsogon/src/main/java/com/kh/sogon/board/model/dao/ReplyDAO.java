package com.kh.sogon.board.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.sogon.board.model.vo.Reply;
import com.kh.sogon.roomboard.model.vo.RoomBoardReply;

@Repository
public class ReplyDAO {

	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	//댓글 조회 DAO
	public List<Reply> selectList(int qnaNo) {
		
		return sqlSession.selectList("replyMapper.selectList", qnaNo);
	}


	public int insertReply(Reply reply) {
		
		return sqlSession.insert("replyMapper.insertReply", reply);
	}

	
	// 답글 삽입 DAO 

	public int insertReply2(Reply reply) {
		
		return sqlSession.insert("replyMapper.insertReply2", reply);
	}


	/** 댓글 수정용 DAO
	 * @param reply
	 * @return
	 */
	public int updateReply(Reply reply) {
		return sqlSession.update("replyMapper.updateReply", reply);
	}
	
	/** 댓글 삭제 DAO
	 * @param replyNo
	 * @return
	 */
	public int deleteReply(int replyNo) {
		return sqlSession.update("replyMapper.deleteReply", replyNo);
	}

	
	
	
}
