package com.kh.sogon.help.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public HelpPageInfo pagination(int cp,int limit) {
		
		//고객센터 전체 게시글 수 조회
		int allCount = helpDAO.getAllCount();
		
		//vo.PageInfo 맨아래 setPageInfo 호출
		hInfo.setPageInfo(cp, allCount, limit);
		
		return hInfo;
	}

	//문의글 목록 Service 구현
	@Override
	public List<Help> selectList(HelpPageInfo hInfo) {
		return helpDAO.selectList(hInfo);
	}

	//문의글 자세히 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public Help selectView(int boardNo) {
		
		Help help = helpDAO.selectView(boardNo);
		
		return help;
	}

	
	//문의글 작성  Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertHelp(Help help) {
		
		int result = 0;
		
		int helpNo = helpDAO.selectNextNo();
		
		if(helpNo>0) {
			
			help.setHelpNo(helpNo);
			
			//크로스사이트스크립트 방지 처리
			help.setHelpContent(replaceParameter(help.getHelpContent()));
			
			//개행문자 처리 \n-> <br>
			help.setHelpContent(help.getHelpContent().replaceAll("\n", "<br>"));
			
			//삽입 
			result = helpDAO.insertHelp(help);
			
			
		}
		
		
		return result;
	}

    //문의글 삭제 Service 구현
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int deleteBoard(int helpNo) {
		
		int result = 0;
		
		result = helpDAO.deleteHelp(helpNo);
		
		return result;
	}
	
	// 문의글 수정 Service 구현
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int updateHelp(Help upHelp) {
		
		
		//크로스사이트스크립트 방지 처리
		upHelp.setHelpContent(replaceParameter(upHelp.getHelpContent()));
		
		//개행문자 처리 \n-> <br>
		upHelp.setHelpContent(upHelp.getHelpContent().replaceAll("\n", "<br>"));
		
		int result  = helpDAO.updateHelp(upHelp);
		
		return result;
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
	
}
