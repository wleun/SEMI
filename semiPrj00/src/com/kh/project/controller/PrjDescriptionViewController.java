package com.kh.project.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.project.service.ProjectLikeService;
import com.kh.project.vo.ProjectVo;

@WebServlet(urlPatterns = "/project/view")
public class PrjDescriptionViewController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		ProjectVo projectVo = new ProjectVo();
		req.setAttribute("pvo", projectVo);
		
		new ProjectLikeService().projectLikeCheck(null, null);
		
		req.getRequestDispatcher("/WEB-INF/views/project/projectDescriptionView.jsp").forward(req, resp);
	
	}
	
}
