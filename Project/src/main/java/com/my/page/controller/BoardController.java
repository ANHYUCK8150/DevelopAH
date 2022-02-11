package com.my.page.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.my.page.service.BoardService;

@Controller
public class BoardController {

	@Resource(name="boardService")
	private BoardService boardService;
	
	@RequestMapping("board/board.do")
	public String notice(Model model, @RequestParam(value="op", required=false)String op) {
		//변수 선언
		
		if(op.equals("notice")) {
			//공지사항

		}else if(op.equals("qna")) {
			//질문과 답변

		}else {
			return "redirect:../error.do";
		}
		
		//모델
		model.addAttribute("title", op);
		
		return "Board/list";
	}
	
}
