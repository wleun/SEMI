package com.kh.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.coupon.vo.CouponVo;
import com.kh.member.service.MemberMycouponService;
import com.kh.member.vo.MemberVo;

@WebServlet(urlPatterns = "/member/mycoupon")
public class MemberMycouponController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String no = ((MemberVo)req.getSession().getAttribute("loginMember")).getNo();
		
		List<CouponVo> cVoList = new MemberMycouponService().selectCoupon(no);
		
		req.setAttribute("cVoList", cVoList);
		req.getRequestDispatcher("/WEB-INF/views/member/memberMyCoupon.jsp").forward(req, resp);
		
	}
	
}
