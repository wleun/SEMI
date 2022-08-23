package com.kh.admin.proposal.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.attachment.vo.AdminProposalAttachmentVo;
import com.kh.admin.proposal.service.AdminProposalService;
import com.kh.admin.proposal.vo.AdminProposalVo;

@WebServlet (urlPatterns = "/admin/proposal/detail")
public class AdminProposalDetailController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String no = req.getParameter("no");
		
		AdminProposalVo adminProposalVo = new AdminProposalService().selectOne(no);
		AdminProposalAttachmentVo adminProposalAttachmentVo = new AdminProposalService().selectFile(no);
		
		
		if(adminProposalVo!=null && adminProposalAttachmentVo!=null) {
		req.setAttribute("adminProposalVo", adminProposalVo);
		req.setAttribute("adminProposalAttachmentVo", adminProposalAttachmentVo);
		req.setAttribute("function", "이벤트 상세조회");
		
		req.getRequestDispatcher("/WEB-INF/views/admin/proposal/adminProposalDetail.jsp").forward(req, resp);
		} else {
			req.getSession().setAttribute("errorMsg", "제안서 정보를 불러올 수 없습니다.");
			resp.sendRedirect("/semiPrj00/admin/proposal?p=1");
		}
	}
}