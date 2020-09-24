package com.kh.sogon.mypage.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.sogon.board.model.vo.Board;
import com.kh.sogon.help.model.vo.Help;
import com.kh.sogon.member.model.vo.Member;
import com.kh.sogon.board.model.vo.PageInfo;
import com.kh.sogon.board.model.vo.Reply;
import com.kh.sogon.mypage.model.dao.MypageDAO;
import com.kh.sogon.mypage.model.vo.HelpAnswer;
import com.kh.sogon.mypage.model.vo.ReportMember;
import com.kh.sogon.room.model.vo.Room;
import com.kh.sogon.room.model.vo.RoomMember;
import com.kh.sogon.roomboard.model.vo.RoomBoard;
import com.kh.sogon.roomboard.model.vo.RoomBoardReply;

@Service
public class MypageServiceImpl implements MypageService{
	
	@Autowired // bcrypt 암호화 객체 의존성 주입(DI)
	private BCryptPasswordEncoder bcPwd;
   
	@Autowired
	private MypageDAO mypageDAO;
	
	@Autowired // 의존성 주입(DI)
	private PageInfo pInfo;

	// 비밀번호 확인 Service 구현
	   @Transactional(rollbackFor = Exception.class)   
	   @Override
	   public int checkPwd(Member loginMember) {
	      String savePwd = mypageDAO.checkPwd(loginMember.getMemberNo());
	      
	      int result = 1;
	      
	      if(savePwd != null) {
	         if(bcPwd.matches(loginMember.getMemberPwd(), savePwd)) {
	            result=0;
	         } else { //임시 비밀번호 발급받은 사람일때
	            
	            if (loginMember.getMemberPwd().equals(savePwd)) {
	               
	               result=0;
	            } 
	            
	         }
	      }
	         return result;
	   }

