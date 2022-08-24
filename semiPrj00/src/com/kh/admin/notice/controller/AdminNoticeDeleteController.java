package com.kh.admin.notice.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.notice.service.AdminNoticeService;

@WebServlet (urlPatterns = "/admin/notice/delete")
public class AdminNoticeDeleteController extends HttpServlet {
	
	//상세페이지에서 삭제 선택 시 호출
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("잘 넘어옴");
		String no = req.getParameter("no");
		
		int result = new AdminNoticeService().deleteNotice(no);
		
		if(result==1) {
			req.getSession().setAttribute("alertMsg", "공지사항 삭제에 성공하였습니다.");
			
			resp.sendRedirect("/semiPrj00/admin/notice?p=1");
		} else {
			req.setAttribute("errorMsg", "공지사항 삭제에 실패하였습니다.");
			
			resp.sendRedirect("/semiPrj00/admin/notice?p=1");
		}
		
	}
	
	//리스트 페이지에서 삭제 선택 시 호출

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String[] checkBoxArr = req.getParameterValues("key");
		List<String> noticeNoList = new ArrayList<String>();
		
		for (String noticeNo : checkBoxArr) {
			noticeNoList.add(noticeNo);
		}
		
		int listSize = noticeNoList.size();
		int result = new AdminNoticeService().deleteNotice(noticeNoList);
		
		System.out.println("리스트 사이즈 : " + listSize);
		System.out.println("성공 횟수 : " + result);
		
		if (result == listSize) {
			System.out.println(result + "개의 공지사항 삭제 완료");
		} else {
			System.out.println(result + "개의 공지사항 삭제 실패");
		}
		
	}
}
