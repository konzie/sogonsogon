package com.kh.sogon.room.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.sogon.board.model.vo.PageInfo;
import com.kh.sogon.member.model.vo.Member;
import com.kh.sogon.room.model.vo.Room;
import com.kh.sogon.room.model.vo.RoomMember;

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


	/** 방 비밀번호 가져오기 DAO
	 * @param roomNo
	 * @return string
	 */
	public String roomDetailInfoPwd(int roomNo) {
		return sqlSession.selectOne("roomMapper.roomdetailInfoPwd", roomNo);
	}


	/** 방 회원 조회 리스트 DAO
	 * @param roomNo
	 * @param logMember
	 * @return chkBookmark
	 */
	public int roomMemberChk(int roomNo, Member loginMember) {
		Map<String, Integer> bookmarkMap = new HashMap<String, Integer>();
		
		bookmarkMap.put("roomNo", roomNo);
		bookmarkMap.put("memberNo", loginMember.getMemberNo());
		return sqlSession.selectOne("roomMapper.roomMemberChk", bookmarkMap);
	}


	/** 방 즐겨찾기 삽입 DAO
	 * @param roomNo
	 * @param loginMember
	 * @return result
	 */
	public int insertRoomMember(int roomNo, Member loginMember) {
		Map<String, Integer> bookmarkMap = new HashMap<String, Integer>();
		
		bookmarkMap.put("roomNo", roomNo);
		bookmarkMap.put("memberNo", loginMember.getMemberNo());
		return sqlSession.insert("roomMapper.insertRoomMember", bookmarkMap);
	}


	/** 페이징 처리를 위한 DAO
	 * @return result
	 */
	public int getListCount() {
		return sqlSession.selectOne("roomMapper.getListCount", null);
	}
	
	/** 방 목록 조회 DAO
	 * @param pInfo
	 * @return Room
	 */
	public List<Room> selectList(PageInfo pInfo) {
		 pInfo.setLimit(6);
		 int offset =(pInfo.getCurrentPage()-1)*pInfo.getLimit();

		 RowBounds rowBounds = new RowBounds(offset,pInfo.getLimit());
		 
		return sqlSession.selectList("roomMapper.selectList" ,null,rowBounds);
		
	}

	/** 방 입장용 조회 DAO
	 * @param room
	 * @return 
	 */
	public Room enterRoom(Room room) {
		return sqlSession.selectOne("roomMapper.enterRoom",room);
	}


	/** 방 회원 수 조회를 위한 DAO
	 * @param roomNo
	 * @return memberCount
	 */
	public int roomMemberCount(int roomNo) {
		return sqlSession.selectOne("roomMapper.roomMemberCount",roomNo);
	}




	/** 방 생성 DAO
	 * @param room
	 * @return result
	 */
	public int createRoom(Room room) {
		return sqlSession.insert("roomMapper.createRoom", room);
	}


	/** 방 입장 모달창 조회 DAO
	 * @param roomNo
	 * @return room
	 */
	public Room roomMList(int roomNo) {
		return sqlSession.selectOne("roomMapper.roomMList", roomNo);
	}


	/** 입장
	 * @param memberNo 
	 * @param loginMemberNo
	 * @return
	 */
	public List<RoomMember> selectRoomMember(int roomMemberRoomNo) {
		return  sqlSession.selectList("roomMapper.selectRoomMember", roomMemberRoomNo);
	}


	/** 카테고리별 목록 조회
	 * @param pInfo
	 * @param roomType
	 * @return
	 */
	public List<Room> selectOption(PageInfo pInfo, int roomType) {
		 pInfo.setLimit(6);
		 int offset =(pInfo.getCurrentPage()-1)*pInfo.getLimit();

		 RowBounds rowBounds = new RowBounds(offset,pInfo.getLimit());
		 
		return sqlSession.selectList("roomMapper.selectOption", roomType,rowBounds);
	}


	/** 카테고리별 목록 조회용 페이징
	 * @param roomType
	 * @return
	 */
	public int getListCount2(int roomType) {
		return sqlSession.selectOne("roomMapper.getListCount2", roomType);
	}

	/** 검색어 조회용 페이징
	 * @param search
	 * @return
	 */
	public int getListCount3(String search) {
		return sqlSession.selectOne("roomMapper.getListCount3", search);
	}

	/** 검색어 조회 DAO
	 * @param pInfo
	 * @param search
	 * @return
	 */
	public List<Room> searchList(PageInfo pInfo, String search) {
		 pInfo.setLimit(6);
		 int offset =(pInfo.getCurrentPage()-1)*pInfo.getLimit();

		 RowBounds rowBounds = new RowBounds(offset,pInfo.getLimit());
		return sqlSession.selectList("roomMapper.searchList", search, rowBounds);
	}


	public int insertCount(int roomNo) {
		return sqlSession.update("roomMapper.insertCount", roomNo);
	}


	public List<Room> mainRoomList() {
		
		return  sqlSession.selectList("roomMapper.mainRoomList", null);
	}


	public List<RoomMember> mainLikeList() {
		return sqlSession.selectList("roomMapper.mainLikeList", null);
	}

	
}
