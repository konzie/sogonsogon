package com.kh.sogon.roomboard.model.service;

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

import com.kh.sogon.roomboard.model.dao.RoomBoardDAO;
import com.kh.sogon.roomboard.model.vo.RoomBoard;
import com.kh.sogon.roomboard.model.vo.RoomBoardAttachment;
import com.kh.sogon.roomboard.model.vo.RoomBoardPageInfo;
import com.kh.sogon.roomboard.model.vo.RoomBoardSearch;

@Service
public class RoomBoardServiceImpl implements RoomBoardService {

	@Autowired
	private RoomBoardDAO roomBoardDAO;

	@Autowired // 의존성 주입(DI)
	private RoomBoardPageInfo pInfo;

	// 방안의 게시판 Select Service 구현
	@Override
	public List<RoomBoard> roomBoardSelectList(RoomBoardPageInfo pInfo) {
		return roomBoardDAO.roomBoardSelectList(pInfo);
	}

	// 페이징 처리를 위한 Service 구현
	@Override
	public RoomBoardPageInfo pagination(int roomNo, int cp) {
		// 1) 전체 게시글 수 조회
		int listCount = roomBoardDAO.getListCount(roomNo);

		// 2) setPageInfo 호출
		pInfo.setPageInfo(cp, listCount, roomNo);

		return pInfo;
	}

	// 게시글 삭제 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteBoard(int boardNo) {
		int result = roomBoardDAO.deleteBoard(boardNo);

