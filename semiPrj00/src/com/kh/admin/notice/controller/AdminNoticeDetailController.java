package com.kh.admin.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.attachment.vo.AdminNoticeAttachmentVo;
import com.kh.admin.notice.service.AdminNoticeService;
import com.kh.admin.notice.vo.AdminNoticeVo;

@WebServlet(urlPatterns = "/admin/notice/detail")
public class AdminNoticeDetailController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String no = req.getParameter("no");
		
		AdminNoticeVo adminNoticeVo = new AdminNoticeService().selectOne(no);
		AdminNoticeAttachmentVo adminNoticeAttachmentVo = new AdminNoticeService().selectFile(no);
		
		if(adminNoticeVo!=null && adminNoticeAttachmentVo !=null) {
			req.setAttribute("adminNoticeVo", adminNoticeVo);
			req.setAttribute("adminNoticeAttachmentVo", adminNoticeAttachmentVo);
			req.setAttribute("function", "이벤트 상세조회");
			
			req.getRequestDispatcher("/WEB-INF/views/admin/notice/adminNoticeDetailView.jsp").forward(req, resp);
		} else {
			
			req.getSession().setAttribute("errorMsg", "이벤트 정보를 불러올 수 없습니다.");
			resp.sendRedirect("/semiPrj00/admin/notice?p=1");
			
		}
		
		}
}
