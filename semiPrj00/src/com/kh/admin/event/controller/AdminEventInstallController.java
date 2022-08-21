package com.kh.admin.event.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.kh.admin.event.vo.AdminEventVo;
import com.kh.admin.login.vo.AdminVo;
import com.kh.admin.notice.vo.AdminNoticeVo;

@MultipartConfig(
//		fileSizeThreshold = 1024*1024
//		location = "/swy/temp"
		maxFileSize = 1024*1024*50,
		maxRequestSize = 1024*1024*50*5
)

@WebServlet(urlPatterns = "/admin/eventInstall")
public class AdminEventInstallController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("functionName", "이벤트 작성");
		req.getRequestDispatcher("/WEB-INF/views/admin/event/adminEventInstall.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String important = req.getParameter("important");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String startDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");
		Part thumbnaulFile = req.getPart("thumbnailFile");
		Part imageFile = req.getPart("imageFile");
		
		AdminVo adminVo = (AdminVo) req.getSession().getAttribute("loginAdmin");
		
		AdminEventVo adminEventVo = new AdminEventVo();
		
		adminEventVo.setImportantYN(important);
		adminEventVo.setTitle(title);
		adminEventVo.setContent(content);
		adminEventVo.setStartDate(startDate);
		adminEventVo.setEndDate(endDate);
		
		String savePath = "";
		if(f.getSubmittedFileName().length() > 0) {
			
		}
		}
		
	}
}