		return result;
	}

	// 게시글 상세 정보 조회 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public RoomBoard selectBoard(int boardNo) {

		RoomBoard board = roomBoardDAO.selectBoard(boardNo);
		// 조회 성공 시 조회 수 증가
		if (board != null) {
			int result = roomBoardDAO.increaseCount(boardNo);

			// 조회된 게시글(board)의 조회 수를 1증가 시킴(DB와 일치)
			if (result > 0) {
				board.setRoomBoardReadCount(board.getRoomBoardReadCount() + 1);
			}
		}
		return board;
	}

	// 게시글 작성 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertBoard(RoomBoard board, List<MultipartFile> images, String savePath) {

		int result = 0;

		// 1) 다음 SEQ_BNO를 얻어옴.
		int boardNo = roomBoardDAO.selectNextNo();

		if (boardNo > 0) { // 다음 번호를 정상적으로 얻어 왔을 떄
			// 다음 번호 boad 객체에 셋팅
			board.setRoomBoardNo(boardNo);

			// 크로스 사이트 스크립트 방지 처리
			board.setRoomBoardContent(replaceParameter(board.getRoomBoardContent()));

			// 2) 게시글(board) DB 삽입
			result = roomBoardDAO.insertBoard(board);

			// 3) 파일정보 DB 저장
			List<RoomBoardAttachment> files = new ArrayList<RoomBoardAttachment>();

			RoomBoardAttachment at = null;

			String filePath = "/resources/uploadImages";
			for (int i = 0; i < images.size(); i++) {
				if (!images.get(i).getOriginalFilename().equals("")) {
					// 업로드된 이미지가 있다면

					// 파일명 변경 (cos.jar는 별도의 RenamePolicy가 존재하지만 스프링은 없음)
					// -> 별도의 메소드를 제작하여 변경하기
					String changeName = rename(images.get(i).getOriginalFilename());

					// Attachment 객체 생성
					at = new RoomBoardAttachment(boardNo, images.get(i).getOriginalFilename(), changeName, filePath, i);

					result = roomBoardDAO.insertAttachment(at);
				}
				files.add(at);
			}

			// 4) 파일을 서버에 저장
			if (result > 0) {
				for (int i = 0; i < images.size(); i++) {
					if (!images.get(i).getOriginalFilename().equals("")) {
						// 이미지 업로드가 되었다면

						// transferTo(경로) : 지정한 경로에 업로드된 바이트상태의 파일을 실제 파일로 변환해서 저장해라
						try {
							images.get(i).transferTo(new File(savePath + "/" + files.get(i).getFileChangeName()));
						} catch (Exception e) {
							e.printStackTrace();

							// 서버에 파일 저장 중 문제가 발생할 경우
							// 이미 DB에 삽입되어 있는 파일정보를 삭제하는 DAO를 호출
							roomBoardDAO.deleteAttachment(boardNo);
						}
					}
				}
			}
		}
		return result;
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
    
    // 파일명 변경
    public String rename(String originFileName) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
        String date = sdf.format(new java.util.Date(System.currentTimeMillis()));

        int ranNum = (int)(Math.random()*100000); // 5자리 랜덤 숫자 생성

        String str = "" + String.format("%05d", ranNum);
        //String.format : 문자열을 지정된 패턴의 형식으로 변경하는 메소드
        // %05d : 오른쪽 정렬된 십진 정수(d) 5자리(5)형태로 변경. 빈자리는 0으로 채움(0)

        String ext = originFileName.substring(originFileName.lastIndexOf("."));

        return date + "" + str + ext;
    }

 // 게시글 이미지 조회 구현 Service
	@Override
	public List<RoomBoardAttachment> selectFiles(int boardNo) {
		return roomBoardDAO.selectFiles(boardNo);
	}

	// 게시글 썸네일 목록 조회 Service 구현
	@Override
	public List<RoomBoardAttachment> selectThumbnailList(List<RoomBoard> rbList) {
		return roomBoardDAO.selectThumbnailList(rbList);
	}

	// 게시글 수정 구현 Service
    @Transactional(rollbackFor = Exception.class)
	@Override
	public int updateBoard(RoomBoard upBoard, String savePath, List<MultipartFile> images, boolean[] deleteImages) {
  	// images : 수정된 파일 리스트
    	
    	upBoard.setRoomBoardContent(replaceParameter(upBoard.getRoomBoardContent()));
		int result = roomBoardDAO.updateBoard(upBoard); // 게시글만 수정
		
		if(result > 0) {
			// 1) 이전 업로드 파일 목록 조회
			List<RoomBoardAttachment> oldFiles = roomBoardDAO.selectFiles(upBoard.getRoomBoardNo());
			
			// DB에 저장할 웹상에서의 이미지 접근 경로
			String filePath = "/resources/uploadImages";
			
			List<RoomBoardAttachment> files = new ArrayList<RoomBoardAttachment>(); // 파일 정보를 모아 놓을 List
			List<RoomBoardAttachment> removeFiles = new ArrayList<RoomBoardAttachment>(); // 서버측 파일 제거 List
			RoomBoardAttachment at = null; // 임시로 사용할 참조 변수
			for (int i = 0; i < images.size(); i++) {
				if(!images.get(i).getOriginalFilename().equals("")) {
					// 현재 접근중인 images 요소의 실제 파일명이 빈 문자열이 아닐 경우
					// == 수정된 이미지가 업로드된 경우
					
					// 파일명 변경(rename 작업)
					String changeFileName = rename(images.get(i).getOriginalFilename());
					
					// 수정된 이미지 파일 정보를 저장할 Attachment 객체 생성
					at = new RoomBoardAttachment(upBoard.getRoomBoardNo(), images.get(i).getOriginalFilename(), changeFileName, filePath, i);
					
					// 기존 이미지가 존재하는 경우 -> update
					// 기존 이미지가 존재하지 않는 경우 -> insert
					
					boolean flag = false; // 기존 이미지가 존재하는 경우 true, 아니면 false;
					for (RoomBoardAttachment old : oldFiles) {
						if(old.getFileLevel() == i) {
							// 현재 접근한 이전 파일의 레벨이
							// 새롭게 업로드된 (수정된) 파일의 레벨과 같을 경우
							// == 이전 파일이 새로운 파일로 수정이 된 경우
							
							flag = true;
							removeFiles.add(old); // 서버 파일 제거 List에 수정 예정인 이전 파일 정보를 저장
							
							at.setFileNo(old.getFileNo());
							// 이전 파일의 번호를 얻어와
							// DB상에서 데이터 수정할 수 있게
							// 새로운 파일에 번호 세팅
							break;
						}
					}
					
					if(flag) {
						// update
						result = roomBoardDAO.updateAttachment(at);
					} else {
						// insert
						result = roomBoardDAO.insertAttachment(at);
					}
				} else { // if end
					// 업로드(수정)된 이미지가 없을 경우
					if(deleteImages[i]) { // 삭제 버튼이 눌러진 인덱스인 경우
						for (RoomBoardAttachment old : oldFiles) {
							// 이전 이미지 파일 목록에 반복 접근하여
							// 삭제 버튼이 눌러진 인덱스(== 파일레벨)와
							// 이전 이미지 중 가은 파일레벨을 가지고 있는 DB 정보를 삭제
							if(old.getFileLevel() == i) {
								result = roomBoardDAO.deleteAttachment2(old.getFileNo());
								
								// 서버측 파일 삭제 목록에 해당 파일 정보를 추가
								removeFiles.add(old);
							}
							
						}
					}
				}
				files.add(at);
			} // for end
			
			// 수정된 이미지를 서버에 저장
			if(result > 0) {
				for (int i = 0; i < images.size(); i++) {
					if(!images.get(i).getOriginalFilename().equals("")) {
						try {
							// transferTo() : 지정된 경로에 업로드된 파일 정보를 실제 파일로 변환
							images.get(i).transferTo(new File(savePath + "/" + files.get(i).getFileChangeName()));
						} catch (Exception e) {
							// 서버에 파일 저장 중 오류 발생 시
							// -> DB에 있는 파일 정보도 삭제
							roomBoardDAO.deleteAttachment(upBoard.getRoomBoardNo());
						}
					}
				}
			}
			
			// 제거 목록에 있는 파일 삭제
			for (RoomBoardAttachment removeFile : removeFiles) {
				File rm = new File(savePath + "/" + removeFile.getFileChangeName());
				rm.delete(); // 파일 삭제
			}
			
		}
		return result;
	}

    // 검색 조건이 추가된 페이징 처리 Service 구현
	@Override
	public RoomBoardPageInfo pagination(int roomNo, int cp, RoomBoardSearch roomBoardSearch) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", roomBoardSearch);
		map.put("roomNo", roomNo);
		
		int searchListCount = roomBoardDAO.getSearchListCount(map);
		
		// 2) setPageInfo 호출
		pInfo.setPageInfo(cp, searchListCount, roomNo);
		
		return pInfo;
	}

	// 검색 목록 service 구현
	@Override
	public List<RoomBoard> roomBoardSelectSearchList(RoomBoardPageInfo pInfo, RoomBoardSearch roomBoardSearch) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", roomBoardSearch);
		map.put("type", pInfo.getBoardType());
		
		return roomBoardDAO.selectSearchList(pInfo, map);
	}

	// 게시글 좋아요 서비스 구현
	@Transactional(rollbackFor = Exception.class)	
	@Override
	public int boardLike(int roomBoardNo, int memberNo) {

		int result = 0;
		// 좋아요 체크
		int chkResult = roomBoardDAO.boardLikeChk(roomBoardNo, memberNo);
		
		if(chkResult > 0) {
			// 체크가 되어있다면 삭제
			result = roomBoardDAO.boardLikeDelete(roomBoardNo, memberNo);
		} else {
			// 체크가 안되어있다면 추가
			result = roomBoardDAO.boardLikeAdd(roomBoardNo, memberNo);
		}
		
		return chkResult;
	}

	// 게시글 좋아요 갯수 서비스 구현
	@Override
	public int boardLikeCount(int roomBoardNo) {
		int result = roomBoardDAO.boardLikeCount(roomBoardNo);
		return result;
	}

	// 게시글 사용자 좋아요 여부 서비스 구현
	@Override
	public int boardLikeUserChk(int roomBoardNo, int memberNo) {
		int result = roomBoardDAO.boardLikeChk(roomBoardNo, memberNo);
		return result;
	}

	// 게시글 신고 서비스 구현
	@Override
	public int reportBoard(int boardNo) {
		return roomBoardDAO.reportBoard(boardNo);
	}

	// 게시글 작성 시 방장 확인용 서비스 구현
	@Override
	public int boardChiefNo(int roomNo) {
		return roomBoardDAO.boardChiefNo(roomNo);
	}
	
	
}
