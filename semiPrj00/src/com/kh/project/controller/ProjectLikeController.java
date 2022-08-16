package com.kh.project.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.project.service.ProjectService;

@WebServlet(urlPatterns = "/project/like")
public class ProjectLikeController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String flag = req.getParameter("flag");
		ProjectService service = new ProjectService();
		
		switch(flag) {
		case "1" : service.projectLikeCancel();System.out.println("좋아요취소");
		case "2" : service.projectLike();System.out.println("좋아요");
		}
		
		
	}
	
}