	// 회원정보 수정 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateInfo(Member upMember) {
		return mypageDAO.updateInfo(upMember);
	}
	
	// 회원 탈퇴 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteInfo(int memberNo) {
		return mypageDAO.deleteInfo(memberNo);
	}

	// 고객센터 페이징 처리를 위한 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public PageInfo qnaPage(int cp) {
		int listNCount = mypageDAO.getListQCount();
		
		pInfo.setPageInfo(cp, listNCount);

		return pInfo;
	}

	// 페이징바에 따라 고객센터 게시글 조회 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public List<Help> selectQList(PageInfo pInfo) {
		return mypageDAO.selectQList(pInfo);
	}
	
	// 공지사항 페이징바 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public PageInfo noticePage(int cp) {
		int listNCount = mypageDAO.getListNCount();
		
		pInfo.setPageInfo(cp, listNCount);

		return pInfo;
	}

	// 페이징바에 따라 공지사항 조회 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public List<Board> selectNList(PageInfo pInfo) {
		return mypageDAO.selectNList(pInfo);
	}

	// 멤버 조회 페이징 처리를 위한 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public PageInfo memberPage(int cp) {
		int listMCount = mypageDAO.getListMCount();
		
		pInfo.setPageInfo(cp, listMCount);
		
		return pInfo;
	}

	// 페이징바에 따라 멤버 조회 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public List<Member> selectMList(PageInfo pInfo) {
		return mypageDAO.selectMList(pInfo);
		
	}

	// 내가 쓴 글 페이징 처리를 위한 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public PageInfo boardPage(int cp, int memberNo) {
		int listBCount = mypageDAO.getListBCount(memberNo);
		
		pInfo.setPageInfo(cp, listBCount);
		
		return pInfo;
	}

	// 페이징바에 따라 내가 쓴 게시글 조회 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public List<Board> selectBList(PageInfo pInfo, int memberNo) {
		return mypageDAO.selectBList(pInfo, memberNo);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public PageInfo replyPage(int cp, int memberNo) {
		int listRCount = mypageDAO.getListRCount(memberNo);
		
		pInfo.setPageInfo(cp, listRCount);
		
		return pInfo;

	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public List<Reply> selectRList(PageInfo pInfo, int memberNo) {
		
		return mypageDAO.selectRList(pInfo, memberNo);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int reportCount() {
		return mypageDAO.reportCount();
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int qnaCount() {
		return mypageDAO.qnaCount();
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int roomCount() {
		return mypageDAO.roomCount();
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int memberCount() {
		return mypageDAO.memberCount();
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public PageInfo reportPage(int cp) {
		int listDCount = mypageDAO.getListDCount();
		
		pInfo.setPageInfo(cp, listDCount);

		return pInfo;
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public List<Board> selectDList(PageInfo pInfo) {
		return mypageDAO.selectDList(pInfo);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public List<RoomMember> selectRoomMemberList(int memberNo) {
		return mypageDAO.selectRoomMemberList(memberNo);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public PageInfo roomPage(int cp, List<RoomMember> roomMemberList) {
		
		int listRoomCount = mypageDAO.getListRoomCount(roomMemberList);
		
		pInfo.setPageInfo(cp, listRoomCount);

		return pInfo;
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public List<Room> selectRoomList(PageInfo pInfo, List<RoomMember> roomMemberList) {
		return mypageDAO.selectRoomList(pInfo, roomMemberList);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteNotice(int boardNo) {
		return mypageDAO.deleteNotice(boardNo);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public Board noticeView(int boardNo) {
		return mypageDAO.noticeView(boardNo);
	}

	// 공지사항 작성 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int noticeWrite(Board board) {
		
		int boardNo = mypageDAO.selectBoardNo();
		
		if(boardNo>0) {
			board.setQnaContent(replaceParameter(board.getQnaContent()));
			board.setQnaNo(boardNo);
		}
		
		return mypageDAO.noticeWrite(board);
	}
	
	// 크로스 사이트 스크립트 방지 메소드
	private String replaceParameter(String param) {
        String result = param;
        if(param != null) {
            result = result.replaceAll("&", "&amp;");
            result = result.replaceAll("<", "&lt;");
            result = result.replaceAll(">", "&gt;");
            result = result.replaceAll("\"", "&quot;");
        }

        return result;
    }
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int restoreReport(int boardNo) {
		return mypageDAO.restoreReport(boardNo);
	}

	// 신고받은 게시글 작성자 찾기 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public List<ReportMember> findMember(int memberNo) {
		return mypageDAO.findMember(memberNo);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertMember(ReportMember member) {
		return mypageDAO.insertMember(member);
	}
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateReport(ReportMember member) {
		return mypageDAO.updateReport(member);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int restoreMember(int memberNo) {
		return mypageDAO.restoreMember(memberNo);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateNotice(Board notice) {
		return mypageDAO.updateNotice(notice);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public Help helpView(int boardNo) {
		return mypageDAO.helpView(boardNo);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertAnswer(HelpAnswer helpAnswer) {
		int result = mypageDAO.updateHelp(helpAnswer.getParentHelpNo());
		
		int result2=0;
		if(result > 0) {
			result2 = mypageDAO.insertAnswer(helpAnswer);			
		}
		
		return result2;
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public HelpAnswer selectAnswer(int boardNo) {
		return mypageDAO.selectAnswer(boardNo);
	}

	// 메인 공지사항 조회
	@Transactional(rollbackFor = Exception.class)
	@Override
	public List<Board> mainNoticeList() {
		return  mypageDAO.mainNoticeList();
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public PageInfo roomReportPage(int cp) {
		int listRoomBoardCount = mypageDAO.getListReportRoomCount();
		
		pInfo.setPageInfo(cp, listRoomBoardCount);

		return pInfo;
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public List<RoomBoard> selectRoomReportList(PageInfo roomPInfo) {
		return mypageDAO.selectRoomReportList(roomPInfo);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteRoomReport(RoomBoard board) {
		return mypageDAO.deleteRoomReport(board);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int restorReportRoom(RoomBoard board) {
		return mypageDAO.restorReportRoom(board);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public Board boardView(int boardNo) {
		return mypageDAO.boardView(boardNo);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public List<Board> myReportBoard(String writer) {
		return mypageDAO.myReportBoard(writer);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public PageInfo roomBoardPage(int cp, int memberNo) {
		int roomBoardCount = mypageDAO.getListroomBoardCount(memberNo);
		
		pInfo.setPageInfo(cp, roomBoardCount);

		return pInfo;
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public List<RoomBoard> selectRoomBoardList(PageInfo roomPInfo, int memberNo) {
		return mypageDAO.selectRoomBoardList(roomPInfo, memberNo);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public RoomBoard selectBoard(RoomBoard board) {
		return mypageDAO.selectBoard(board);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int reportCount2() {
		return mypageDAO.reportCount2();
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public RoomBoard roomBoard(RoomBoard board) {
		return mypageDAO.roomBoard(board);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int reportInfo(int memberNo) {
		return mypageDAO.reportInfo(memberNo);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public PageInfo myRoomReplyPage(int cp, int memberNo) {
		int listRoomReplyCount = mypageDAO.getListRoomReplyRoomCount(memberNo);
		
		pInfo.setPageInfo(cp, listRoomReplyCount);

		return pInfo;
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public List<RoomBoardReply> selectRoomReplyList(PageInfo pInfo, int memberNo) {
		return mypageDAO.selectRoomReplyList(pInfo, memberNo);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int findRoomNo(int i) {
		return mypageDAO.findRoomNo(pInfo, i);
	}
}
