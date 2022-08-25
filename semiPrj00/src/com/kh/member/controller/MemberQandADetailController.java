package com.kh.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.qanda.service.MemberQandADetailService;
import com.kh.member.qanda.vo.MypageAdetailVo;
import com.kh.member.qanda.vo.MypageQdetailVo;
import com.kh.member.vo.MemberVo;

@WebServlet(urlPatterns = "/member/qandadetail")
public class MemberQandADetailController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String no = ((MemberVo)req.getSession().getAttribute("loginMember")).getNo();
		String makerNo = "1";
		
		List<MypageQdetailVo> qVoList = new MemberQandADetailService().selectQdetailList(no, makerNo);
		List<MypageAdetailVo> aVoList = new MemberQandADetailService().selectAdetailList(no);
		
		req.setAttribute("makerNo", makerNo);
		req.setAttribute("aVoList", aVoList);
		req.setAttribute("qVoList", qVoList);
		req.getRequestDispatcher("/WEB-INF/views/member/memberQandADetailPage.jsp").forward(req, resp);
		
	}
	
}
