package com.kh.sogon.room.model.service;

import com.kh.sogon.member.model.vo.Member;
import com.kh.sogon.room.model.vo.Room;

public interface RoomService {

	/** 방 상세 정보 출력 Service
	 * @param roomNO
	 * @return room
	 */
	Room roomDetailInfo(int roomNo, Member loginMember);

}
