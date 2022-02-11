package com.my.page.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.my.page.VO.BoardVO;
import com.my.page.VO.PagingVO;
import com.my.page.dao.BoardDao;
import com.my.page.service.BoardService;

@Repository("boardService")
public class BoardServiceImpl implements BoardService {
	@Resource(name="boardDao")
	private BoardDao boardDao;

	@Override
	public String listCnt(PagingVO pagingVO) {
		return boardDao.listCnt(pagingVO);
	}

	@Override
	public List<BoardVO> list(PagingVO pagingVO) {
		return boardDao.list(pagingVO);
	}
}
