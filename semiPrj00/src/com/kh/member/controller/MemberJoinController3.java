package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.service.MemberService;
import com.kh.member.vo.MemberVo;

@WebServlet(urlPatterns = "/member/join3")
public class MemberJoinController3 extends HttpServlet {

	/*
	 * 추가정보기입 페이지 보여주기
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/member/memberJoin3.jsp").forward(req, resp);
	}
	/*
	 * 정보 받아오기
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		//정보받기
		MemberVo memberVo1 = (MemberVo)req.getSession().getAttribute("memberVo1");
		String email = memberVo1.getEmail();
		String pwd = memberVo1.getPwd();
		String name = memberVo1.getName();
		String nick = memberVo1.getNick();
		String phone = memberVo1.getPhone();
		String code = memberVo1.getCode();
		//메이커등록정보
		String registration = (String)req.getParameter("busi-no");
		String busiType = (String)req.getParameter("busi-type");
		String company = (String)req.getParameter("company");
		
		System.out.println(memberVo1);
		
		//객체로 만들기
		MemberVo addMakerVo = new MemberVo();
		addMakerVo.setEmail(memberVo1.getEmail());
		addMakerVo.setPwd(memberVo1.getPwd());
		addMakerVo.setName(memberVo1.getName());
		addMakerVo.setPhone(memberVo1.getPhone());
		addMakerVo.setCode(memberVo1.getCode());

		addMakerVo.setRegistration(registration);
		addMakerVo.setType(busiType);
		if(registration.length()==0) {
			addMakerVo.setNick(nick);
		}else {	
			addMakerVo.setNick(company);				
		}
		
		System.out.println(addMakerVo);
		
		//세션가져오고 만료
		req.getSession().removeAttribute("memberVo");
		
		//서비스에 전달
		int result = new MemberService().join(addMakerVo);
		
		//결과에 따라 화면 공유
		if(result == 1) {
			req.getSession().setAttribute("alertMsg", "회원가입 완료!");
			req.getRequestDispatcher("/WEB-INF/views/member/joinFinish.jsp").forward(req, resp);
		}else {
			req.getSession().setAttribute("alertMsg", "입력한 정보를 다시 확인해주세요");
			req.setAttribute("addMakerVo", addMakerVo);
			req.getRequestDispatcher(req.getContextPath()+"/member/join3").forward(req, resp);
		}
	
	}
}
