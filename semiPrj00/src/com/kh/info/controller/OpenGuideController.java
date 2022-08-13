package com.kh.info.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//프로젝트 오픈 가이드 페이지 보여주기
@WebServlet(urlPatterns = "/info/openguide")
public class OpenGuideController extends HttpServlet{
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			req.getRequestDispatcher("/WEB-INF/views/information/projectOpenGuide.jsp").forward(req, resp);
		}
}
