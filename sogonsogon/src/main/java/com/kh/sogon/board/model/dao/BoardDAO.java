package com.kh.sogon.board.model.dao;


import java.util.HashMap;
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
	
	public int getListCount() {
		
		return sqlSession.selectOne("boardMapper.getListCount");
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
	public Board selectBoard(int qnaNo) {
		
		return sqlSession.selectOne("boardMapper.selectBoard",qnaNo);
		
	}

	// 게시글 삽입 
	public int insertBoard(Board board) {
		return sqlSession.insert("boardMapper.insertBoard", board);
	}




	public int selectNextNo() {
		return sqlSession.selectOne("boardMapper.selectNextNo");
		
	}




	public int insertAttachment(Attachment at) {

		return sqlSession.insert("boardMapper.insertAttachment",at);
	
	}



public void deleteAttachment(int qnaNo) {
		
		sqlSession.delete("boardMapper.deleteAttachment",qnaNo);
	}




public List<Board> mainBoardList() {
	return sqlSession.selectList("boardMapper.mainBoardList", null);
}




/** 문의글 삭제 DAO
 * @param qnaNo
 * @return result
 */
public int deleteBoard(int qnaNo) {
	return sqlSession.update("boardMapper.deleteBoard", qnaNo);
	
}


/** 검색이 포함된 페이징처리
 * @param map
 * @return
 */
public int getSerchListCount(Map<String, Object> map) {
	
	return sqlSession.selectOne("boardMapper.getSearchListCount", map);
}




public List<Board> selectSearchList(PageInfo pInfo, Map<String, Object> map) {

	int offset = (pInfo.getCurrentPage() -1)* pInfo.getLimit();
	
	RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
	
	return sqlSession.selectList("boardMapper.selectSearchList", map, rowBounds);
}



/** 게시판 좋아요 체크
 * @param qnaNo
 * @param memberNo
 * @return
 */
public int qnaLikeChk(int qnaNo, int memberNo) {
	Map<String, Integer> map = new HashMap<String, Integer>();
	
	map.put("qnaNo", qnaNo);
	map.put("memberNo", memberNo);
	
	return sqlSession.selectOne("boardMapper.qnaLikeChk", map);
}

/** 게시글 좋아요 등록
 * @param qnaNo
 * @param memberNo
 * @return
 */
public int qnaLikeAdd(int qnaNo, int memberNo) {
	Map<String, Integer> map = new HashMap<String, Integer>();
	
	map.put("qnaNo", qnaNo);
	map.put("memberNo", memberNo);
	
	return sqlSession.insert("boardMapper.qnaLikeAdd", map);
}

/** 게시글 좋아요 삭제
 * @param qnaNo
 * @param memberNo
 * @return
 */
public int qnaLikeDelete(int qnaNo, int memberNo) {
	Map<String, Integer> map = new HashMap<String, Integer>();
	
	map.put("qnaNo", qnaNo);
	map.put("memberNo", memberNo);
	
	return sqlSession.delete("boardMapper.qnaLikeDelete", map);
}

/** 게시글 좋아요 갯수
 * @param qnaNo
 * @return result
 */
public int boardLikeCount(int qnaNo) {
	return sqlSession.selectOne("boardMapper.qnaLikeCount", qnaNo);
}



}
