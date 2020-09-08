package com.kh.sogon.mypage.model.service;

import java.util.List;

import com.kh.sogon.board.model.vo.Board;
import com.kh.sogon.member.model.vo.Member;
import com.kh.sogon.board.model.vo.PageInfo;


public interface MypageService {

	/** 비밀번호 확인 Service
	 * @param loginMember
	 * @return result
	 */
	public abstract String checkPwd(Member loginMember);

	/** 회원 정보 수정 Service
	 * @param loginMember
	 * @param newPwd1
	 * @return Member
	 */
	public abstract int updateInfo(Member loginMember, String newPwd1);

	/** 회원 탈퇴 Service
	 * @param memberNo
	 * @return result
	 */
	public abstract int deleteInfo(int memberNo);

	/** 페이징 처리를 위한 Service
	 * @param cp
	 * @return boardList
	 */
	public abstract PageInfo pagination(int cp);

	/** 페이징바에 따라 공지사항 조회 Service
	 * @param pInfo
	 * @return board
	 */
	public abstract List<Board> selectNList(PageInfo pInfo);

	/** 멤버 조회 페이징 처리를 위한 Service
	 * @param cp
	 * @return PageIn
	 */
	public abstract PageInfo memberPage(int cp);

	/** 페이징바에 따라 멤버 조회 Service
	 * @param pInfo
	 * @return MemberList
	 */
	public abstract List<Member> selectMList(PageInfo pInfo);

	/** 회원 정보 수정 Service
	 * @param upMember
	 * @return member
	 */
	public abstract int updateMember(Member upMember);

}
