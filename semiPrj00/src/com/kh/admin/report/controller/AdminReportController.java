package com.kh.admin.report.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.proposal.service.AdminProposalService;
import com.kh.admin.report.service.AdminReportService;
import com.kh.admin.report.vo.AdminReportVo;
import com.kh.common.vo.PageVo;

@WebServlet(urlPatterns = "/admin/report")
public class AdminReportController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		int listCount = new AdminReportService().getCount();
		int currentPage = Integer.parseInt(req.getParameter("p"));
		int pageLimit = 10;
		int boardLimit = 10;
		int maxPage = (int) Math.ceil(((double)listCount / boardLimit));
		int startPage = (currentPage-1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit -1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageVo pageVo = new PageVo();
		
		pageVo.setListCount(listCount);
		pageVo.setCurrentPage(currentPage);
		pageVo.setPageLimit(pageLimit);
		pageVo.setBoardLimit(boardLimit);
		pageVo.setMaxPage(maxPage);
		pageVo.setStartPage(startPage);
		pageVo.setEndPage(endPage);
		
		List<AdminReportVo> adminReportVoList = new AdminReportService().selectList(pageVo);
		
		
		req.setAttribute("pv", pageVo);
		req.setAttribute("list", adminReportVoList);
		
		
		
		req.setAttribute("functionName", "신고관리");
		req.getRequestDispatcher("/WEB-INF/views/admin/report/adminReportView.jsp").forward(req, resp);
	}
}
