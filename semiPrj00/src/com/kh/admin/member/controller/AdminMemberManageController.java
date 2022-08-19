package com.kh.admin.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.event.service.AdminEventService;
import com.kh.admin.event.vo.AdminEventVo;
import com.kh.admin.member.service.AdminMemberService;
import com.kh.common.vo.PageVo;
import com.kh.member.vo.MemberVo;

@WebServlet(urlPatterns = "/admin/memberManage")
public class AdminMemberManageController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int listCount = new AdminMemberService().getCount();
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
		
		
		List<MemberVo> memberVoList = new AdminMemberService().selectList(pageVo);
		
		req.setAttribute("pv", pageVo);
		req.setAttribute("list", memberVoList);
		
		req.setAttribute("functionName", "회원관리");
		req.getRequestDispatcher("/WEB-INF/views/admin/member/adminMemberManageView.jsp").forward(req, resp);
	}
}
