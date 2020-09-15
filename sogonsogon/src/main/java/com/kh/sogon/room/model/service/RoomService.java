package com.kh.sogon.room.model.service;

import java.util.List;

import com.kh.sogon.board.model.vo.PageInfo;
import com.kh.sogon.member.model.vo.Member;
import com.kh.sogon.room.model.vo.Room;
import com.kh.sogon.room.model.vo.RoomMember;

public interface RoomService {

	/** 방 상세 정보 출력 Service
	 * @param roomNO
	 * @return room
	 */
	Room roomDetailInfo(int roomNo, Member loginMember);

	/** 페이징 처리를 위한 Service
	 * @param cp
	 * @return result
	 */
	PageInfo pagination(int cp);

	/** 방 목록 조회 Service
	 * @param pInfo
	 * @return room
	 */
	List<Room> selectList(PageInfo pInfo);

	/** 방 입장용 조회 Service
	 * @param room
	 * @return result
	 */
	int enterRoom(Room room);

	/** 방 생성 Service
	 * @param room
	 * @param memberNo
	 * @return result
	 */
	int createRoom(Room room);

	/** 방 입장 모달창 조회 Service
	 * @param roomNo
	 * @return room
	 */
	Room roomMList(int roomNo);

	/** 방 가입 여부 조회 Service
	 * @param memberNo 
	 * @param loginMemberNo
	 * @return 
	 */
	List<RoomMember> selectRoomMember(int memberNo);

	/** 카테고리별 목록 조회 Service
	 * @param pInfo 
	 * @param option
	 * @return Room
	 */
	List<Room> selectOption(PageInfo pInfo, int option);

	/** 카테고리별 페이징 조회 Service
	 * @param cp
	 * @param option
	 * @return result
	 */
	PageInfo getListCount2(int cp, int option);

	/** 검색어 페이징 조회 Service
	 * @param cp
	 * @param search
	 * @return
	 */
	PageInfo getListCount3(int cp, String search);

	/** 검색 조회 Service
	 * @param pInfo 
	 * @param search
	 * @return Room
	 */
	List<Room> searchList(PageInfo pInfo, String search);

	/** 메인 화면 List얻어오기
	 * @return
	 */
	List<Room> mainRoomList();



}
