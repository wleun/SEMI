package com.kh.admin.notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.admin.notice.service.AdminNoticeService;
import com.kh.admin.notice.vo.AdminNoticeVo;
import com.kh.common.vo.PageVo;

@WebServlet (urlPatterns = "/admin/notice")
public class AdminNoticeController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int listCount = new AdminNoticeService().getCount();
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
		
		List<AdminNoticeVo> adminNoticeVoList = new AdminNoticeService().selectList(pageVo);
		
		req.setAttribute("pv", pageVo);
		req.setAttribute("list", adminNoticeVoList);
		
		req.setAttribute("functionName", "공지사항 관리");
		req.getRequestDispatcher("/WEB-INF/views/admin/notice/adminNoticeView.jsp").forward(req, resp);
	}
}
