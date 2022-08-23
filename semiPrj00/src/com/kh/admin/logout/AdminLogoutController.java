package com.kh.admin.logout;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet (urlPatterns = "/admin/logout")
public class AdminLogoutController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getSession().invalidate();
		
		req.getSession().setAttribute("alertMsg", "로그아웃이 완료되었습니다.");
		resp.sendRedirect("/semiPrj00/admin/login");
	}
}
