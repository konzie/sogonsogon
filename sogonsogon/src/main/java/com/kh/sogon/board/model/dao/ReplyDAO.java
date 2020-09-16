package com.kh.sogon.board.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.sogon.board.model.vo.Reply;

@Repository
public class ReplyDAO {

	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	//댓글 조회 DAO
	public List<Reply> selectList(int qnaNo) {
		System.out.println(qnaNo+"qq");
		return sqlSession.selectList("replyMapper.selectList", qnaNo);
	}


	public int insertReply(Reply reply) {
		
		return sqlSession.insert("replyMapper.insertReply", reply);
	}

	
	// 답글 삽입 DAO 

	public int insertReply2(Reply reply) {
		
		return sqlSession.insert("replyMapper.insertReply2", reply);
	}
	
	
}
