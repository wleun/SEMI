package com.kh.admin.cotroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/admin/noticeDetail")
public class adminNoticeDetailView extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("functionName", "공지사항 상세조회");
		req.getRequestDispatcher("/WEB-INF/views/admin/adminNoticeDetailView.jsp").forward(req, resp);
	}
}