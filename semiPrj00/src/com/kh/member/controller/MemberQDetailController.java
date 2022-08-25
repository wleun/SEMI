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
		String makerNo = req.getParameter("mnum");
//		String makerNo = "1"; //임시번호
		//jsp에 세팅해주고 그거 다시 받아올거 -> post 로
		req.setAttribute("makerNo", makerNo);
		req.getRequestDispatcher("/WEB-INF/views/member/memberQDetailPage.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		//내 회원번호
		String memberNo = req.getParameter("memberNo");
		String makerNo = req.getParameter("makerNo");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		MypageQdetailVo vo = new MypageQdetailVo();
		vo.setMemberNo(memberNo);
		vo.setTitle(title);
		vo.setContent(content);
		vo.setMakerNo(makerNo);
		
		int result = new MypageQdetailService().insertQdetail(vo);
		if(result == 1) {
			req.getSession().setAttribute("alertMsg", "문의하기 성공!");
			resp.sendRedirect("/semiPrj00/member/qanda");
		}else {
			req.getRequestDispatcher("/").forward(req, resp);
		}
		
	}
	
}
