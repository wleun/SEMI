package com.kh.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.service.MemberMyfollowService;
import com.kh.member.vo.MemberMyfollowVo;
import com.kh.member.vo.MemberVo;

@WebServlet(urlPatterns = "/member/myfollow")
public class MemberMyfollowController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String no = ((MemberVo)req.getSession().getAttribute("loginMember")).getNo();
		
		List<MemberMyfollowVo> fVoList = new MemberMyfollowService().selectFollow(no);
		
		req.setAttribute("fVoList", fVoList);
		req.getRequestDispatcher("/WEB-INF/views/member/memberFollowPage.jsp").forward(req, resp);
		
	}
	
}
