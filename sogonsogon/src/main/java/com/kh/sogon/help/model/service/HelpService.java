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
	public abstract HelpPageInfo pagination(int cp);

	/** 문의글 목록 Service
	 * @param hInfo
	 * @return helpList
	 */
	public abstract List<Help> selectList(HelpPageInfo hInfo);

	/** 문의글 자세히 Service
	 * @param boardNo
	 * @return help
	 */
	public abstract Help selectView(int boardNo);

}
