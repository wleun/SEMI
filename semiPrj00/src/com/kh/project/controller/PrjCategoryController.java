package com.kh.project.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.category.vo.CategoryVo;

@WebServlet(urlPatterns = "/project/category")
public class PrjCategoryController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String category = req.getParameter("category");
		String sort = req.getParameter("sort");
		
		CategoryVo selectedCategory = new PrjCategoryService().selectCategory(category,sort);
		
		req.setAttribute("categoryVo", selectedCategory);
		req.getRequestDispatcher("/WEB-INF/views/project/categoryForm.jsp").forward(req, resp);
		
	}

}
