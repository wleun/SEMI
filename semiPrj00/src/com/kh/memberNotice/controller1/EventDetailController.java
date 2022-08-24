package com.kh.memberNotice.controller1;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.attachment.vo.AdminEventAttachmentVo;
import com.kh.admin.event.service.AdminEventService;
import com.kh.admin.event.vo.AdminEventVo;
import com.kh.memberNotice.Service.EventService;

@WebServlet(urlPatterns = "/event/detail")
public class EventDetailController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*
		 * 이벤트 상세조회 화면 보여주기
		 */
		String num = req.getParameter("num");
		
		AdminEventVo eventVo = new EventService().selectOne(num);
		AdminEventAttachmentVo attachVo = new EventService().selectFile(num);
		
		if(eventVo != null && attachVo != null) {
			req.setAttribute("eventVo", eventVo);
			req.setAttribute("attachVo", attachVo);
			req.getRequestDispatcher("/WEB-INF/views/noticeEvent/eventDetail.jsp").forward(req, resp);
		}else {
			req.getSession().setAttribute("errorMsg", "이벤트 정보를 불러올 수 없습니다.");
			resp.sendRedirect(req.getContextPath()+"/admin/event?p=1");
		}
	}
}

