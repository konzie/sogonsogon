package com.kh.sogon.help.model.service;

import java.util.List;

import com.kh.sogon.help.model.vo.Help;
import com.kh.sogon.help.model.vo.HelpPageInfo;

public interface HelpService {

	/** 페이징 처리 Service -> 현재페이지(1)가져옴
	 * @param type
	 * @param cp
	 * @return hInfo
	 */
	HelpPageInfo pagination(int cp);

	/** 문의글 목록 Service
	 * @param hInfo
	 * @return helpList
	 */
	List<Help> selectList(HelpPageInfo hInfo);

}
