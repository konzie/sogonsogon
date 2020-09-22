package com.kh.sogon.help.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.sogon.help.model.vo.Answer;

@Repository
public class AnswerDAO {

	@Autowired //sql 의존성 주입
	private SqlSessionTemplate sqlSession;

	/** 문의글 조회 DAO
	 * @param helpNo
	 * @return answer
	 */
	public Answer selectAnswer(int helpNo) {
		return sqlSession.selectOne("answerMapper.selectAnswer");
	}

	
	


}
