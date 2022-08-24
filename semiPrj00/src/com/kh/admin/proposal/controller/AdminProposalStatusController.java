package com.kh.admin.proposal.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.proposal.repository.AdminProposalDao;
import com.kh.admin.proposal.service.AdminProposalService;
import com.kh.admin.proposal.vo.AdminProposalVo;

@WebServlet (urlPatterns = "/admin/proposal/changeStatus")
public class AdminProposalStatusController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String option = req.getParameter("option");
		if("return".equals(option)) {
			option = "N";
		} else if ("approve".equals(option)) {
			option = "B";
		} else {
			option = "A";
		}
		
		String no = req.getParameter("no");
		
		int result = new AdminProposalService().changeStatus(option,no);
		String status = "";
		
		if(result == 1) {
			
			System.out.println(no + "번 제안서 정보 업데이트 완료");
			status = new AdminProposalService().selectStatus(no);
			
			if(status==null) {
				System.out.println(no + "번 제안서 상태 읽어오기 실패");
				req.getSession().setAttribute("errorMsg", "업데이트는 성공하였으나, 변경된 제안서 정보를 불러오는데 실패하였습니다.");
				resp.sendRedirect("/semiPrj00/admin/proposal/detail?no=" + no);
			}
			
		} else {
			
			System.out.println(no + "번 제안서 정보 변경 실패");
			req.getSession().setAttribute("errorMsg", "제안서 정보 변경에 실패하였습니다.");
			resp.sendRedirect("/semiPrj00/admin/proposal/detail?no=" + no);
			
			
		}
		
		System.out.println("제안서 정보 불러오기 완료 : " + no + " 번의 현재 상태 : " + status);
		
		resp.setCharacterEncoding("UTF-8");
		resp.getWriter().write(status);
		
		
	}
}
