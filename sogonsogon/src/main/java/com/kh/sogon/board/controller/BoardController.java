package com.kh.sogon.board.controller;

import java.util.Arrays;
import java.util.List;

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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.sogon.board.model.service.BoardService;
import com.kh.sogon.board.model.vo.Attachment;
import com.kh.sogon.board.model.vo.Board;
import com.kh.sogon.board.model.vo.PageInfo;
import com.kh.sogon.board.model.vo.Search;
import com.kh.sogon.member.model.vo.Member;

@SessionAttributes({"loginMember"})
@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	
	@Autowired
	private BoardService boardService;

	// 게시판 전체 조회
	   @RequestMapping("boardList")
		public String boardList(@RequestParam(value="cp", required=false, defaultValue = "1") int cp, Model model) {
			
			PageInfo pInfo = boardService.pagination(cp);
			
			
			List<Board> boardList = boardService.selectList(pInfo);
			
			if(!boardList.isEmpty()) { 
				List<Attachment> thList = boardService.selectThumbnailList(boardList);
				
			/*for(Attachment at : thList) {
					System.out.println(at);
				}*/
				model.addAttribute("thList", thList);
				}
			model.addAttribute("boardList" ,boardList);
			model.addAttribute("pInfo", pInfo);
		
			return "board/boardList";
		}
	   
	// 게시글 상세 조회
		@RequestMapping("{qnaNo}")
		public String boarView(@PathVariable int qnaNo,Model model , RedirectAttributes rdAttr, HttpServletRequest request) {
			Board board = boardService.selectBoard(qnaNo);
			
			String url = null;
			if(board != null) { 
		/*		List<Attachment> files = boardService.selectFiles(qnaNo);
				
				if(!files.isEmpty()) {
					model.addAttribute("files",files);
				}*/
				
				model.addAttribute("board", board);
				url = "board/boardView";
			}else {
				
				rdAttr.addFlashAttribute("status", "error");
				rdAttr.addFlashAttribute("msg", "해당 게시글이 존재하지 않습니다.");
				url = "redirect:/board/list/" ;
				
			}
			return url;
		}
		
		@RequestMapping("boardWrite")
		public String boardWriteForm() {
			return "board/boardWrite";
		}
		
		//게시글 등록
		@RequestMapping(value="board/insertAction", method = RequestMethod.POST)
		public String insertAction(Board board,
								Model model,RedirectAttributes rdAttr,
							@RequestParam(value="images",required=false) List<MultipartFile>images,
							HttpServletRequest request) {
										
			Member loginMember = (Member)model.getAttribute("loginMember");
			
			board.setQnaWriter(loginMember.getMemberNo() + "");
			
		
			String savePath = request.getSession().getServletContext().getRealPath("resources/uploadImages");
			
			int result = boardService.insertBoard(board,images,savePath);
			
			String url = null;
			
			if(result > 0) {
				rdAttr.addFlashAttribute("status", "success");
				rdAttr.addFlashAttribute("msg", "게시물이 등록되었습니다.");
			url = "../board/boardList" +  "/"  + "?cp=1";
				
			}else {
				rdAttr.addFlashAttribute("status", "error");
				rdAttr.addFlashAttribute("msg", "게시물 등록에 실패하였습니다..");
				url=request.getHeader("referer");
				
			}
			
			return "redirect:"+url;
		}
		
	
		
		
		//게시글 수정
		@RequestMapping("{qnaNo}/update")
		public ModelAndView updateView(@PathVariable int qnaNo, ModelAndView mv) {
			
			
			// 기존 게시글 정보를 얻어와 update화면에 출력해 이전 작성 내용을 보여주어야 함.
			
			Board board = boardService.selectBoard(qnaNo);
			
			// -------------------------------------------------------------
			// 기존 게시글 이미지 조회 및 전달
			if(board != null) {
				List<Attachment> files = boardService.selectFiles(qnaNo);
				mv.addObject("files", files);
			}
			
			
			mv.addObject("board", board);
			
			mv.setViewName("board/boardUpdate");
			
			
			return mv;
			
		}
		
		  //게시글 삭제
		  @RequestMapping("{qnaNo}/delete")
	      public String deleteHelp(@PathVariable int qnaNo, RedirectAttributes rdAttr, HttpServletRequest request) {
	         
		
			  
	         int result = boardService.deleteBoard(qnaNo);
	         
	         String url = null;
	         String msg = null;
	         String status = null;
	         
	         if(result > 0) {

	            status = "success";
	            msg = "게시글 삭제 완료";
	             url = "/board/boardList";
	         } else {

	            status = "error";
	            msg = "게시글 삭제 실패";
	            url = request.getHeader("referer");
	         }
	         rdAttr.addFlashAttribute("status", status);
	          rdAttr.addFlashAttribute("msg", msg);
	          
	         return "redirect:" + url;
	      }
		
		
		// 게시글 수정
		// "updateAction?cp=${param.cp}"
		@RequestMapping("updateAction/{qnaNo}")
		public ModelAndView updateAction(@PathVariable int qnaNo,
										 ModelAndView mv,
										 Board upBoard, boolean[] deleteImages,
										 RedirectAttributes rdAttr,
										 HttpServletRequest request,
										 @RequestParam(value="thumbnail", required = false) MultipartFile thumbnail,
										 @RequestParam(value="images", required =false) List<MultipartFile> images) {
			
			System.out.println("deleteImages : " + Arrays.toString(deleteImages));
			System.out.println("tt");
			System.out.println(upBoard +"yyy");
			upBoard.setQnaNo(qnaNo);
			
			
		
			String savePath = request.getSession().getServletContext().getRealPath("resources/uploadImages");
			
			int result = boardService.updateBoard(upBoard, savePath, images, deleteImages);
			
			String status = null;
			String msg = null;
			String url = null;
			
			
			if(result > 0) {
				
				status = "success";
				msg = "수정되었습니다.";
				url = "../" +qnaNo;
				
				
				
			}else {
				status = "error";
				msg = "게시글 수정 실패";
				url = request.getHeader("referer");
				
				
				
			}
			
			
			mv.setViewName("redirect:" +url);
			rdAttr.addFlashAttribute("status", status);
			rdAttr.addFlashAttribute("msg", msg);
			
			
			
			
			return mv;
			
		}
		
		//게시글 검색
		@RequestMapping("search")
		public String search(@RequestParam(value="cp", required = false, defaultValue = "1") int cp, Search search,
								Model model) {
			
			PageInfo pInfo = boardService.pagination(cp, search);
			
			List<Board> boardList = boardService.selectSerchList(pInfo, search);
			for(Board b : boardList) {
				System.out.println(b);
			}
		
		
			model.addAttribute("boardList", boardList);
			model.addAttribute("pInfo", pInfo);
			return "board/boardList";
		}
		
		// 메인 자유게시판 조회
		@ResponseBody
		@RequestMapping("mainBoardList")
		public String mainBoardList() {
			List<Board> boardList = boardService.mainBoardList();
			
			Gson gson = new Gson();
			return gson.toJson(boardList);
		}
		
	

		// 게시글 좋아요
		@ResponseBody
		@RequestMapping("qnaBoardLike")
		public String qnaBoardLike(int qnaNo, int memberNo) {
			System.out.println(qnaNo);
			System.out.println("sjadjdhsk");
			int result = boardService.qnaBoardLike(qnaNo, memberNo);
			return result + "";
		}
		
		// 게시글 좋아요 갯수
		@ResponseBody
		@RequestMapping("qnaLikeCount")
		public String qnaLikeCount(int qnaNo) {
			int result = boardService.qnaLikeCount(qnaNo);
			return result + "";
		}
		
		// 게시글 좋아요 사용자 체크 여부
		@ResponseBody
		@RequestMapping("qnaLikeUserChk")
		public String qnaLikeUserChk(int qnaNo, int memberNo) {
			int result = boardService.qnaLikeUserChk(qnaNo, memberNo);
			return result + "";
		}
		
	
		
		  
}
