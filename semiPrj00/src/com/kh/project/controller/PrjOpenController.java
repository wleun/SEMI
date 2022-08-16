package com.kh.project.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@MultipartConfig(
		maxFileSize = 1024*1024*50,
		maxRequestSize = 1024*1024*50*5
)

//프로젝트 오픈 신청
@WebServlet(urlPatterns = "/project/open")
public class PrjOpenController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/project/openForm.jsp").forward(req, resp);
		
	}
	
	//오픈 폼 데이터 처리
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		//데이터 꺼내기
		
		//1page 프로젝트 기본정보
		String category = (String)req.getParameter("prjCategory"); //카테고리
		String title = (String)req.getParameter("prjTitle"); //프로젝트 제목
		String startDate = (String)req.getParameter("startDate");//시작일(날짜)////
		String endDate = (String)req.getParameter("endDate");//마감일(날짜)////
		String goal = (String)req.getParameter("prjAmount"); //목표금액
		//대표이미지
		//상세이미지
		String text = (String)req.getParameter("prjText"); //상세설명
		String etc = "";
		if(req.getParameter("etc") != null) {
			etc = (String)req.getParameter("etc"); //예상 어려움 ////
		} 
		//확인용
		System.out.println(category);
		System.out.println(title);
		System.out.println(startDate);
		System.out.println(endDate);
		System.out.println(goal);
		System.out.println(etc);
		
		
		
		
		
		
//		
//		int shippingDate = Integer.parseInt(req.getParameter("shippingDate")); //결제 마감일로부터 n일 
//		String shippingDateCalc = endDate + 7 + shippingDate; //배송일(날짜) 마감일 + 결제 7일 + 지정한 날짜 n일 ////
//		
//		
//		//2page 창작자 정보
//		if(req.getParameter("makerInfo") != null) {
//		String makerInfo = req.getParameter("makerInfo");
//		} else {
//			String makerInfo = "";
//		}
//		
//		
//		
		
		
		
		
	}
}
