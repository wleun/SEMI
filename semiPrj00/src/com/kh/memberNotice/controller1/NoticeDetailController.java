package com.kh.memberNotice.controller1;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.attachment.vo.AdminNoticeAttachmentVo;
import com.kh.admin.notice.service.AdminNoticeService;
import com.kh.admin.notice.vo.AdminNoticeVo;
import com.kh.memberNotice.Service.NoticeService;

@WebServlet(urlPatterns = "/notice/detail")
public class NoticeDetailController extends HttpServlet {
	/*
	 * 공지사항 상세조회 화면 보여주기
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//num번: 조회할 공지사항 번호
		String num = req.getParameter("num");
		
		//디비에서 특정 공지사항 정보 조회
		AdminNoticeVo adminNoticeVo = new NoticeService().selectOne(num);
		AdminNoticeAttachmentVo adminNoticeAttachmentVo = new NoticeService().selectFile(num);
		
		if(adminNoticeVo!=null && adminNoticeAttachmentVo !=null) {
			req.setAttribute("adminNoticeVo", adminNoticeVo);
			req.setAttribute("adminNoticeAttachmentVo", adminNoticeAttachmentVo);
			//req.setAttribute("function", "이벤트 상세조회");
			
			req.getRequestDispatcher("/WEB-INF/views/noticeEvent/noticeDetail.jsp").forward(req, resp);
		} else {
			
			req.getSession().setAttribute("errorMsg", "해당 글을 불러올 수 없습니다.");
			resp.sendRedirect(req.getContextPath()+"/semiPrj00/admin/notice?p=1");
			
		}
		
		
		
		
		req.getRequestDispatcher("/WEB-INF/views/noticeEvent/noticeDetail.jsp").forward(req, resp);
	}
}
