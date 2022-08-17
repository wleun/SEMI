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
		
		int likeCancel = 0;
		int like = 0;
		
		switch(flag) {
		case "1" : likeCancel = service.projectLikeCancel(); System.out.println("좋아요취소");
		case "2" : like = service.projectLike(); System.out.println("좋아요");
		}
			
		if((likeCancel == 1) || (like == 1)) {
			req.getRequestDispatcher("/project/view").forward(req, resp); System.out.println("성공");
		}else {
			req.getRequestDispatcher("/project/view").forward(req, resp);  System.out.println("뭔가 실패,,");
		}
		
	}//servlet
	
}
