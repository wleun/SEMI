package com.kh.admin.event.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.event.service.AdminEventService;
import com.kh.admin.notice.service.AdminNoticeService;

@WebServlet (urlPatterns = "/admin/event/delete")
public class AdminEventDeleteController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String no = req.getParameter("no");
		System.out.println(no);
		
		int result = new AdminEventService().deleteEvent(no);
		
		if(result==1) {
			req.getSession().setAttribute("alertMsg", "이벤트 삭제에 성공하였습니다.");
			
			resp.sendRedirect("/semiPrj00/admin/event?p=1");
		} else {
			req.setAttribute("errorMsg", "이벤트 삭제에 실패하였습니다.");
			
			resp.sendRedirect("/semiPrj00/admin/event?p=1");
		}
	}
}
