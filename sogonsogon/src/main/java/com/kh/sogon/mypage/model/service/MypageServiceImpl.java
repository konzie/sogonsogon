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

	@Override
	public int reportCount() {
		return mypageDAO.reportCount();
	}

	@Override
	public int qnaCount() {
		return mypageDAO.qnaCount();
	}

	@Override
	public int roomCount() {
		return mypageDAO.roomCount();
	}

	@Override
	public int memberCount() {
		return mypageDAO.memberCount();
	}

	@Override
	public PageInfo reportPage(int cp) {
		int listDCount = mypageDAO.getListDCount();
		
		pInfo.setPageInfo(cp, listDCount);

		return pInfo;
	}
	
	@Override
	public List<Board> selectDList(PageInfo pInfo) {
		return mypageDAO.selectDList(pInfo);
	}

 	

}
