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
	 * @return Answer
	 */
	public Answer selectAnswer(int helpNo) {
		return sqlSession.selectOne("answerMapper.selectAnswer", helpNo);
	}

	/** 답변 여부 업데이트
	 * @param parentHelpNo
	 * @return upResult
	 */
	public int updateHelp(int helpNo) {
		return sqlSession.update("answerMapper.updateHelp", helpNo);
	}
	
	/** 답변 삽입
	 * @param answer
	 * @return result
	 */
	public int insertAnswer(Answer answer) {
		return sqlSession.insert("answerMapper.insertAnswer", answer);
	}


	
	


}
