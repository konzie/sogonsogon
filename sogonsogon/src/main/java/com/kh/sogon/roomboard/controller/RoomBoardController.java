package com.kh.sogon.roomboard.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.sogon.member.model.vo.Member;
import com.kh.sogon.roomboard.model.service.RoomBoardService;
import com.kh.sogon.roomboard.model.vo.RoomBoard;
import com.kh.sogon.roomboard.model.vo.RoomBoardPageInfo;

@SessionAttributes({"loginMember"})
@Controller
@RequestMapping("/roomBoard/*")
public class RoomBoardController {

	@Autowired
	private RoomBoardService roomBoardService;

	@ResponseBody
	@RequestMapping("boardList/{roomNo}")
	public String selectList(@PathVariable int roomNo,
			@RequestParam(value = "cp", required = false, defaultValue = "1") int cp) {

		RoomBoardPageInfo pInfo = roomBoardService.pagination(roomNo, cp);

		List<RoomBoard> rbList = roomBoardService.roomBoardSelectList(pInfo);

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("rbList", rbList);
		map.put("pInfo", pInfo);

		return gson.toJson(map);
	}

	@RequestMapping("{roomNo}/boardInsertView")
	public String boardInsertView() {
		return "/roomBoard/roomBoardInsert";
	}

	@RequestMapping("{roomNo}/{boardNo}")
	public String boardView(@PathVariable int roomNo, @PathVariable int boardNo, Model model, RedirectAttributes rdAttr,
			HttpServletRequest request) {

		RoomBoard board = roomBoardService.selectBoard(boardNo);

		String url = null;
		if (board != null) { // 게시글 조회 성공 시
			// DB에서 해당 글에 작성된 이미지 파일 모두 조회하기
//	    	  List<Attachment> files = roomBoardService.selectFiles(boardNo);
//	    	  
//	    	  if(!files.isEmpty()) {
//	    		  model.addAttribute("files", files);
//	    	  }

			model.addAttribute("board", board);
			url = "roomBoard/roomBoardView";
		} else {
			// 존재하지 않는 게시글 입니다 출력 후 이전 요청 주소로 리다이렉트
			rdAttr.addFlashAttribute("status", "error");
			rdAttr.addFlashAttribute("msg", "해당 게시글이 존재하지 않습니다.");
			/* url = "redirect:" + request.getHeader("referer"); */
			url = "redirect:/roomBoard/boardDetail/" + roomNo;
		}

		return url;
	}

	@RequestMapping(value = "{roomNo}/insertAction", method = RequestMethod.POST)
	public String insertAction(@PathVariable int roomNo, RoomBoard board, Model model, RedirectAttributes rdAttr,
			@RequestParam(value = "thumbnail", required = false) MultipartFile thumbnail,
			@RequestParam(value = "images", required = false) List<MultipartFile> images, HttpServletRequest request) {
		// 게시글 등록에 필요한 내용
		// 카테고리, 제목, 내용, 게시판 타입, 작성자(회원번호)
		// Session에서 회원 정보 얻어오기(@SessionAttributes 확인)
		Member loginMember = (Member)model.getAttribute("loginMember");
		System.out.println("로그인 값  : " + loginMember);

		// 타입, 회원번호 board에 세팅
		board.setRoomNo(roomNo);
		board.setRoomBoardWriter(loginMember.getMemberNo() + "");

		// 파일 업로드, 게시글 입력값 확인
//		System.out.println("썸네일 : " + thumbnail.getOriginalFilename());
//		for (int i = 0; i < images.size(); i++) {
//			System.out.println("images[" + i + "] : " + images.get(i).getOriginalFilename());
//		}

		System.out.println(board);

		// 썸 네일 이미지 정보를 images 리스트 제일 앞 추가
//		images.add(0, thumbnail);

		// 파일을 저장할 서버 컴퓨터의 로컬 경로
		String savePath = request.getSession().getServletContext().getRealPath("resources/uploadImages");

		// 게시글 작성 Service 호출
		int result = roomBoardService.insertBoard(board, images, savePath);

		String url = null;
		if (result > 0) {
			rdAttr.addFlashAttribute("status", "success");
			rdAttr.addFlashAttribute("msg", "게시글 작성 완료");
			url = "/roomBoard/" + board.getRoomNo() + "/" + board.getRoomBoardNo() + "?cp=1";
		} else {
			rdAttr.addFlashAttribute("status", "error");
			rdAttr.addFlashAttribute("msg", "게시글 작성 실패");
			url = "boardInsertView";
		}

		return "redirect:" + url;
	}

	@RequestMapping("{roomNo}/{boardNo}/delete")
	public String deleteBoard(@PathVariable int roomNo, @PathVariable int boardNo, RedirectAttributes rdAttr,
			HttpServletRequest request) {

		int result = roomBoardService.deleteBoard(boardNo);

		String url = null;
		String status = null;
		String msg = null;
		if (result > 0) {
			// 삭제 성공시 해당 게시판 목록 1페이지
			status = "success";
			msg = "게시글 삭제 완료";
			url = "/room/roomDetail/" + roomNo;
		} else {
			// 삭제 실패 시 이전 요청 주소(상세조회 페이지)
			status = "error";
			msg = "게시글 삭제 실패";
			url = request.getHeader("referer");
		}
		rdAttr.addFlashAttribute("status", status);
		rdAttr.addFlashAttribute("msg", msg);

		return "redirect:" + url;
	}

}
