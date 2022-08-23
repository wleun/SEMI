package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.qanda.service.MypageQdetailService;
import com.kh.member.qanda.vo.MypageQdetailVo;
import com.kh.member.vo.MemberVo;

@WebServlet(urlPatterns = "/member/qdetail")
public class MemberQDetailController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/WEB-INF/views/member/memberQDetailPage.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		String no = req.getParameter("no");
		String memberNo = req.getParameter("memberNo");
		String makerNo = req.getParameter("makerNo");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		MemberVo vo = (MemberVo)req.getSession().getAttribute("loginMember");
		
		MypageQdetailVo qvo = new MypageQdetailVo();
		qvo.setNo(no);
		qvo.setMemberNo(memberNo);
		qvo.setMakerNo(makerNo);
		qvo.setTitle(title);
		qvo.setContent(content);

		int result = new MypageQdetailService().insertQdetail(qvo, vo);
		
		if(result == 1) {
			req.getSession().setAttribute("alertMsg", "문의 등록 성공!");
			resp.sendRedirect("/member/qanda");
		}else {
			req.getRequestDispatcher("/semiPrj00").forward(req, resp);
		}
		
	}
	
}
