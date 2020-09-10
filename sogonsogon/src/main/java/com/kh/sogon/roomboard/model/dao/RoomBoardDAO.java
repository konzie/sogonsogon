package com.kh.sogon.roomboard.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.sogon.roomboard.model.vo.RoomBoard;
import com.kh.sogon.roomboard.model.vo.RoomBoardAttachment;
import com.kh.sogon.roomboard.model.vo.RoomBoardPageInfo;

@Repository
public class RoomBoardDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<RoomBoard> roomBoardSelectList(RoomBoardPageInfo pInfo) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("roomBoardMapper.roomBoardSelectList", pInfo.getBoardType(), rowBounds);
	}

	/** 전체 게시글 수 조회
	 * @param type
	 * @return listCount
	 */
	public int getListCount(int roomNo) {
		return sqlSession.selectOne("roomBoardMapper.getListCount", roomNo);
	}

	/** 게시글 삭제 DAO
	 * @param boardNo
	 * @return result
	 */
	public int deleteBoard(int boardNo) {
		return sqlSession.update("roomBoardMapper.deleteBoard", boardNo);
	}

	/** 게시글 상세조회 DAO
	 * @param boardNo
	 * @return roomBoard
	 */
	public RoomBoard selectBoard(int boardNo) {
		return sqlSession.selectOne("roomBoardMapper.selectBoard", boardNo);
	}

	
	/** 조회수 증가용 DAO
	 * @param boardNo
	 * @return result
	 */
	public int increaseCount(int boardNo) {
		return sqlSession.update("roomBoardMapper.increaseCount", boardNo);
	}

	/** SEQ_BNO 얻어오는 DAO
	 * @return 
	 */
	public int selectNextNo() {
		return sqlSession.selectOne("roomBoardMapper.selectNextNo");
	}

	/** 게시글 삽입 DAO
	 * @param board
	 * @return result
	 */
	public int insertBoard(RoomBoard board) {
		return sqlSession.insert("roomBoardMapper.insertBoard", board);
	}
	/** 파일 정보 삽입 DAO
	 * @param at
	 * @return result
	 */
	public int insertAttachment(RoomBoardAttachment at) {
		return sqlSession.insert("roomBoardMapper.insertAttachment", at);
	}
	
	/** 파일 저장 오류 시 DB에 저장된 내용 삭제 DAO
	 * @param boardNo
	 */
	public void deleteAttachment(int boardNo) {
		sqlSession.delete("roomBoardMapper.deleteAttachment", boardNo);
	}

}
