package com.kh.project.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.vo.MemberVo;
import com.kh.project.service.ProjectLikeService;

@WebServlet(urlPatterns = "/project/like")
public class ProjectLikeController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String flag = req.getParameter("flag");
		String memberNo = req.getParameter("memberNo");
		String projectNo = req.getParameter("projectNo");
		
		ProjectLikeService service = new ProjectLikeService();
		
		int checkResult = 0;
		int likeCancel = 0;
		int likeResult = 0;
		
		System.out.println("ajax에서 가져온 flag 번호:"+flag);
		System.out.println("ajax에서 가져온 멤버 번호:"+memberNo);
		System.out.println("ajax에서 가져온 플젝 번호:"+projectNo);
		
		switch(flag) {
		case "1" : checkResult = service.projectLikeCheck(memberNo, projectNo); 
			System.out.println("checkResult 값:"+ checkResult);
			switch(checkResult) {
			case 1 : likeResult = service.projectLikeUpdate(memberNo, projectNo);
				resp.getWriter().write(likeResult);
				break;
			case 2 : likeResult = service.projectLikeInsert(memberNo, projectNo);
				resp.getWriter().write(likeResult);
				break;
			default : System.out.println("좋아요 실패");
			System.out.println("============================");
			}
			System.out.println("likeResult값:"+likeResult);
			System.out.println("좋아요 됨");
			System.out.println("============================");
			break;
		case "2" : likeCancel = service.projectLikeCancel(memberNo, projectNo); 
			resp.getWriter().write(likeCancel); 
			System.out.println("좋아요 취소됨");
			System.out.println("============================");
			break;
		}
			
		
		
	}//servlet
	
}
