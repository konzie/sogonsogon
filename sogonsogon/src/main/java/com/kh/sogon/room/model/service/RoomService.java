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
	 * @return list
	 */
	List<Room> mainRoomList();


	/** 작성 게시글 갯수 확인 Service
	 * @param roomNo
	 * @param loginMemberNo
	 * @return
	 */
	int writeBoardCount(int roomNo, int loginMemberNo);

	/**작성 게시글 댓글 갯수 확인 Service
	 * @param roomNo
	 * @param memberNo
	 * @return
	 */
	int writeBoardReplyCount(int roomNo, int loginMemberNo);

	/** 방 회원 탈퇴
	 * @param roomNo
	 * @return
	 */
	int withDraw(int roomNo, int memberNo);

	/** 작석 댓글 채택 갯수
	 * @param roomNo
	 * @param memberNo
	 * @return
	 */
	int writeBoardReplyAdoptionCount(int roomNo, int memberNo);
	
	List<RoomMember> mainLikeList();

	/** 방 상세 회원 조회
	 * @param roomNo
	 * @return 
	 */
	List<RoomMember> memberInfo(int roomNo);

	/** 방 상세 회원 추방
	 * @param roomNo
	 * @param memberNo
	 * @return
	 */
	int memberInfoDelete(int roomNo, int memberNo);

	
	/** 방 정보 수정 조회용 Service
	 * @param roomNo
	 * @return
	 */
	Room updateRoomList(int roomNo);

	/** 방 정보 수정 Service
	 * @param room
	 * @return result
	 */
	int updateRoomInsert(Room room);

	/** 방장 room member 추가 Service
	 * @param memberNo
	 * @param roomNo
	 * @return
	 */
	//int insertMember(int memberNo, int roomNo);



}
