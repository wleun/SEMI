package com.kh.project.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.addr.vo.AddrVo;
import com.kh.coupon.vo.CouponVo;
import com.kh.member.vo.MemberVo;
import com.kh.member.vo.PaymentVo;
import com.kh.project.service.PrjSupportService;
import com.kh.project.service.PrjViewService;
import com.kh.project.vo.ProjectVo;
import com.kh.project.vo.SupportVo;
import com.kh.reward.vo.ProjectRewardVo;

@WebServlet(urlPatterns = "/project/support")
public class PrjSupportController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		MemberVo loginMember = (MemberVo)req.getSession().getAttribute("loginMember");
		String num = req.getParameter("pnum");
		String reward = req.getParameter("rnum");
		String quantity = req.getParameter("qty");
		String add = req.getParameter("add");
		if(add == null) {add="0";}
		
		if(num != null && reward != null && loginMember != null) {
			
			ProjectVo prjVo = new PrjSupportService().selectPrj(num);
			ProjectRewardVo rewardVo = new PrjSupportService().selectReward(reward);
			List<AddrVo> addrList = new PrjSupportService().selectAddr(loginMember.getNo());
			List<PaymentVo> paymentList = new PrjSupportService().selectPayment(loginMember.getNo());
			List<CouponVo> couponList = new PrjSupportService().selectCoupon(loginMember.getNo());
			
			int totalDonation = new PrjViewService().getTotalDonation(num);
			double getPercentage = ((double)totalDonation / (double)prjVo.getGoal()) * 100;
			long percent = Math.round(getPercentage);
			
			req.setAttribute("prjVo", prjVo);
			req.setAttribute("rewardVo", rewardVo);
			req.setAttribute("addrList", addrList);
			req.setAttribute("paymentList", paymentList);
			req.setAttribute("couponList", couponList);
			req.setAttribute("quantity", quantity);
			req.setAttribute("add", add);
			req.setAttribute("totalDonation", totalDonation);
			req.setAttribute("percent", percent);
			
			if(prjVo != null && rewardVo != null && quantity != null) {
				//???????????? ???????????? ????????? ???????????????
				if(!(num.equals(rewardVo.getProjectNo()))) {
					req.getSession().setAttribute("alertMsg", "???????????? ???????????? ????????????.");
					resp.sendRedirect(req.getContextPath());
				}else {
					//?????? ??????
					req.getRequestDispatcher("/WEB-INF/views/project/supportForm.jsp").forward(req, resp);
				}
			}else {
				//???????????? ????????? ????????? ????????? ?????? ???
				req.getSession().setAttribute("alertMsg", "??????????????? ???????????? ???????????????.");
				resp.sendRedirect(req.getContextPath()+"/project/view?num=" + num);
			}
		}else {
			//??????????????? ???????????? ?????????????????? ???????????? ????????? ?????? ???
			req.getSession().setAttribute("alertMsg", "???????????? ?????? ??????????????????.");
			resp.sendRedirect(req.getContextPath());
		}
	}//doget
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String num = req.getParameter("num");
		
		String rewardNo = req.getParameter("rewardNo");
		String memberNo = req.getParameter("memberNo");
		String addrNo = req.getParameter("addrNo");
		String cardNo = req.getParameter("cardNo");
		String quantity = req.getParameter("quantity");
		String sum = req.getParameter("sum");
		String donateDate = req.getParameter("donateDate");//????????????
		String additional = req.getParameter("additional");
		String sale = req.getParameter("sale");
		
		SupportVo supportVo = new SupportVo();
		supportVo.setRewardNo(rewardNo);
		supportVo.setMemberNo(memberNo);
		supportVo.setDeliveryAddrNo(addrNo);
		supportVo.setPaymentMethodNo(cardNo);
		supportVo.setQuantity(quantity);
		supportVo.setAmount(sum);
		supportVo.setDonateDate(donateDate);
		supportVo.setAdditional(additional);
		
		System.out.println(supportVo);
		
		int result = new PrjSupportService().insertSupport(supportVo, sale);
		
		if(result == 1) {
			req.getSession().setAttribute("alertMsg", "????????? ??????????????? ?????????????????????.");
			resp.sendRedirect(req.getContextPath());
		}else {
			System.out.println("support error result ::: " + result);
			req.getSession().setAttribute("erorrMsg", "?????? ????????? ?????????????????????.");
			resp.sendRedirect(req.getContextPath() + "/project/view?num=" + num);
		}
		
	}//dopost
	
}//class
