package com.kh.sogon.room.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.sogon.room.model.vo.Room;

@Repository
public class RoomDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;


	/** 방 상세 정보 출력 DAO
	 * @param roomNO
	 * @return room
	 */
	public Room roomDetailInfo(int roomNo) {
		return sqlSession.selectOne("roomMapper.roomdetailInfo", roomNo);
	}
}
