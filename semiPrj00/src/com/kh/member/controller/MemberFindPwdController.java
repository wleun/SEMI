package com.kh.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.service.MemberService;

@WebServlet(urlPatterns = "/member/findPwd")
public class MemberFindPwdController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String email = req.getParameter("memberEmail");
		String phone = req.getParameter("memberPhone");
		PrintWriter out = resp.getWriter();
		
		int result = new MemberService().findPwd(email,phone);
		
		if(result == 1) {
			System.out.println("정보확인 완료");
		}else {
			System.out.println("일치하는 정보가 없습니다.");
		}
		
		resp.setCharacterEncoding("UTF-8");
		
		out.write(result + "");
	
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String email = req.getParameter("memberEmail");
		String phone = req.getParameter("memberPhone");
		String pwd = req.getParameter("memberNewPwd");
		String pwd2 = req.getParameter("memberNewPwd2");
		
		System.out.println("정보받기 완료");
		int result = new MemberService().updatePwd(email, phone, pwd, pwd2);
		
		if(result == 1) {
			System.out.println("비밀번호변경성공");
			req.setAttribute("alertMsg","비밀번호 변경 완료!");
			req.getRequestDispatcher("/WEB-INF/views/member/findIdPwd.jsp").forward(req, resp);
		}else {
			System.out.println("비밀번호 변경 실패");
			req.setAttribute("alertMsg", "비밀번호를 다시 확인해주세요.");
			req.getRequestDispatcher("/WEB-INF/views/member/findIdPwd.jsp").forward(req, resp);
		}
	}
}
