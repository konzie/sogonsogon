package com.kh.sogon.help.model.service;

import com.kh.sogon.help.model.vo.Answer;

public interface AnswerService {

	/** 답변 조회 Service
	 * @param helpNo
	 * @return answer
	 */
	Answer selectAnswer(int helpNo);

	/** 답변 삽입 Service
	 * @param answer
	 * @return
	 */
	int insertAnswer(Answer answer);

}
