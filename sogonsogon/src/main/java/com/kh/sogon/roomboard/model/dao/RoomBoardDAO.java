package com.kh.sogon.roomboard.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.sogon.roomboard.model.vo.RoomBoard;

@Repository
public class RoomBoardDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<RoomBoard> roomBoardSelectList(int roomNo) {
		return sqlSession.selectList("roomBoardMapper.roomBoardSelectList", roomNo);
	}
}
