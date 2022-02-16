package com.my.page.service;

import java.util.List;
import java.util.Map;

import com.my.page.VO.BoardReplyVO;
import com.my.page.VO.BoardVO;
import com.my.page.VO.PagingVO;

public interface BoardService {

	String listCnt(PagingVO pagingVO);

	List<BoardVO> list(PagingVO pagingVO);

	int insert(Map<String, Object> params);

	BoardVO listOne(String qbIdx);

	List<BoardReplyVO> childList(String qbIdx);

	String boardPWchk(Map<String, Object> map);

	int update(Map<String, Object> params);

}
