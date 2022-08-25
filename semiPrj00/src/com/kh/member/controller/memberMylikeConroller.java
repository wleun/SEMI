package com.kh.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.service.MemberMylikeService;
import com.kh.member.vo.MemberVo;
import com.kh.member.vo.ProjectLikeVo;

@WebServlet(urlPatterns = "/member/mylike")
public class memberMylikeConroller extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String no = ((MemberVo)req.getSession().getAttribute("loginMember")).getNo();
		
		List<ProjectLikeVo> plVoList = new MemberMylikeService().selectList(no);
		
		req.setAttribute("plVoList", plVoList);
		req.getRequestDispatcher("/WEB-INF/views/member/memberLikePage.jsp").forward(req, resp);
		
	}
	
}
