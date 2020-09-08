package com.kh.sogon.board.model.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.sogon.board.model.vo.Attachment;
import com.kh.sogon.board.model.vo.Board;
import com.kh.sogon.board.model.vo.PageInfo;
import com.kh.sogon.board.model.vo.Search;

@Repository
public class BoardDAO {
	

	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	
	
	/** 전체 게시글 수 조회
	 * @param type
	 * @return listCount
	 */
	
	public int getListCount(int type) {
		
		return sqlSession.selectOne("boardMapper.getListCount",type);
	}




	/** 게시글 목록 조회 DAO
	 * @param pInfo
	 * @return boardList
	 */
	public List<Board> selectList(PageInfo pInfo) {
		
		
	
		int offset = (pInfo.getCurrentPage()-1)*pInfo.getLimit();
						
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("boardMapper.selectList", pInfo.getBoardType(), rowBounds);
										
	}




	
	
	/** 게시글 상세조회 DAO
	 * @param boardNo
	 * @return board
	 */
	public Board selectBoard(int boardNo) {
		
		return sqlSession.selectOne("boardMapper.selectBoard",boardNo);
		
	}




}
