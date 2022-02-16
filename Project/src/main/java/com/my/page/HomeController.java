package com.my.page;


import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.my.page.VO.BoardVO;
import com.my.page.VO.PagingVO;
import com.my.page.VO.ProjectVO;
import com.my.page.service.BoardService;
import com.my.page.service.ProjectService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Resource(name="ProService")
	private ProjectService proService;
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String root() {
		
		return "redirect:home.do";
	}
	
	@RequestMapping("home.do")
	public String home(Model model) {
		
		PagingVO pagingVO = new PagingVO();
		String[] selectSkill = {"ALL"};
		String[] selectWork = {"ALL"};
		String searchText = "";
		
		pagingVO.setSearchSkill(selectSkill);
		pagingVO.setSearchWork(selectWork);
		pagingVO.setSearchText(searchText);
		
		//프로젝트 리스트 총합
		//String listCnt = proService.listCnt(pagingVO);
		
		//페이징 변수 선언
		pagingVO.PagingInit(Integer.parseInt("99"), Integer.parseInt("1"), Integer.parseInt("99"));
		
		//리스트
		List<ProjectVO> list = proService.list(pagingVO);
		
		//model
		model.addAttribute("projectList", list);
		
		//페이징 변수 선언
		pagingVO.PagingInit(Integer.parseInt("99"), Integer.parseInt("1"), Integer.parseInt("6"));
		
		//리스트
		List<BoardVO> boardlist = boardService.list(pagingVO);
		model.addAttribute("BoradList", boardlist);
		
		return "/Home/home";
	}
	
	@RequestMapping("list.do")
	public String MainProjectList(Model model
			, @RequestParam(value="selectSkill[]", required=false)String[] selectSkill
		) {
		
		PagingVO pagingVO = new PagingVO();
		String[] selectWork = {"ALL"};
		String searchText = "";
		
		pagingVO.setSearchSkill(selectSkill);
		pagingVO.setSearchWork(selectWork);
		pagingVO.setSearchText(searchText);
		
		//프로젝트 리스트 총합
		String listCnt = proService.listCnt(pagingVO);
		
		//페이징 변수 선언
		pagingVO.PagingInit(Integer.parseInt(listCnt), Integer.parseInt("1"), Integer.parseInt("99"));
		
		//리스트
		List<ProjectVO> list = proService.list(pagingVO);
		
		//model
		model.addAttribute("projectList", list);
		
		return "/Home/ajax/home_list";
	}
	
	@RequestMapping("error.do")
	public String error() {
		return "Home/error/error/error";
	}
	
}
