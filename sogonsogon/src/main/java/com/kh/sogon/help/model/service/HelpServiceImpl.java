package com.kh.sogon.help.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sogon.help.model.dao.HelpDAO;
import com.kh.sogon.help.model.vo.HelpPageInfo;

@Service
public class HelpServiceImpl implements HelpService{
	
	@Autowired // DAO 의존성 주입
	private HelpDAO helpDAO;
	
	@Autowired //페이징 의존성 주입
	private HelpPageInfo HInfo;

}
