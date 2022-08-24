package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.addr.vo.AddrVo;
import com.kh.member.service.MemberAddrService;
import com.kh.member.vo.MemberVo;

@WebServlet(urlPatterns = "/member/addrRegister")
public class MemberAddrController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MemberVo loginMember = (MemberVo)req.getSession().getAttribute("loginMember");
		
		if(loginMember != null) {
			req.getRequestDispatcher("/WEB-INF/views/member/addrRegisterForm.jsp").forward(req, resp);
		}else {
			req.getSession().setAttribute("alertMsg", "로그인 후 이용가능합니다.");
			resp.sendRedirect(req.getContextPath());
		}
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String memberNo = req.getParameter("memberNo");
		String name = req.getParameter("name");
		String phone = req.getParameter("phone");
		String postNum = req.getParameter("postNum");
		String addr1 = req.getParameter("addr1");
		String addr2 = req.getParameter("addr2");
		String defaultAddr = req.getParameter("default");
		
		AddrVo addrVo = new AddrVo();
		addrVo.setMemberNo(memberNo);
		addrVo.setName(name);
		addrVo.setPhone(phone);
		addrVo.setPostNum(postNum);
		addrVo.setAddr1(addr1);
		addrVo.setAddr2(addr2);
		addrVo.setDefaultYN(defaultAddr);
		
		int update = 0;
		if("on".equals(defaultAddr)) {
			update = new MemberAddrService().updateAddr(memberNo);
		}
		
		int result = new MemberAddrService().insertAddr(addrVo);
		
		if(result == 1 && update != -1) {
			req.getSession().setAttribute("alertMsg", "성공적으로 등록되었습니다.");
			resp.sendRedirect(req.getContextPath() + "/member/mypage");
		}else {
			System.out.println("addr error result ::: " + result);
			req.getSession().setAttribute("errorMsg", "등록에 실패하였습니다.");
			resp.sendRedirect(req.getContextPath() + "/member/mypage");
		}
	}

}
