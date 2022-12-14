package com.kh.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.qanda.service.MypageAdetailService;
import com.kh.member.qanda.vo.MypageAdetailVo;
import com.kh.member.qanda.vo.MypageQdetailVo;
import com.kh.member.vo.MemberVo;

@WebServlet(urlPatterns = "/member/adetail")
public class MemberADetailController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String no = ((MemberVo)req.getSession().getAttribute("loginMember")).getNo();
		String makerNo = "1";
		
		List<MypageQdetailVo> qVoList = new MypageAdetailService().selectQdetailList(no, makerNo);
		
		req.setAttribute("makerNo", makerNo);
		req.setAttribute("qVoList", qVoList);
		req.getRequestDispatcher("/WEB-INF/views/member/memberADetailPage.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		String no = ((MemberVo)req.getSession().getAttribute("loginMember")).getNo();
		
		String makerQuestionNo = req.getParameter("makerQuestionNo");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		MypageAdetailVo vo = new MypageAdetailVo();
		vo.setMakerQuestionNo(makerQuestionNo);
		vo.setTitle(title);
		vo.setContent(content);
		
		int result = new MypageAdetailService().insertAdetail(vo, no);
		
		if(result == 1) {
			req.getSession().setAttribute("alertMsg", "답변하기 성공!");
			resp.sendRedirect("/semiPrj00/member/qanda");
		}else {
			req.getRequestDispatcher("/").forward(req, resp);
		}
		
	}
	
}
