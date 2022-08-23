package com.kh.admin.login.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.admin.login.service.AdminLoginService;
import com.kh.admin.login.vo.AdminVo;

@WebServlet (urlPatterns = "/admin/login")
public class AdminLoginController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/admin/login/adminLogin.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//req.getSession().setAttribute("FunctionName", "대시보드");
		
		
		String adminId = req.getParameter("adminId");
		String adminPwd = req.getParameter("adminPwd");
		
		AdminVo vo = new AdminVo();
		vo.setId(adminId);
		vo.setPwd(adminPwd);
		
		AdminVo loginAdmin = new AdminLoginService().login(vo);
		
		if(loginAdmin != null) {
			HttpSession session = req.getSession();
			session.setAttribute("alertMsg", "로그인에 성공하였습니다.");
			session.setAttribute("loginAdmin", loginAdmin);
			resp.sendRedirect("/semiPrj00/admin/main");
		} else {
			//로그인 실패
			//로그인 페이지에 errorMsg 출력
			HttpSession session = req.getSession();
			session.setAttribute("errorMsg", "로그인에 실패하였습니다.");
			resp.sendRedirect("/semiPrj00/admin/login");
		}
		
		
		
		
	}
}
