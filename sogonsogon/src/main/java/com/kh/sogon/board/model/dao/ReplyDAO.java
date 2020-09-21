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
	public int updateReply(RoomBoardReply reply) {
		return sqlSession.update("replyMapper.updateReply", reply);
	}
	
	/** 댓글 삭제 DAO
	 * @param replyNo
	 * @return
	 */
	public int deleteReply(int replyNo) {
		return sqlSession.update("replyMapper.deleteReply", replyNo);
	}

	/** 댓글 채택 DAO
	 * @param replyNo
	 * @param memberNo
	 * @param qnaNo
	 * @return
	 */
	public int adoptionReply(int replyNo, int memberNo, int qnaNo) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("replyNo", replyNo);
		map.put("memberNo", memberNo);
		map.put("roomBoardNo", qnaNo);
		
		return sqlSession.insert("replyMapper.adoptionReply", map);
	}

	/** 댓글 채택된거 있는지 확인하는 DAO
	 * @param qnaNo
	 * @return
	 */
	public int adoptionReplyChk(int qnaNo) {
		return sqlSession.selectOne("replyMapper.adoptionReplyChk", qnaNo);
	}

	
	
}
