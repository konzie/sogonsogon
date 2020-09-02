package com.kh.sogon.room.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sogon.room.model.dao.RoomDAO;
import com.kh.sogon.room.model.vo.Room;

@Service
public class RoomServiceImpl implements RoomService{
	
	@Autowired
	private RoomDAO roomDAO;

	// 방 상세 정보 출력 Service 구현
	@Override
	public Room roomDetailInfo(int roomNo) {
		return roomDAO.roomDetailInfo(roomNo);
	}
}
