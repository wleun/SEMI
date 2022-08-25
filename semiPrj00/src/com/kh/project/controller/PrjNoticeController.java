package com.kh.project.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.project.notice.vo.ProjectNoticeVo;
import com.kh.project.service.PrjNoticeService;

@WebServlet(urlPatterns = "/project/notice")
public class PrjNoticeController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setCharacterEncoding("UTF-8");
		
		System.out.println("노티스서블릿 실행됨");
		String memberNo = req.getParameter("memberNo");
		String projectNo = req.getParameter("projectNo");
		String content = req.getParameter("content");
		System.out.println("현재 회원번호 :"+memberNo);
		System.out.println("현재 플젝번호 :"+projectNo);
		System.out.println("글 내용 :"+content);
		
		ProjectNoticeVo nvo = new ProjectNoticeVo();
		nvo.setMemberNo(memberNo);
		nvo.setProjectNo(projectNo);
		nvo.setContent(content);
		
		int result = new PrjNoticeService().insertNotice(nvo);
		if(result == -1){
			
		}
		resp.getWriter().print(result);
	}
	
}
