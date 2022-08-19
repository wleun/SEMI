package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.service.MemberService;
import com.kh.member.vo.MemberVo;

@WebServlet(urlPatterns = "/member/join2")
public class MemberJoinController2 extends HttpServlet{
	/*
	 * 회원가입 두번째 페이지 보여주기
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/member/memberJoin2.jsp").forward(req, resp);
	}
	/*
	 * 회원가입 두번째 페이지 내용
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		//정보 얻기
		String memberEmail = req.getParameter("memberEmail");
		String memberPwd = req.getParameter("memberPwd");
//		String memberPwd2 = req.getParameter("memberPwd2");
		String memberName = req.getParameter("memberName");
		String memberNick = req.getParameter("memberNick");
		String memberPhone = req.getParameter("memberPhone");
		String code = req.getParameter("code");
		
		//데이터 뭉치기
		MemberVo memberVo = new MemberVo();
		memberVo.setEmail(memberEmail);
		memberVo.setPwd(memberPwd);
//		memberVo.setPwd2(memberPwd2);
		memberVo.setName(memberName);
		memberVo.setNick(memberNick);
		memberVo.setPhone(memberPhone);
		memberVo.setCode(code);
		
		if(code == null) {
			code = "";
		}
		
		//다음타자(메이커 추가정보등록)에 데이터 보내기
		req.setAttribute("memberVo", memberVo);
		req.getRequestDispatcher("/WEB-INF/views/member/memberJoin3.jsp").forward(req, resp);
		
	
	
	}
}
