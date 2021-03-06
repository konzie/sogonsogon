package com.kh.sogon.roomboard.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.sogon.roomboard.model.dao.RoomBoardReplyDAO;
import com.kh.sogon.roomboard.model.vo.RoomBoardReply;

@Service
public class RoomBoardReplyServiceImpl implements RoomBoardReplyService {

	@Autowired
	private RoomBoardReplyDAO roomBoardReplyDAO;

	// 댓글 조회용 Service 구현
	@Override
	public List<RoomBoardReplyDAO> selectList(int boardNo) {
		return roomBoardReplyDAO.selectList(boardNo);
	}

	// 댓글 삽입용 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertReply(RoomBoardReply reply) {
		// 크로스 사이트 스크립팅 방지
		reply.setReplyContent(replaceParameter(reply.getReplyContent()));

		// 개행문자 처리 \n -> <br>
		reply.setReplyContent(reply.getReplyContent().replaceAll("\n", "<br>"));

		return roomBoardReplyDAO.insertReply(reply);
	}

	// 답글 삽입용 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertReply2(RoomBoardReply reply) {
		// 크로스 사이트 스크립팅 방지
		reply.setReplyContent(replaceParameter(reply.getReplyContent()));

		// 개행문자 처리 \n -> <br>
		reply.setReplyContent(reply.getReplyContent().replaceAll("\n", "<br>"));

		return roomBoardReplyDAO.insertReply2(reply);
	}

	// 댓글 수정 서비스 구현
	public int updateReply(RoomBoardReply reply) {
		// 크로스 사이트 스크립팅 방지
		reply.setReplyContent(replaceParameter(reply.getReplyContent()));

		// 개행문자 처리 \n -> <br>
		reply.setReplyContent(reply.getReplyContent().replaceAll("\n", "<br>"));

		return roomBoardReplyDAO.updateReply(reply);
	}
	
	// 댓글 삭제 서비스 구현
	@Override
	public int deleteReply(int replyNo) {
		return roomBoardReplyDAO.deleteReply(replyNo);
	}
	
	// 댓글 채택 구현 Service
	@Override
	public int adoptionReply(int replyNo, int memberNo, int roomBoardNo) {
		return roomBoardReplyDAO.adoptionReply(replyNo, memberNo, roomBoardNo);
	}

	// 크로스 사이트 스크립트 방지 메소드
	private String replaceParameter(String param) {
		String result = param;
		if (param != null) {
			result = result.replaceAll("&", "&amp;");
			result = result.replaceAll("<", "&lt;");
			result = result.replaceAll(">", "&gt;");
			result = result.replaceAll("\"", "&quot;");
		}

		return result;
	}

	// 댓글 채택된거 있는지 확인하는 Service 구현
	@Override
	public int adoptionReplyChk(int roomBoardNo) {
		return roomBoardReplyDAO.adoptionReplyChk(roomBoardNo);
	}



}
