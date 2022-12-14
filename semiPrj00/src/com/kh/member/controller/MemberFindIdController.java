package com.kh.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.service.MemberService;

@WebServlet(urlPatterns = "/member/findId")
public class MemberFindIdController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/member/findIdPwd.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String name = req.getParameter("memberName");
		String phone = req.getParameter("memberPhone");
		PrintWriter out = resp.getWriter();
		
		String result = new MemberService().findId(name, phone);
		
		if(result != null) {
			System.out.println(result);
		}else {
			System.out.println("일치하는 정보 없음");
		}
		
		resp.setCharacterEncoding("UTF-8");
		
		out.write(result + "");
	
	}
}
