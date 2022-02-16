package com.my.page.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.my.page.VO.BoardReplyVO;
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

	@Override
	public int insert(Map<String,Object> params) {
		return boardDao.insert(params);
	}

	@Override
	public BoardVO listOne(String qbIdx) {
		return boardDao.listOne(qbIdx);
	}

	@Override
	public List<BoardReplyVO> childList(String qbIdx) {
		return boardDao.childList(qbIdx);
	}

	@Override
	public String boardPWchk(Map<String, Object> map) {
		return boardDao.boardPWchk(map);
	}

	@Override
	public int update(Map<String, Object> params) {
		return boardDao.update(params);
	}
}
