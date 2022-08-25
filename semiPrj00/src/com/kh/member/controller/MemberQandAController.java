package com.kh.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.qanda.service.MemberQandAService;
import com.kh.member.qanda.vo.MypageAdetailVo;
import com.kh.member.qanda.vo.MypageQdetailVo;
import com.kh.member.vo.MemberVo;

@WebServlet(urlPatterns = "/member/qanda")
public class MemberQandAController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String no = ((MemberVo)req.getSession().getAttribute("loginMember")).getNo();

		List<MypageQdetailVo> qVoList = new MemberQandAService().selectQList(no);
		List<MypageAdetailVo> aVoList = new MemberQandAService().selectAList(no);
		
		req.setAttribute("aVoList", aVoList);
		req.setAttribute("qVoList", qVoList);
		req.getRequestDispatcher("/WEB-INF/views/member/memberQandAPage.jsp").forward(req, resp);
		
	}
	
}
