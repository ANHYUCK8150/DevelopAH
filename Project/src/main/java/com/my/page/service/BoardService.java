package com.my.page.service;

import java.util.List;

import com.my.page.VO.BoardVO;
import com.my.page.VO.PagingVO;

public interface BoardService {

	String listCnt(PagingVO pagingVO);

	List<BoardVO> list(PagingVO pagingVO);

}
