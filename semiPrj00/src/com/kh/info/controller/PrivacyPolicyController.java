package com.kh.info.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//개인정보 처리방침 페이지
@WebServlet(urlPatterns = "/info/privacypolicy")
public class PrivacyPolicyController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/information/privacyPolicy.jsp").forward(req, resp);
	}
}
