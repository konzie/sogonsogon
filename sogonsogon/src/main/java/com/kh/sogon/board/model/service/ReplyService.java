package com.kh.sogon.board.model.service;

import java.util.List;

import com.kh.sogon.board.model.vo.Reply;

public interface ReplyService {

	List<Reply> selectList(int qnaNo);

	int insertReply(Reply reply);

	int insertReply2(Reply reply);

}
