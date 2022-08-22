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
			System.out.println(result + "횟수만큼 삭제 완료");
		} else {
			System.out.println(result + "횟수만큼의 삭제 실패");
		}
		
		//클라이언트에 응답
		resp.setCharacterEncoding("UTF-8");
				
		String answer = result + "회 삭제 완료했습니다.";
		resp.getWriter().write(answer);
		
	}
}
