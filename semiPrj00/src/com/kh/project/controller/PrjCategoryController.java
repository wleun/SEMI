package com.kh.project.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.category.vo.CategoryVo;
import com.kh.common.vo.PageVo;
import com.kh.project.service.PrjCategoryService;
import com.kh.project.vo.ProjectVo;

@WebServlet(urlPatterns = "/project/category")
public class PrjCategoryController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String category = req.getParameter("category");
		String sort = req.getParameter("sort");
		
		/*
		 * 페이징 처리
		 */
		int listCount;			//현재 총 게시글 갯수
		int currentPage;		//현재 페이지(==사용자가 요청한 페이지)
		int pageLimit;			//페이지 하단에 보여질 페이지 버튼의 최대 갯수
		int boardLimit;			//한 페이지 내 보여질 게시글 최대 갯수
		//위의 4개를 이용해서 아래 3개 값 구하기
		int maxPage;			//가장 마지막 페이지(==총 페이지 수)
		int startPage;			//페이징바의 시작
		int endPage;			//페이징바의 끝
		
		listCount = new PrjCategoryService().listCount(category, sort);
		
		if(req.getParameter("p")==null) {
			currentPage = 1;
		}else {
			currentPage = Integer.parseInt(req.getParameter("p"));
		}
		pageLimit = 10;
		boardLimit = 20;
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		if(listCount==0) {
			maxPage = 1;
		}
		startPage = (currentPage-1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageVo pageVo = new PageVo();
		pageVo.setListCount(listCount);
		pageVo.setCurrentPage(currentPage);
		pageVo.setPageLimit(pageLimit);
		pageVo.setBoardLimit(boardLimit);
		pageVo.setMaxPage(maxPage);
		pageVo.setStartPage(startPage);
		pageVo.setEndPage(endPage);
		
		/*
		 * 프로젝트 내용과 카테고리 내용 받기
		 */
		List<ProjectVo> selectedProject = new PrjCategoryService().selectProject(category, sort, pageVo);
		CategoryVo selectedCategory = new PrjCategoryService().selectCategory(category);
		
		req.setAttribute("sort", sort);
		req.setAttribute("pageVo", pageVo);
		req.setAttribute("categoryVo", selectedCategory);
		req.setAttribute("prjList", selectedProject);
		req.getRequestDispatcher("/WEB-INF/views/project/categoryForm.jsp").forward(req, resp);
		
	}

}//class
