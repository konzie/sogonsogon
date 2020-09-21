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
	
	
	/** 고객센터 전체 게시글 수 조회 DAO
	 * @param type
	 * @return allCount
	 */
	public int getAllCount() {
		return sqlSession.selectOne("helpMapper.getAllCount");
	}

	/** 문의글 목록 조회 DAO
	 * @param hInfo
	 * @return helpList
	 */
	public List<Help> selectList(HelpPageInfo hInfo) {
		
		int offset = (hInfo.getCurrentPage() - 1) * hInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, hInfo.getLimit());
		
		return sqlSession.selectList("helpMapper.selectList", 0 ,rowBounds);
	}

	/** 문의글 자세히 DAO
	 * @param boardNo
	 * @return
	 */
	public Help selectView(int boardNo) {
		return sqlSession.selectOne("helpMapper.selectView", boardNo);
	}
	
	
	
	/** 문의글 다음 번호 가져오기
	 * @return helpNo
	 */ 
	public int selectNextNo() {
		return sqlSession.selectOne("helpMapper.selectNextNo");
	}
	
	
	/** 문의글 작성 DAO
	 * @param help
	 * @return result
	 */
	public int insertHelp(Help help) {
		return sqlSession.insert("helpMapper.insertHelp", help);
	}

	/** 문의글 삭제 DAO
	 * @param helpNo
	 * @return result
	 */
	public int deleteHelp(int helpNo) {
		return sqlSession.update("helpMapper.deleteHelp", helpNo);
	}

	/** 게시글 수정 DAO
	 * @param upHelp
	 * @return result
	 */
	public int updateHelp(Help upHelp) {
		return sqlSession.update("helpMapper.updateHelp",upHelp);
	}


}
