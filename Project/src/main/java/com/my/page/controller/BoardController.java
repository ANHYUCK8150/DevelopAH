package com.my.page.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.my.page.VO.BoardVO;
import com.my.page.VO.PagingVO;
import com.my.page.service.BoardService;

@Controller
public class BoardController {

	@Resource(name="boardService")
	private BoardService boardService;
	
	@RequestMapping("board/board.do")
	public String notice(Model model, @RequestParam(value="op", required=false)String op
			,@RequestParam(value="nowPage", required=false)String nowPage
		) {
		//변수 선언
		if(nowPage == null) {
			nowPage = "1";
		}
		
		PagingVO pagingVO = new PagingVO();
		String searchOption = "";
		String searchText = "";
		
		pagingVO.setSearchOption(searchOption);
		pagingVO.setSearchText(searchText);
		pagingVO.setBoardOption(op);
		
		//게시판 총 개수
		String listCnt = boardService.listCnt(pagingVO);
		
		//페이징 변수 선언
		pagingVO.PagingInit(Integer.parseInt(listCnt), Integer.parseInt(nowPage), Integer.parseInt("10"));
		
		//리스트
		List<BoardVO> list = boardService.list(pagingVO);
				
		if(op.equals("notice")) {
			//공지사항

		}else if(op.equals("qna")) {
			//질문과 답변

		}else {
			return "redirect:../error.do";
		}
		
		//모델
		model.addAttribute("title", op);
		model.addAttribute("BoradList", list);
		model.addAttribute("paging", pagingVO);
		model.addAttribute("ListCnt",listCnt);
		
		return "Board/list";
		
	}
	
}
