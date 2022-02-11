package com.my.page.dao;

import java.util.List;

import com.my.page.VO.PagingVO;
import com.my.page.VO.ProjectVO;
import com.my.page.VO.SkillVO;

public interface ProjectDao {

	List<SkillVO> skillList();

	String listCnt(PagingVO pagingVO);

	List<ProjectVO> list(PagingVO pagingVO);

	int insert(ProjectVO projectVO);

	int update(ProjectVO projectVO);

	ProjectVO GetProject(String pbIdx);

	int delete(String[] checkList);

}
