package com.kh.admin.event.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/admin/eventInstall")
public class adminEventInstallController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("functionName", "이벤트 작성");
		req.getRequestDispatcher("/WEB-INF/views/admin/event/adminEventInstall.jsp").forward(req, resp);
	}
}
