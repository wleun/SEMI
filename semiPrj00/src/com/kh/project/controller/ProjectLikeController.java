package com.kh.project.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.project.service.ProjectLikeService;

@WebServlet(urlPatterns = "/project/like")
public class ProjectLikeController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String flag = req.getParameter("flag");
		ProjectLikeService service = new ProjectLikeService();
		
		int likeCancel = 0;
		int like = 0;
		
		switch(flag) {
		case "1" : like = service.projectLike(); 
			resp.getWriter().write(like); 
			System.out.println("좋아요");
		case "2" : likeCancel = service.projectLikeCancel(); 
			resp.getWriter().write(likeCancel); 
			System.out.println("좋아요 취소");
		}
			
		
		
	}//servlet
	
}
