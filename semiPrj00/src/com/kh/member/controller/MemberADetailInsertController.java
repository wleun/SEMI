package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.qanda.service.MemberADetailInsertService;
import com.kh.member.qanda.vo.MypageAdetailVo;

@WebServlet(urlPatterns = "/member/adetailinsert")
public class MemberADetailInsertController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String qNo = req.getParameter("qnum");
		
		
		req.setAttribute("qNo", qNo);
		req.getRequestDispatcher("/WEB-INF/views/member/memberADetailInsert.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String qNo = req.getParameter("qNo");
		String title= req.getParameter("title");
		String content = req.getParameter("content");
		
		MypageAdetailVo vo = new MypageAdetailVo();
		vo.setMakerQuestionNo(qNo);
		vo.setTitle(title);
		vo.setContent(content);
		System.out.println(vo);
		int result = new MemberADetailInsertService().qInsert(vo);
		
		if(result == 1) {
			req.getSession().setAttribute("alertMsg", "답변하기 성공!");
			resp.sendRedirect("/semiPrj00/member/qanda");
		}else {
			req.getRequestDispatcher("/").forward(req, resp);
		}
		
		
	}
	
	
}
