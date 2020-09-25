package com.kh.sogon.help.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.sogon.help.model.dao.AnswerDAO;
import com.kh.sogon.help.model.vo.Answer;

@Service
public class AnswerServiceImpl implements AnswerService{
	
	@Autowired
	private AnswerDAO answerDAO;
	
	//문의글 조회 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public Answer selectAnswer(int helpNo) {
		return answerDAO.selectAnswer(helpNo);
	}

	//문의글 삽입 Service 구현
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int insertAnswer(Answer answer) {
		
		int result = answerDAO.updateHelp(answer.getParentHelpNo());
		
		int upResult = 0;
		
		if(result>0) {
			//크로스사이트스크립트 방지 처리
			answer.setAnswerContent(replaceParameter(answer.getAnswerContent()));
			
			upResult = answerDAO.insertAnswer(answer);
		}
		return upResult;
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
