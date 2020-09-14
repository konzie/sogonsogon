package com.kh.sogon.roomboard.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.sogon.roomboard.model.vo.RoomBoard;
import com.kh.sogon.roomboard.model.vo.RoomBoardAttachment;
import com.kh.sogon.roomboard.model.vo.RoomBoardPageInfo;

/**
 * @author KSHan
 *
 */
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

	/** 게시글 이미지 조회 DAO
	 * @param boardNo
	 * @return result
	 */
	public List<RoomBoardAttachment> selectFiles(int boardNo) {
		return sqlSession.selectList("roomBoardMapper.selectFiles", boardNo);
	}

	/** 게시글 썸네일 목록 조회 DAO
	 * @param rbList
	 * @return thList
	 */
	public List<RoomBoardAttachment> selectThumbnailList(List<RoomBoard> rbList) {
		return sqlSession.selectList("roomBoardMapper.selectThumbnailList", rbList);
	}

	
	/** 게시글 수정 DAO
	 * @param upBoard
	 * @return result
	 */
	public int updateBoard(RoomBoard upBoard) {
		return sqlSession.update("roomBoardMapper.updateBoard", upBoard);
	}

	/** 파일 수정 DAO
	 * @param at
	 * @return result
	 */
	public int updateAttachment(RoomBoardAttachment at) {
		return sqlSession.update("roomBoardMapper.updateAttachment", at);
	}

	/** 파일 1개 정보 삭제 DAO
	 * @param fileNo
	 * @return result
	 */
	public int deleteAttachment2(int fileNo) {
		return sqlSession.delete("roomBoardMapper.deleteAttachment2", fileNo);
	}

	/** 검색 조건이 추가된 페이징 처리 DAO
	 * @param map
	 * @return
	 */
	public int getSearchListCount(Map<String, Object> map) {
		return sqlSession.selectOne("roomBoardMapper.getSearchListCount", map);
	}

	/** 검색 목록 죄회 DAO
	 * @param pInfo
	 * @param map
	 * @return
	 */
	public List<RoomBoard> selectSearchList(RoomBoardPageInfo pInfo, Map<String, Object> map) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("roomBoardMapper.selectSearchList", map, rowBounds);
	}

}
