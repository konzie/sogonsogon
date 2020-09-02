package com.kh.sogon.room.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.sogon.member.model.vo.Member;
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
	public int roomBookmarkChk(int roomNo, Member loginMember) {
		Map<String, Integer> bookmarkMap = new HashMap<String, Integer>();
		
		bookmarkMap.put("roomNo", roomNo);
		bookmarkMap.put("memberNo", loginMember.getMemberNo());
		return sqlSession.selectOne("roomMapper.roomBookmarkChk", bookmarkMap);
	}


	/** 방 즐겨찾기 삽입 DAO
	 * @param roomNo
	 * @param loginMember
	 * @return result
	 */
	public int insertBookmark(int roomNo, Member loginMember) {
		Map<String, Integer> bookmarkMap = new HashMap<String, Integer>();
		
		bookmarkMap.put("roomNo", roomNo);
		bookmarkMap.put("memberNo", loginMember.getMemberNo());
		return sqlSession.insert("roomMapper.insertBookmark", bookmarkMap);
	}
}
