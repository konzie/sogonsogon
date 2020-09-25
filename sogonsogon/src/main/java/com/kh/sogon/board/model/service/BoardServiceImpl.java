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
	public PageInfo pagination(int cp) {
	
		
		
		int listCount = boardDAO.getListCount();
		
		pInfo.setPageInfo(cp, listCount);
		
		
		
		
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
	public Board selectBoard(int qnaNo) {
		
		// 게시글 조회
		Board board = boardDAO.selectBoard(qnaNo);
		
		
	
		
		
		
		return board;
	}




	// 게시글 등록 Service 구현
		@Transactional(rollbackFor = Exception.class)
		@Override
		public int insertBoard(Board board, List<MultipartFile> images, String savePath) {
			
			int result = 0;
			
			
		
			int qnaNo = boardDAO.selectNextNo();
			
			
			if (qnaNo > 0) {
				board.setQnaNo(qnaNo);
				
				result = boardDAO.insertBoard(board);
				
		
			
			List<Attachment> files = new ArrayList<Attachment>();
			Attachment at = null;
			String filePath = "/resources/uploadImages";
			
			for(int i=0; i<images.size(); i++) {
				
				if(!images.get(i).getOriginalFilename().equals("")) {
					
					String changeName = rename(images.get(i).getOriginalFilename());
				
					at = new Attachment(qnaNo, 
							images.get(i).
							getOriginalFilename(), 
							changeName, 
							filePath, 
							i);
					
					
					result = boardDAO.insertAttachment(at);
			
					
				}
				files.add(at);
				
				
			}
				if(result > 0 ) {
					for(int i = 0; i<images.size(); i++) {
						
						if(!images.get(i).getOriginalFilename().equals("")) {
						
							try {
								images.get(i).transferTo(new File(savePath + "/" + files.get(i).getFileChangeName()));
							
								
							} catch (Exception e) {
								
								e.printStackTrace();
							
								boardDAO.deleteAttachment(qnaNo);
								
							}
							
						}
					}
				}
			
			}
			
			
			
			return result;
		}
		




		private String rename(String originalFilename) {
			 SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
		        String date = sdf.format(new java.util.Date(System.currentTimeMillis()));

		        int ranNum = (int)(Math.random()*100000); 

		        String str = "" + String.format("%05d", ranNum);
		       
		        String ext = originalFilename.substring(originalFilename.lastIndexOf("."));

		        return date + "" + str + ext;
		}




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

		



	@Override
	@Transactional(rollbackFor = Exception.class)
	public int deleteBoard(int qnaNo) {
		int result = 0;
		
		result = boardDAO.deleteBoard(qnaNo);
		
		return result;
	}


	// 게시글 수정 구현 Service
    @Transactional(rollbackFor = Exception.class)
	@Override
	public int updateBoard(Board upBoard, String savePath, List<MultipartFile> images, boolean[] deleteImages) {
  
    	
		int result = boardDAO.updateBoard(upBoard); 
		
	
			
		
		return result;
	}



	@Override
	public List<Attachment> selectFiles(int qnaNo) {
		return boardDAO.selectFiles(qnaNo);
	}





	@Override
	public PageInfo pagination(int cp, Search search) {
		
	
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		
		  int searchListCount = boardDAO.getSerchListCount(map);
		  
		  pInfo.setPageInfo(cp, searchListCount);
				return pInfo;
	}




	@Override
	public List<Board> selectSerchList(PageInfo pInfo, Search search) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		
		return boardDAO.selectSearchList(pInfo, map);
	}



	// 메인 화면 list 얻어오기
	@Override
	public List<Board> mainBoardList() {
		return boardDAO.mainBoardList();
	}



	// 게시글 좋아요 서비스 구현
		@Transactional(rollbackFor = Exception.class)	
		@Override
		public int qnaBoardLike(int qnaNo, int memberNo) {

			int result = 0;
		
			int chkResult = boardDAO.qnaLikeChk(qnaNo, memberNo);
			
			if(chkResult > 0) {
				
				result = boardDAO.qnaLikeDelete(qnaNo, memberNo);
			} else {
			
				result = boardDAO.qnaLikeAdd(qnaNo, memberNo);
			}
			
			return chkResult;
		}

		// 게시글 좋아요 갯수 서비스 구현
		@Override
		public int qnaLikeCount(int qnaNo) {
			int result = boardDAO.boardLikeCount(qnaNo);
			return result;
		}

		// 게시글 사용자 좋아요 여부 서비스 구현
		@Override
		public int qnaLikeUserChk(int qnaNo, int memberNo) {
			int result = boardDAO.qnaLikeChk(qnaNo, memberNo);
			return result;
		}
		

	
	
	

		@Override
		public int updateRcnt(int qnaNo) {
			
			int result = boardDAO.updateRcnt(qnaNo);
			return result;
		}
		
		
		// 게시글 신고 서비스 구현
		@Override
		public int reportBoard(int qnaNo) {
			return boardDAO.reportBoard(qnaNo);
		}

		//-----------------------------------------Summernote-----------------------------------------
				@Override
				public Map<String, String> insertImage(MultipartFile uploadFile, String savePath) {
					
					File folder = new File(savePath);
					
					
					if(!folder.exists())  folder.mkdir(); 
					Map<String, String> result = new HashMap<String, String>();
					
				
					String changeFileName = rename(uploadFile.getOriginalFilename());
							
					String filePath = "/resources/infoImages/";
					result.put("filePath", filePath);
					result.put("changeFileName", changeFileName);
					
					
				
					try {
						uploadFile.transferTo(new File(savePath + "/" + changeFileName));
					} catch (Exception e) {
						e.printStackTrace();
					}
					return result;
				}
				
			
				@Override
				public List<String> selectDbFileList() {
					return boardDAO.selectDbFileList();
				}
				
				//--------------------------------------------------------------------------------------------
				


}