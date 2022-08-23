package com.kh.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.member.service.MemberService;

@WebServlet(urlPatterns = "/idCheck")
public class IdCheckController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String userId = req.getParameter("userId");
		System.out.println(userId);
		PrintWriter out = resp.getWriter();
		
		int result = 0;
		result = new MemberService().idCheck(userId);
		
		if(result == 0) {
			System.out.println("사용가능 아이디");
		}else if(result ==1){
			System.out.println("사용불가 닉네임");
		}
		
		resp.setCharacterEncoding("UTF-8");
		
		out.write(result + "");
		
	
	}
	
}
