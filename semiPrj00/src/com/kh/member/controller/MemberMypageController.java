package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.memberMypage.vo.MemberMypageVo;

@WebServlet(urlPatterns = "/member/mypage")
public class MemberMypageController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MemberMypageVo loginMember = (MemberMypageVo)req.getSession().getAttribute("loginMember");
		
//		if(loginMember != null) {
			req.getRequestDispatcher("/WEB-INF/views/member/memberMyPage.jsp").forward(req, resp);
//		}else {
//			req.getSession().setAttribute("alertMsg", "로그인 후 접속이 가능합니다!");
//			resp.sendRedirect(req.getContextPath());
//		}
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		String email = req.getParameter("email");
		String name = 
		String nick
		String phone
		String type
		String mLevel
		String code
		
		
		
		
	}
	
}
