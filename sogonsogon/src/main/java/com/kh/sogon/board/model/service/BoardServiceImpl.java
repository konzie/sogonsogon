package com.kh.sogon.board.model.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.sogon.board.model.dao.BoardDAO;
import com.kh.sogon.board.model.vo.Attachment;
import com.kh.sogon.board.model.vo.Board;
import com.kh.sogon.board.model.vo.PageInfo;
import com.kh.sogon.board.model.vo.Search;


@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDAO boardDAO;

	@Autowired// 의존성 주입 (DI)
	private PageInfo pInfo;
	
	
	// 페이징 처리를 위한 Service 구현
	@Override
	public PageInfo pagination(int boardType, int cp) {
	
		
		// 1) 전체 게시글 수 조회
		int listCount = boardDAO.getListCount(boardType);
		
		// 2) setPageInfo
		pInfo.setPageInfo(cp, listCount, boardType);
		
		
		
		
		return pInfo;
	}
	

	

	//게시글 목록 조회 Service 구현
	@Override
	public List<Board> selectList(PageInfo pInfo) {
		
		
		
		return boardDAO.selectList(pInfo);
	}

	
	// 게시글 상세조회 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public Board selectBoard(int boardNo) {
		
		// 게시글 조회
		Board board = boardDAO.selectBoard(boardNo);
		
		
	
		
		
		
		return board;
	}




	@Override
	public int insertBoard(Board board, List<MultipartFile> images, String savePath) {
		// TODO Auto-generated method stub
		return 0;
	}




	@Override
	public int deleteBoard(Board board) {
		// TODO Auto-generated method stub
		return 0;
	}




	@Override
	public int updateBoard(Board upBoard, String savePath, List<MultipartFile> images, boolean[] deleteImages) {
		// TODO Auto-generated method stub
		return 0;
	}




	@Override
	public List<Attachment> selectFiles(int boardNo) {
		// TODO Auto-generated method stub
		return null;
	}




	@Override
	public List<Attachment> selectThumbnailList(List<Board> boardList) {
		// TODO Auto-generated method stub
		return null;
	}




	@Override
	public List<Board> selectTopViews(int type) {
		// TODO Auto-generated method stub
		return null;
	}




	@Override
	public PageInfo pagination(int type, int cp, Search search) {
		// TODO Auto-generated method stub
		return null;
	}




	@Override
	public List<Board> selectSerchList(PageInfo pInfo, Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	
	
	



}