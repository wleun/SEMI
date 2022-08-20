package com.kh.project.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.project.report.vo.ProjectReportVo;
import com.kh.project.service.PrjReportService;

//프로젝트 신고
@WebServlet(urlPatterns = "/project/report")
public class PrjReportController extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		//데이터 가져오기
		String prjNo = req.getParameter("prjNo");
		String memberNo = req.getParameter("memberNo");
		String reportContent = req.getParameter("reportContent");
		
		ProjectReportVo reportVo = new ProjectReportVo();
		
		reportVo.setProjectNo(prjNo);
		reportVo.setMemberNo(memberNo);
		reportVo.setContent(reportContent);
		
		
		int result = new PrjReportService().insertReport(reportVo);
		
		
		
	}

}
