package com.kh.sogon.help.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.sogon.help.model.vo.Help;
import com.kh.sogon.help.model.vo.HelpPageInfo;

@Repository
public class HelpDAO {

	@Autowired //sql 의존성 주입
	private SqlSessionTemplate sqlSession;
	
	//-------------------------------------------------
	
	
	/** 고객센터 전체 게시글 수 조회
	 * @param type
	 * @return allCount
	 */
	public int getAllCount() {
		return sqlSession.selectOne("helpMapper.getAllCount");
	}

	/** 문의글 목록 조회
	 * @param hInfo
	 * @return helpList
	 */
	public List<Help> selectList(HelpPageInfo hInfo) {
		
		int offset = (hInfo.getCurrentPage() - 1) *hInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, hInfo.getLimit());
		
		return sqlSession.selectList("helpMapper.selectList", rowBounds);
	}

}
