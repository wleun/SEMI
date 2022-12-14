package com.kh.main.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.main.service.MainPageService;
import com.kh.project.vo.ProjectVo;

@WebServlet(urlPatterns ="/main.do")
public class MainPageContorller extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//리스트 목록 가져오기 추천 / 신규 / 마감임박
		List<ProjectVo> recommendList = new MainPageService().selectRecommend();
		List<ProjectVo> earlyList = new MainPageService().selectEarly();
		List<ProjectVo> deadlineList = new MainPageService().selectDeadline();
		

		req.setAttribute("recommendList", recommendList);
		req.setAttribute("earlyList", earlyList);
		req.setAttribute("deadlineList", deadlineList);
		
		req.getRequestDispatcher("/index.jsp").forward(req, resp);
	}

}
