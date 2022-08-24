package com.kh.admin.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.admin.member.service.AdminMemberService;
import com.kh.admin.member.vo.AdminMemberVo;

@WebServlet (urlPatterns = "/admin/member/suspend")
public class AdminMemberSuspendController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String[] checkBoxArr = req.getParameterValues("key");
		List<String> memberNoList = new ArrayList<String>();
				
		for (String memberNo : checkBoxArr) {
			memberNoList.add(memberNo);
		}
		
		int listSize = memberNoList.size();
		int result = new AdminMemberService().suspendMember(memberNoList);
		
		System.out.println("리스트 사이즈 : " + listSize);
		System.out.println("성공 횟수 : " + result);
		
		List<AdminMemberVo> memberVoList = null;
		if (result == listSize) {
			
			memberVoList = new AdminMemberService().selectStatusList(memberNoList);
		
			if(memberVoList==null) {
				System.out.println("회원정지 후 상태 조회 실패");
				req.getSession().setAttribute("errorMsg", "회원 정지에는 성공하였으나, 상태조회에 실패하였습니다.");
				resp.sendRedirect("/semiPrj00/admin/memberManage?p=1");
			}
		} else {
			System.out.println("회원정지 실패");
			req.getSession().setAttribute("errorMsg", "회원 정지에 실패하였습니다.");
			resp.sendRedirect("/semiPrj00/admin/memberManage?p=1");
		}
		
		System.out.println("회원정지 후 프로젝트 상태조회 성공");
		//클라이언트에 응답
		resp.setCharacterEncoding("UTF-8");
		
		//GSON으로 자바 객체 -> JSON포맷 변환
		Gson gson =  new Gson();
						
		String jsonStr = gson.toJson(memberVoList);
		resp.getWriter().write(jsonStr);
		
	}
}
