package com.kh.sogon.roomboard.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.sogon.roomboard.model.vo.RoomBoardPageInfo;
import com.kh.sogon.roomboard.model.vo.RoomBoard;

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
}
