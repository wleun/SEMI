package com.kh.admin.event.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.attachment.vo.AdminEventAttachmentVo;
import com.kh.admin.event.service.AdminEventService;
import com.kh.admin.event.vo.AdminEventVo;

@WebServlet(urlPatterns = "/admin/event/detail")
public class AdminEventDetailController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String no = req.getParameter("no");
		
		AdminEventVo adminEventVo = new AdminEventService().selectOne(no);
		AdminEventAttachmentVo adminEventAttachmentVo = new AdminEventService().selectFile(no);
		
		if(adminEventVo!=null && adminEventAttachmentVo !=null) {
			req.setAttribute("adminEventVo", adminEventVo);
			req.setAttribute("adminEventAttachmentVo", adminEventAttachmentVo);
			req.setAttribute("functionName", "이벤트 상세조회");
			
			req.getRequestDispatcher("/WEB-INF/views/admin/event/adminEventDetailView.jsp").forward(req, resp);
		} else {
			req.getSession().setAttribute("errorMsg", "이벤트 정보를 불러올 수 없습니다.");
			resp.sendRedirect("/semiPrj00/admin/event?p=1");
		}
		
	}
}
