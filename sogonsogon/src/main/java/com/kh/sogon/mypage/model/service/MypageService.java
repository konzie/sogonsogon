package com.kh.sogon.mypage.model.service;

import java.util.List;

import com.kh.sogon.board.model.vo.Board;
import com.kh.sogon.help.model.vo.Help;
import com.kh.sogon.member.model.vo.Member;
import com.kh.sogon.board.model.vo.PageInfo;
import com.kh.sogon.board.model.vo.Reply;
import com.kh.sogon.boardreply.model.vo.BoardReply;


/**
 * @author hyeonju
 *
 */
public interface MypageService {

	/** 비밀번호 확인 Service
	 * @param loginMember
	 * @return result
	 */
	public abstract int checkPwd(Member loginMember);

	/** 회원 정보 수정 Service
	 * @param loginMember
	 * @param newPwd1
	 * @return Member
	 */
	public abstract int updateInfo(Member upMember);

	/** 회원 탈퇴 Service
	 * @param memberNo
	 * @return result
	 */
	public abstract int deleteInfo(int memberNo);

	/** 페이징 처리를 위한 Service
	 * @param cp
	 * @return boardList
	 */
	public abstract PageInfo noticePage(int cp);


	public abstract List<Board> selectDList(PageInfo pInfo);
	
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

	/** 고객센터 페이징 처리를 위한 Service
	 * @param cp
	 * @return pageIn
	 */
	public abstract PageInfo qnaPage(int cp);
	
	/** 페이징바에 따라 고객센터 게시글 조회 Service
	 * @param pInfo
	 * @return boardList
	 */
	public abstract List<Help> selectQList(PageInfo pInfo);

	/** 내가 쓴 글 페이징 처리를 위한 Service
	 * @param cp
	 * @return pageIn
	 */
	public abstract PageInfo boardPage(int cp, int memberNo);

	/** 페이징바에 따라 내가 쓴 게시글 조회 Service
	 * @param pInfo
	 * @return boardList
	 */
	public abstract List<Board> selectBList(PageInfo pInfo, int memberNo);

	/** 채택된 댓글 페이징 처리를 위한 Service
	 * @param cp
	 * @return pageIn
	 */
	public abstract PageInfo replyPage(int cp, int memberNo);

	/** 페이징바에 따라 채택된 댓글 조회 Service
	 * @param pInfo
	 * @return boardList
	 */
	public abstract List<Reply> selectRList(PageInfo pInfo, int memberNo);

	/** 새 신고 게시글 조회
	 * @return count
	 */
	public abstract int reportCount();

	public abstract int qnaCount();

	public abstract int roomCount();

	public abstract int memberCount();

	public abstract PageInfo reportPage(int cp);




}
