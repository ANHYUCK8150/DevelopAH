package com.my.page.dao;

import java.util.List;

import com.my.page.VO.BoardVO;
import com.my.page.VO.PagingVO;

public interface BoardDao {

	String listCnt(PagingVO pagingVO);

	List<BoardVO> list(PagingVO pagingVO);

}
