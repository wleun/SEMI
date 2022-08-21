package com.kh.admin.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.member.service.AdminMemberService;

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
		
		
		if (result == listSize) {
			System.out.println(result + " 횟수 만큼 정지 완료");
		} else {
			System.out.println(result + " 횟수 만큼 정지 실패");
		}
		
		//클라이언트에 응답
		resp.setCharacterEncoding("UTF-8");
		
		String answer = result + "회 정지완료했습니다.";
		resp.getWriter().write(answer);
		
	}
}
