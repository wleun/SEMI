package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.qanda.service.MypageAdetailService;
import com.kh.member.qanda.vo.MypageAdetailVo;
import com.kh.member.vo.MemberVo;

@WebServlet(urlPatterns = "/member/adetail")
public class MemberADetailController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/WEB-INF/views/member/memberADetailPage.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		String no = req.getParameter("no");
		String makerQuestionNo = req.getParameter("makerQuestionNo");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		MemberVo vo = (MemberVo)req.getSession().getAttribute("loginMember");
		
		MypageAdetailVo avo = new MypageAdetailVo();
		avo.setNo(no);
		avo.setMakerQuestionNo(makerQuestionNo);
		avo.setTitle(title);
		avo.setContent(content);
		
		int result = new MypageAdetailService().insertAdetail(avo, vo);
		
	}
	
}
