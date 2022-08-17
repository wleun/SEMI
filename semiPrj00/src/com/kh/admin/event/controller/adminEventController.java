package com.kh.admin.event.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/admin/event")
public class adminEventController extends HttpServlet {
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	req.setAttribute("functionName", "이벤트 관리");
	req.getRequestDispatcher("/WEB-INF/views/admin/event/adminEventView.jsp").forward(req, resp);
}
}
