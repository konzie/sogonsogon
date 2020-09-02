package com.kh.sogon.room.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.sogon.room.model.dao.RoomDAO;
import com.kh.sogon.room.model.vo.Room;

@Service
public class RoomServiceImpl implements RoomService{
	
	@Autowired
	private RoomDAO roomDAO;
	
	@Autowired
	private BCryptPasswordEncoder bcPwd;

	// 방 상세 정보 출력 Service 구현
	@Override
	public Room roomDetailInfo(int roomNo, String inputPwd) {
		// 비공개방인지 확인하기
		Room room = null;
		String pwdLoad = roomDAO.roomDetailInfoPwd(roomNo);
		
		if(pwdLoad.length() > 0) {
			// 비공개방이더라도 즐겨찾기에 추가가 되어있다면 입장 패스워드 확인 없이 입장 가능해야함
			int chkBookmark = roomDAO.roomBookmarkChk(roomNo);
			
			if(chkBookmark > 0) {
				// 즐겨찾기가 되어 있을 때
				room = roomDAO.roomDetailInfo(roomNo);
			} else {
				// 즐겨찾기 안되어 있을 때 비밀번호 확인
				if(bcPwd.matches(pwdLoad, inputPwd)) {
					// 비밀번호 맞을 때
					room = roomDAO.roomDetailInfo(roomNo);
					// 맞다면 즐겨찾기 등록
				}
			}
		} else {
			// 공개방일때
			room = roomDAO.roomDetailInfo(roomNo);
		}

		
		return room;
	}
}
