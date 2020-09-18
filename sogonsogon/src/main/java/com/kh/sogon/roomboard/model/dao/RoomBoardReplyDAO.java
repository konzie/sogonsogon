package com.kh.sogon.roomboard.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	/** 댓글 수정용 DAO
	 * @param reply
	 * @return
	 */
	public int updateReply(RoomBoardReply reply) {
		return sqlSession.update("roomBoardReplyMapper.updateReply", reply);
	}
	
	/** 댓글 삭제 DAO
	 * @param replyNo
	 * @return
	 */
	public int deleteReply(int replyNo) {
		return sqlSession.update("roomBoardReplyMapper.deleteReply", replyNo);
	}

	/** 댓글 채택 DAO
	 * @param replyNo
	 * @param memberNo
	 * @param roomBoardNo
	 * @return
	 */
	public int adoptionReply(int replyNo, int memberNo, int roomBoardNo) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("replyNo", replyNo);
		map.put("memberNo", memberNo);
		map.put("roomBoardNo", roomBoardNo);
		
		return sqlSession.insert("roomBoardReplyMapper.adoptionReply", map);
	}

	/** 댓글 채택된거 있는지 확인하는 DAO
	 * @param roomBoardNo
	 * @return
	 */
	public int adoptionReplyChk(int roomBoardNo) {
		return sqlSession.selectOne("roomBoardReplyMapper.adoptionReplyChk", roomBoardNo);
	}

}
