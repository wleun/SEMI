package com.kh.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.service.MemberService;

@WebServlet(urlPatterns = "/busiCheck")
public class BusiCheckController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String busino_ = req.getParameter("busino");
		System.out.println(busino_);
		PrintWriter out = resp.getWriter();
		
		int busino = Integer.parseInt(busino_);
		
		//서비스
		int result = new MemberService().busiCheck(busino);
		
		if(result==1) {
			//사용불가
			System.out.println("이미 사용중인 번호");
		}else {
			System.out.println("사용 가능한 번호");
		}
		
		resp.setCharacterEncoding("UTF-8");
		
		out.write(result+"");
		
	}

}
