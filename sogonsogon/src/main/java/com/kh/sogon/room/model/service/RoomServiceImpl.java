package com.kh.sogon.room.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.sogon.board.model.vo.PageInfo;
import com.kh.sogon.member.model.vo.Member;
import com.kh.sogon.room.model.dao.RoomDAO;
import com.kh.sogon.room.model.vo.Room;
import com.kh.sogon.room.model.vo.RoomMember;

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
		int memberCount = 0;
		
		String pwdLoad = roomDAO.roomDetailInfoPwd(roomNo);
		memberCount = roomDAO.roomMemberCount(roomNo);
		
		
		if(pwdLoad != null) {
			// 비공개방이더라도 즐겨찾기에 추가가 되어있다면 입장 패스워드 확인 없이 입장 가능해야함
			if(loginMember != null)
				chkBookmark = roomDAO.roomMemberChk(roomNo, loginMember);
			
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
						result = roomDAO.insertRoomMember(roomNo, loginMember);
					// 	room.setRoomMemberCount(room.getRoomMemberCount()+1);
				}
			}
		} else {
			// 공개방일때
			room = roomDAO.roomDetailInfo(roomNo);

			if(loginMember != null) {
				chkBookmark = roomDAO.roomMemberChk(roomNo, loginMember);
				if(chkBookmark == 0) {
					// 공개방 & 즐겨찾기 등록 x 
				
					result = roomDAO.insertRoomMember(roomNo, loginMember);
				}else {
					// 공개방 & 즐겨찾기 등록 o
					room = roomDAO.roomDetailInfo(roomNo);
				}
			}
		}

		if(room != null) {
			// 회원수 출력을 위한 세터 등록
			room.setRoomMemberCount(memberCount);
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

	//  방 생성 Service 구현
	@Override
	public int createRoom(Room room) {	
		return roomDAO.createRoom(room);
	}

	// 모달 정보 조회 Service 구현
	@Override
	public Room roomMList(int roomNo) {
		return roomDAO.roomMList(roomNo);
	}

	// 방 가입 여부 조회 Service 구현
	@Override
	public List<RoomMember> selectRoomMember(int roomMemberRoomNo) {
		return roomDAO.selectRoomMember(roomMemberRoomNo);
	}

	@Override
	public List<Room> selectOption(PageInfo pInfo, int roomType) {
		return roomDAO.selectOption(pInfo, roomType);
	}

	@Override
	public PageInfo getListCount2(int cp, int option) {
		int listCount = roomDAO.getListCount2(option);
		pInfo.setPageInfo(cp, listCount);
		
		return pInfo;
	}

	@Override
	public PageInfo getListCount3(int cp, String search) {
		int listCount = roomDAO.getListCount3(search);
		pInfo.setPageInfo(cp, listCount);
		
		return pInfo;
	}

	@Override
	public List<Room> searchList(PageInfo pInfo, String search) {
		 return roomDAO.searchList(pInfo,search);
	}

	@Override
	public List<Room> mainRoomList() {
		return roomDAO.mainRoomList();
	}

	// 작성 게시글 갯수 확인 Service 구현
	@Override
	public int writeBoardCount(int roomNo, int loginMemberNo) {
		return roomDAO.writeBoardCount(roomNo, loginMemberNo);
	}

	// 작성 게시글 댓글 갯수 확인 Service 구현
	@Override
	public int writeBoardReplyCount(int roomNo, int loginMemberNo) {
		return roomDAO.writeBoardReplyCount(roomNo, loginMemberNo);
	}


}
