package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.service.MemberService;

@WebServlet(urlPatterns = "/member/emailCheck")
public class EmailCheckController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/member/emailCheck.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("checkEmail");
		
		int result = new MemberService().checkEmail(email);
		
		if(result == 1) {
			req.setAttribute("result1", "이미 사용 중인 이메일 입니다.");
			req.getRequestDispatcher("/WEB-INF/views/member/emailCheck.jsp").forward(req, resp);
		}else if(result == 2) {
			req.setAttribute("result1", "정지 된 계정입니다. 일정기간 이후 로그인해주세요.");
			req.getRequestDispatcher("/WEB-INF/views/member/emailCheck.jsp").forward(req, resp);
		}else if(result == 3) {
			req.setAttribute("result1", "탈퇴한 계정입니다.");
			req.getRequestDispatcher("/WEB-INF/views/member/emailCheck.jsp").forward(req, resp);
		}else {
			req.setAttribute("result", "사용 가능한 이메일입니다.");
			req.getRequestDispatcher("/WEB-INF/views/member/emailCheck.jsp").forward(req, resp);
		}
		
	}
}
