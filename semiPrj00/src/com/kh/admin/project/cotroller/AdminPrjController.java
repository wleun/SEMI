package com.kh.admin.project.cotroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/admin/prj")
public class AdminPrjController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setAttribute("functionName", "프로젝트 관리");
		req.getRequestDispatcher("/WEB-INF/views/admin/project/adminPrjView.jsp").forward(req, resp);
	}
}
