package com.my.page.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.my.page.dao.BoardDao;
import com.my.page.service.BoardService;

@Repository("boardService")
public class BoardServiceImpl implements BoardService {
	@Resource(name="boardDao")
	private BoardDao boardDao;
}
