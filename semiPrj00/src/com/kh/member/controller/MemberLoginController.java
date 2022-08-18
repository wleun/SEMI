package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.service.MemberService;
import com.kh.member.vo.MemberVo;

@WebServlet(urlPatterns = "/member/login")
public class MemberLoginController extends HttpServlet{
	/*
	 * 로그인 페이지 보여주기
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/WEB-INF/views/member/memberLogin.jsp").forward(req, resp);

	}
	
	/*
	 * 로그인하기
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//데이터 받기
		String email = req.getParameter("memberEmail");
		String pwd = req.getParameter("memberPwd");
		
		//다음 타자 전달
		MemberVo loginMember = new MemberService().login(email,pwd);
		
		//로그인결과 
		if(loginMember != null) {
			//세션에 loginMember 담아서 홈화면으로
			req.getSession().setAttribute("loginMember", loginMember);
			req.getSession().setAttribute("alertMsg", "로그인 성공!");
			resp.sendRedirect("/semi");
		}else {
			req.getSession().setAttribute("errorMsg", "회원정보가 일치하지않습니다.");
			resp.sendRedirect("/semi/member/login");
		}
		
		
	}
}
