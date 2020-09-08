package com.kh.sogon.help.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sogon.help.model.dao.HelpDAO;
import com.kh.sogon.help.model.vo.Help;
import com.kh.sogon.help.model.vo.HelpPageInfo;

@Service
public class HelpServiceImpl implements HelpService{
	
	@Autowired // DAO 의존성 주입
	private HelpDAO helpDAO;
	
	@Autowired //페이징 의존성 주입
	private HelpPageInfo hInfo;

	
	//페이징 처리 Service 구현
	@Override
	public HelpPageInfo pagination(int cp) {
		
		//고객센터 전체 게시글 수 조회
		int allCount = helpDAO.getAllCount();
		System.out.println("전체 문의글 수 : "+allCount);
		
		//vo.PageInfo 맨아래 setPageInfo 호출
		hInfo.setPageInfo(cp, allCount);
		
		return hInfo;
	}

	//문의글 목록 Service 구현
	@Override
	public List<Help> selectList(HelpPageInfo hInfo) {
		return helpDAO.selectList(hInfo);
	}

}
