package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.service.MemberPaymentService;
import com.kh.member.vo.MemberVo;
import com.kh.member.vo.PaymentVo;

@WebServlet(urlPatterns = "/member/paymentRegister")
public class MemberPaymentController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		MemberVo loginMember = (MemberVo)req.getSession().getAttribute("loginMember");
		
		if(loginMember != null) {
			req.getRequestDispatcher("/WEB-INF/views/member/paymentRegisterForm.jsp").forward(req, resp);
		}else {
			req.getSession().setAttribute("alertMsg", "로그인 후 이용가능합니다.");
			resp.sendRedirect(req.getContextPath());
		}
	}//doget
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		MemberVo memberVo = (MemberVo) req.getSession().getAttribute("loginMember");
		
		String memberNo = memberVo.getNo();
		String cardNo = req.getParameter("cardNo");
		String validTerm = req.getParameter("validTerm");//yyyy-mm
		String cardPwd = req.getParameter("cardPwd");
		String password = req.getParameter("password");
		String birthDate = req.getParameter("birthDate");//yyyy-mm-dd
		String firmNum = req.getParameter("firmNum");
		String defaultYN = req.getParameter("default");
		
		//하이픈 제거
		validTerm = validTerm.replace("-", "");
		validTerm = validTerm.substring(2);
		birthDate = birthDate.replace("-", "");
		
		//vo 작업
		PaymentVo paymentVo = new PaymentVo();
		paymentVo.setMemberNo(memberNo);
		paymentVo.setCardNum(cardNo);
		paymentVo.setValidDate(validTerm);
		paymentVo.setCardPwd(cardPwd);
		paymentVo.setPassword(password);
		paymentVo.setBirth(birthDate);
		paymentVo.setRegistration(firmNum);
		paymentVo.setDefaultYN(defaultYN);
		
		//서비스 호출
		int update = 0;
		if(defaultYN != null) {
			update = new MemberPaymentService().updatePayment(memberNo);
		}
		
		int result = new MemberPaymentService().insertPayment(paymentVo);
		
		//결과에 따른 화면선택
		if(result == 1 && update != -1) {
			req.getSession().setAttribute("alertMsg", "성공적으로 등록되었습니다.");
			resp.sendRedirect(req.getContextPath() + "/member/mypage");
		}else {
			System.out.println("error result ::: " + result);
			req.getSession().setAttribute("errorMsg", "등록에 실패하였습니다.");
			resp.sendRedirect(req.getContextPath() + "/member/mypage");
		}
		
	}//dopost

}
