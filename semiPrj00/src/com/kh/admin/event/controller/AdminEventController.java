package com.kh.admin.event.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.event.service.AdminEventService;
import com.kh.admin.event.vo.AdminEventVo;
import com.kh.common.vo.PageVo;

@WebServlet(urlPatterns = "/admin/event")
public class AdminEventController extends HttpServlet {
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	
	
	int listCount = new AdminEventService().getCount();
	int currentPage = Integer.parseInt(req.getParameter("p"));
	int pageLimit = 10;
	int boardLimit = 6;
	int maxPage = (int) Math.ceil(((double)listCount / boardLimit));
	int startPage = (currentPage-1) / pageLimit * pageLimit + 1;
	int endPage = startPage + pageLimit -1;
	
	if(endPage > maxPage) {
		endPage = maxPage;
		
	PageVo pageVo = new PageVo();
	
	pageVo.setListCount(listCount);
	pageVo.setCurrentPage(currentPage);
	pageVo.setPageLimit(pageLimit);
	pageVo.setBoardLimit(boardLimit);
	pageVo.setMaxPage(maxPage);
	pageVo.setStartPage(startPage);
	pageVo.setEndPage(endPage);
	
	
	List<AdminEventVo> adminEventVoList = new AdminEventService().selectList(pageVo);
	
	req.setAttribute("pv", pageVo);
	req.setAttribute("list", adminEventVoList);
	req.setAttribute("functionName", "이벤트 관리");
	req.getRequestDispatcher("/WEB-INF/views/admin/event/adminEventView.jsp").forward(req, resp);
}
}
}
