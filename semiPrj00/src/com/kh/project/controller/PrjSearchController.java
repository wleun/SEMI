package com.kh.project.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.category.vo.CategoryVo;

@WebServlet(urlPatterns = "/project/search")
public class PrjSearchController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String searching = req.getParameter("searching");
		String sort = req.getParameter("sort");
		
		CategoryVo selectedCategory = new PrjCategoryService().selectCategory(searching, sort);
		
		req.getRequestDispatcher("/WEB-INF/views/project/searchForm.jsp").forward(req, resp);
		
	}

}
