package com.kh.admin.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/admin/memberManage")
public class adminMemberManageController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setAttribute("functionName", "회원관리");
		req.getRequestDispatcher("/WEB-INF/views/admin/member/adminMemberManageView.jsp").forward(req, resp);
	}
}
