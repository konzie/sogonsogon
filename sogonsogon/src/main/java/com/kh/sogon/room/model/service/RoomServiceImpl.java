package com.kh.sogon.room.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.sogon.board.model.vo.PageInfo;
import com.kh.sogon.member.model.vo.Member;
import com.kh.sogon.room.model.dao.RoomDAO;
import com.kh.sogon.room.model.vo.Room;

@Service
public class RoomServiceImpl implements RoomService{
	
	@Autowired
	private RoomDAO roomDAO;
	
	@Autowired
	private BCryptPasswordEncoder bcPwd;
	
	@Autowired
	private PageInfo pInfo;

	// 방 상세 정보 출력 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public Room roomDetailInfo(int roomNo, Member loginMember) {
		// 비공개방인지 확인하기
		Room room = null;
		String inputPwd = loginMember != null ? loginMember.getMemberPwd() : "";
		int chkBookmark = 0;
		int result = 0;
		
		String pwdLoad = roomDAO.roomDetailInfoPwd(roomNo);
		
		if(pwdLoad != null) {
			// 비공개방이더라도 즐겨찾기에 추가가 되어있다면 입장 패스워드 확인 없이 입장 가능해야함
			if(loginMember != null)
				chkBookmark = roomDAO.roomBookmarkChk(roomNo, loginMember);
			
			if(chkBookmark > 0) {
				// 즐겨찾기가 되어 있을 때
				room = roomDAO.roomDetailInfo(roomNo);
			} else {
				// 즐겨찾기 안되어 있을 때 비밀번호 확인
				/*if(bcPwd.matches(pwdLoad, loginMember.getMemberPwd())) {*/
				if(pwdLoad.equals(inputPwd)) {
					// 비밀번호 맞을 때
					room = roomDAO.roomDetailInfo(roomNo);
					
					// 맞다면 즐겨찾기 등록
					if(loginMember != null)
						result = roomDAO.insertBookmark(roomNo, loginMember);
				}
			}
		} else {
			// 공개방일때
			room = roomDAO.roomDetailInfo(roomNo);
		}

		
		return room;
	}

	// 페이징 처리를 위한 Service 구현
	@Override
	public PageInfo pagination(int cp) {
		int listCount = roomDAO.getListCount();
		pInfo.setPageInfo(cp, listCount);
		
		return pInfo;
	}

	//  방 목록 조회 Service 구현
	@Override
	public List<Room> selectList(PageInfo pInfo) {
		return roomDAO.selectList(pInfo);
	}

	// 방 입장용 조회 Service 구현
	@Override
	public int enterRoom(Room room) {
		
		Room selectRoom = roomDAO.enterRoom(room);
		
		int result = 0;
		if(selectRoom.getRoomPassword().equals(room.getRoomPassword())) {
			result =1;
		}else {
			result=0;
		}
		
		return result;
	}
	
}
