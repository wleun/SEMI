package com.kh.admin.report.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.report.service.AdminReportService;

@WebServlet (urlPatterns = "/admin/report/complete")
public class adminReportCompleteController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String no = req.getParameter("no");
		
		int result = new AdminReportService().reportComplete(no);
		
		if(result == 1) {
			resp.sendRedirect("/semiPrj00/admin/report?p=1");
		} else {
			req.getSession().setAttribute("errorMsg", "신고서 조치완료 처리중에 오류가 발생하였습니다.");
			resp.sendRedirect("/semiPrj00/admin/report?p=1");
		}
	}
}
