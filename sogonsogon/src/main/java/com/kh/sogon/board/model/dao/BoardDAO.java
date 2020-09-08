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




	/** 조회 수 증가 DAO
	 * @param boardNo
	 * @return result
	 */
	public int increaseCount(int boardNo) {
	
		return sqlSession.update("boardMapper.increaseCount",boardNo);
	}




	/** 다음 게시글 번호 조회
	 * @return boardNo
	 */
	public int selectNextNo() {
		
		return sqlSession.selectOne("boardMapper.selectNextNo");
	}




	public int insertBoard(Board board) {
		
		
		
		
		return sqlSession.insert("boardMapper.insertBoard", board);
	}




	public int deleteBoard(Board board) {
		
		return sqlSession.delete("boardMapper.deleteBoard", board);
	}




	public int updateBoard(Board upBoard) {
		
		
		
		return sqlSession.update("boardMapper.updateBoard", upBoard);
	}




	
	
	
	
	/** 파일 정보 삽입 DAO
	 * @param at
	 * @return result
	 */
	public int insertAttachment(Attachment at) {
		
		
		return sqlSession.insert("boardMapper.insertAttachment",at);
		
		
	}




	/** 게시글 이미지 조회 DAO
	 * @param boardNo
	 * @return result
	 */
	
	public List<Attachment> selectFiles(int boardNo) {
	
		return sqlSession.selectList("boardMapper.selectFiles", boardNo);
	}




	public void deleteAttachment(int boardNo) {
		
		sqlSession.delete("boardMapper.deleteAttachment",boardNo);
	}




	public List<Attachment> selectThumbnailList(List<Board> boardList) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("boardMapper.selectThumbnailList", boardList);
	}



	// 파일 정보 수정  DAO
	public int updateAttachment(Attachment at) {
		// TODO Auto-generated method stub
		return sqlSession.update("boardMapper.updateAttachment", at);
	}



	// 파일 1개 정보 삭제 DAO 
	// result 
	public int deleteAttachment2(int fileNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("boardMapper.deleteAttachment2", fileNo);
	}



		//게시판 조회수 높은 게시글 조회 DAO
	public List<Board> selectTopViews(int type) {
		
		return sqlSession.selectList("boardMapper.selectTopViews", type);
	}



	// 검색 조건이 추가된 페이징 처리 DAO


	public int getSerchListCount(Map<String, Object> map) {
		
		return sqlSession.selectOne("boardMapper.getSearchListCount", map);
	}




	public List<Board> selectSearchList(PageInfo pInfo, Map<String, Object> map) {

		int offset = (pInfo.getCurrentPage() -1)* pInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("boardMapper.selectSearchList", map, rowBounds);
	}

	

}
