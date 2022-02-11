package com.my.page.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.my.page.VO.PagingVO;
import com.my.page.VO.ProjectVO;
import com.my.page.VO.SkillVO;
import com.my.page.dao.ProjectDao;
import com.my.page.service.ProjectService;

@Service("ProService")
public class ProjectServiceImpl implements ProjectService {
	@Resource(name = "ProDao")
	private ProjectDao ProDao;

	@Override
	public List<SkillVO> skillList() {
		return ProDao.skillList();
	}

	@Override
	public String listCnt(PagingVO pagingVO) {
		return ProDao.listCnt(pagingVO);
	}

	@Override
	public List<ProjectVO> list(PagingVO pagingVO) {
		return ProDao.list(pagingVO);
	}

	@Override
	public int insert(ProjectVO projectVO) {
		return ProDao.insert(projectVO);
	}

	@Override
	public int update(ProjectVO projectVO) {
		return ProDao.update(projectVO);
	}

	@Override
	public ProjectVO GetProject(String pbIdx) {
		return ProDao.GetProject(pbIdx);
	}

	@Override
	public int delete(String[] checkList) {
		return ProDao.delete(checkList);
	}
}
