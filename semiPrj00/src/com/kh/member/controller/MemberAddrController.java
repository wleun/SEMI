package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.addr.vo.AddrVo;

@WebServlet(urlPatterns = "/member/addrRegister")
public class MemberAddrController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/WEB-INF/views/member/addrRegisterForm.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String name = req.getParameter("name");
		String phone = req.getParameter("phone");
		String postNum = req.getParameter("postNum");
		String addr1 = req.getParameter("addr1");
		String addr2 = req.getParameter("addr2");
		
		AddrVo addrVo = new AddrVo();
		addrVo.setName(name);
		
		resp.sendRedirect(req.getContextPath() + "/member/mypage");
	}

}
