package com.kh.sogon.roomboard.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.sogon.roomboard.model.vo.RoomBoardReply;

@Repository
public class RoomBoardReplyDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<RoomBoardReplyDAO> selectList(int boardNo) {
		return sqlSession.selectList("roomBoardReplyMapper.selectList", boardNo);
	}

	/** 댓글 삽입용 DAO
	 * @param reply
	 * @return result
	 */
	public int insertReply(RoomBoardReply reply) {
		return sqlSession.insert("roomBoardReplyMapper.insertReply", reply);
	}
	
	/** 답글 삽입용 DAO
	 * @param reply
	 * @return result
	 */
	public int insertReply2(RoomBoardReply reply) {
		return sqlSession.insert("roomBoardReplyMapper.insertReply2", reply);
	}

}
