package com.kh.project.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

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
		String category = req.getParameter("prjCategory"); //카테고리
		String title = req.getParameter("prjTitle"); //프로젝트 제목
		String startDate = req.getParameter("startDate");//시작일(날짜)////
		String endDate = req.getParameter("endDate");//마감일(날짜)////
		String goal = req.getParameter("prjAmount"); //목표금액
		
		Part thumbnail = req.getPart("thumbnail");//대표이미지
		
		String savePath = null;
		
		if(thumbnail.getSubmittedFileName().length() > 0) {
			String originName = thumbnail.getSubmittedFileName(); //원본 파일명 얻기
			//String changeName = new ProjectService().createChangeName(originName);
			
			InputStream is = thumbnail.getInputStream();//인풋스트림 준비
			BufferedInputStream bis = new BufferedInputStream(is);
			
			String realPath = req.getServletContext().getRealPath("/resources/upload");
			//savePath = realPath +File.separator+ changeName;
			
			FileOutputStream os = new FileOutputStream(savePath);
			BufferedOutputStream bos = new BufferedOutputStream(os);
		}
		
		
		
		
		
		Collection<Part> prjFile = req.getParts();//상세이미지
		
		for(Part file : prjFile) {
			if(!file.getName().equals("prjFile")) continue; //prjFile인 경우만 진행
			
			
		}
		
		
		
		
		
		
		
		String text = req.getParameter("prjText"); //상세설명
		String etc = "";
		if(req.getParameter("etc") != null) {
			etc = req.getParameter("etc"); //예상 어려움 (내용이 없으면 빈 문자열로)
		} 
		
		
		
		
		
		
		
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
