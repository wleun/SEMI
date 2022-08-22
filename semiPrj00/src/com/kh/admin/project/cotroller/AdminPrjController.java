package com.kh.admin.project.cotroller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.member.service.AdminMemberService;
import com.kh.admin.member.vo.AdminMemberVo;
import com.kh.admin.project.service.AdminPrjService;
import com.kh.admin.project.vo.AdminPrjVo;
import com.kh.common.vo.PageVo;

@WebServlet(urlPatterns = "/admin/project")
public class AdminPrjController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int listCount = new AdminPrjService().getCount();
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
		
		List<AdminPrjVo> prjVoList = new AdminPrjService().selectList(pageVo);
		
		req.setAttribute("pv", pageVo);
		req.setAttribute("list", prjVoList);
		
		
		req.setAttribute("functionName", "프로젝트 관리");
		req.getRequestDispatcher("/WEB-INF/views/admin/project/adminPrjView.jsp").forward(req, resp);
	}
}
