package com.kh.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.service.MemberMyprjService;
import com.kh.project.vo.ProjectVo;

@WebServlet(urlPatterns = "/member/myprj")
public class MemberMyprjController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//강사님 피드백
		String[] type = req.getParameterValues("type");
		
		if(type == null) {
			type = new String[] {"A","I","S"};
		}

		List<ProjectVo> pVoList = new MemberMyprjService().seletPrj(type);
		
		req.setAttribute("pVoList", pVoList);
		req.getRequestDispatcher("/WEB-INF/views/member/memberPrjPage.jsp").forward(req, resp);
		
		
		
	}
	
}
