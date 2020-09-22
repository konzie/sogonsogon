package com.kh.sogon.mypage.model.service;

import java.util.List;

import com.kh.sogon.board.model.vo.Board;
import com.kh.sogon.help.model.vo.Help;
import com.kh.sogon.member.model.vo.Member;
import com.kh.sogon.mypage.model.vo.HelpAnswer;
import com.kh.sogon.mypage.model.vo.ReportMember;
import com.kh.sogon.room.model.vo.Room;
import com.kh.sogon.room.model.vo.RoomMember;
import com.kh.sogon.roomboard.model.vo.RoomBoard;
import com.kh.sogon.board.model.vo.PageInfo;
import com.kh.sogon.board.model.vo.Reply;

/**
 * @author hyeonju
 *
 */
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

	/** 내가 입장한 방 조회 Service
	 * @param pInfo
	 * @param memberNo
	 * @return
	 */
	public abstract List<RoomMember> selectRoomMemberList(int memberNo);
	
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


	/** 내가 입장한 방 페이징 처리를 위한 Service
	 * @param cp
	 * @param memberNo
	 * @return
	 */
	public abstract PageInfo roomPage(int cp, List<RoomMember> roomMemberList);

	/** 페이징바에 따라 내가 입장한 방 페이징 처리를 위한 Service
	 * @param pInfo
	 * @param pInfo2
	 * @return
	 */
	public abstract List<Room> selectRoomList(PageInfo pInfo, List<RoomMember> roomMemberList);

	/** 공지사항 삭제 Service
	 * @param boardNo
	 * @return
	 */
	public abstract int deleteNotice(int boardNo);

	/** 공지사항 상세조회 Service
	 * @param boardNo
	 * @return
	 */
	public abstract Board noticeView(int boardNo);

	/** 공지사항 작성 Service
	 * @param title
	 * @param content
	 * @return
	 */
	public abstract int noticeWrite(Board board);

	/** 신고 게시글 되돌리기 Service
	 * @param boardNo
	 */
	public abstract int restoreReport(int boardNo);

	
	/** 신고받은 게시글 작성자 찾기 Service
	 * @param memberNick
	 */
	public abstract List<ReportMember> findMember(int memberNo);
	
	/** 신고멤버에 멤버 추가 Service
	 * @param member
	 * @return
	 */
	public abstract int insertMember(ReportMember member);

	/**경고 count++ Service
	 * @param memberNo
	 * @return
	 */
	public abstract int updateReport(ReportMember member);

	/** 멤버 status 복원 Service
	 * @param writerNick
	 */
	public abstract int restoreMember(int memberNo);

	/** 공지사항 수정 Service
	 * @param notice
	 * @return
	 */
	public abstract int updateNotice(Board notice);

	/** help 상세조회 Service
	 * @param boardNo
	 * @return
	 */
	public abstract Help helpView(int boardNo);

	/** 고객센터 답변 작성 Serivce
	 * @param helpNo
	 * @param answer
	 * @return
	 */
	public abstract int insertAnswer(HelpAnswer helpAnswer);

	public abstract HelpAnswer selectAnswer(int boardNo);

	public abstract List<Board> mainNoticeList();

	public abstract PageInfo roomReportPage(int cp);

	public abstract List<RoomBoard> selectRoomReportList(PageInfo roomPInfo);

	public abstract int deleteRoomReport(RoomBoard board);

	public abstract int restorReportRoom(RoomBoard board);

	public abstract Board boardView(int boardNo);

	public abstract List<Board> myReportBoard(String writer);

	public abstract PageInfo roomBoardPage(int cp, int memberNo);

	public abstract List<RoomBoard> selectRoomBoardList(PageInfo roomPInfo, int memberNo);

	public abstract int selectBoard(RoomBoard board);

	public abstract int reportCount2();

	public abstract RoomBoard roomBoard(RoomBoard board);

	public abstract int reportInfo(int memberNo);

}
