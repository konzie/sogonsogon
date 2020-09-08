package com.kh.sogon.mypage.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.sogon.board.model.vo.Board;
import com.kh.sogon.member.model.vo.Member;
import com.kh.sogon.board.model.vo.PageInfo;
import com.kh.sogon.mypage.model.dao.MypageDAO;

@Service
public class MypageServiceImpl implements MypageService{
	
	@Autowired
	private MypageDAO mypageDAO;
	
	@Autowired // 의존성 주입(DI)
	private PageInfo pInfo;
	   
	// 비밀번호 확인 Service 구현
	@Transactional(rollbackFor = Exception.class)	
	@Override
	public String checkPwd(Member loginMember) {
		return mypageDAO.checkPwd(loginMember);
	}

	// 회원정보 수정 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateInfo(Member loginMember, String newPwd1) {
		return mypageDAO.updateInfo(loginMember, newPwd1);
	}

	// 회원 탈퇴 Service 구현
	@Override
	public int deleteInfo(int memberNo) {
		return mypageDAO.deleteInfo(memberNo);
	}

	// 페이징바 Service 구현
	@Override
	public PageInfo pagination(int cp) {
		int listNCount = mypageDAO.getListNCount();
		
		pInfo.setPageInfo(cp, listNCount);

		return pInfo;
	}

	// 페이징바에 따라 공지사항 조회 Service 구현
	@Override
	public List<Board> selectNList(PageInfo pInfo) {
		return mypageDAO.selectNList(pInfo);
	}

	// 멤버 조회 페이징 처리를 위한 Service 구현
	@Override
	public PageInfo memberPage(int cp) {
		int listMCount = mypageDAO.getListMCount();
		
		pInfo.setPageInfo(cp, listMCount);
		
		return pInfo;
	}

	// 페이징바에 따라 멤버 조회 Service 구현
	@Override
	public List<Member> selectMList(PageInfo pInfo) {
		return mypageDAO.selectMList(pInfo);
		
	}
 
	// 회원 정보 수정 Service
	@Override
	public int updateMember(Member upMember) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	

}
