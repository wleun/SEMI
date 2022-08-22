package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.service.MemberMypageService;
import com.kh.member.vo.MemberVo;

@WebServlet(urlPatterns = "/member/mypage")
public class MemberMypageController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MemberVo loginMember = (MemberVo)req.getSession().getAttribute("loginMember");
		
		if(loginMember != null) {
			req.getRequestDispatcher("/WEB-INF/views/member/memberMyPage.jsp").forward(req, resp);
		}else {
			req.getSession().setAttribute("alertMsg", "로그인 후 접속이 가능합니다!");
			resp.sendRedirect(req.getContextPath());
		}
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		String email = req.getParameter("memberEmail");
		String pwd = req.getParameter("memberPwd");
		String pwdNew = req.getParameter("memberPwdNew");
		String pwdNew2 = req.getParameter("memberPwdNew2");
		String name = req.getParameter("memberName");
		String nick = req.getParameter("memberNick");
		String phone = req.getParameter("memberPhone");
		String type = req.getParameter("memberType");
		String mLevel = req.getParameter("mLevel");
		
		
		String no = ((MemberVo)req.getSession().getAttribute("loginMember")).getNo();
		
		MemberVo vo = new MemberVo();
		vo.setNo(no);
		vo.setEmail(email);
		vo.setName(name);
		vo.setNick(nick);
		vo.setPhone(phone);
		
		//패스워드 변경 서비스 호출
		int result = new MemberMypageService().changePwd(pwd, pwdNew, pwdNew2);
		
		MemberVo updateVo = new MemberMypageService().edit(vo);
		
		if(updateVo != null) {
			req.getSession().setAttribute("loginMember", updateVo);
			req.getSession().setAttribute("alertMsg", "회원정보 수정 성공!");
			resp.sendRedirect("/semiPrj00/member/mypage");
		}else {
			req.getRequestDispatcher("").forward(req, resp);
		}
		
	}
	
}
