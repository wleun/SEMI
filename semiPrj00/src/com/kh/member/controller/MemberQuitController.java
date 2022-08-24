package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.service.MemberService;
import com.kh.member.vo.MemberVo;

@WebServlet(urlPatterns = "/member/quit")
public class MemberQuitController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberVo loginMember = (MemberVo)req.getSession().getAttribute("loginMember");
		
		String no = loginMember.getNo();
		String pwd = loginMember.getPwd();
		String pwd1 = req.getParameter("pwd");
		
		int result = new MemberService().quit(no,pwd,pwd1);
		
		//결과 보여주기
		if(result == 1) {
			//탈퇴성공
			req.getSession().invalidate();
			req.getSession().setAttribute("alertMsg", "회원탈퇴가 완료되었습니다.");
			resp.sendRedirect(req.getContextPath());
		}else {
			//탈퇴 실패
			System.out.println("탈퇴실패");
			req.getSession().setAttribute("alertMsg", "다시 시도해주세요.");
			req.getRequestDispatcher("/WEB-INF/views/member/memberMyPage.jsp").forward(req, resp);
		}
	
	}
}
