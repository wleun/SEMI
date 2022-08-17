package com.kh.project.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.sql.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.kh.category.vo.CategoryVo;
import com.kh.project.attachment.vo.ProjectAttachmentVo;
import com.kh.project.service.PrjOpenService;
import com.kh.project.vo.ProjectVo;

@MultipartConfig(
		maxFileSize = 1024*1024*50,
		maxRequestSize = 1024*1024*50*5
)

@WebServlet(urlPatterns = "/project/open")
public class PrjOpenController extends HttpServlet{

	//프로젝트 오픈 신청 페이지
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//카테고리 정보 가져오기
		List<CategoryVo> list = new PrjOpenService().selectCategoryList();
		req.setAttribute("list", list);
		
		req.getRequestDispatcher("/WEB-INF/views/project/openForm.jsp").forward(req, resp);
		
	}
	
	//오픈 폼 데이터 처리
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		ProjectVo prjVo = new ProjectVo();
		ProjectAttachmentVo attVo = null;
		
		
		//데이터 꺼내기 
		//1page 프로젝트 기본정보
		
		String category = req.getParameter("prjCategory"); //카테고리
		String title = req.getParameter("prjTitle"); //프로젝트 제목
		
		Timestamp startDate = Timestamp.valueOf(req.getParameter("startDate"));//시작일(날짜)
		
		Timestamp endDate = Timestamp.valueOf(req.getParameter("endDate"));//마감일(날짜)
		
		int goal = Integer.parseInt(req.getParameter("prjAmount")); //목표금액
		
		Part thumbnail = req.getPart("thumbnail");//대표이미지
		
		String savePath = null;
		
		if(thumbnail.getSubmittedFileName().length() > 0) {
			String originName = thumbnail.getSubmittedFileName(); //원본 파일명 얻기
			String changeName = new PrjOpenService().createChangeName(originName);
			
			InputStream is = thumbnail.getInputStream();//인풋스트림 준비
			BufferedInputStream bis = new BufferedInputStream(is);
			
			String realPath = req.getServletContext().getRealPath("/resources/upload");
			savePath = realPath +File.separator+ changeName;
			
			FileOutputStream os = new FileOutputStream(savePath);
			BufferedOutputStream bos = new BufferedOutputStream(os);
			
			byte[] buf = new byte[1024]; //한번에 1024 바이트씩 가져오고 싶어서 작성
			
			int size = 0;
			while((size = bis.read(buf))!= -1) {
				bos.write(buf, 0, size);
			}
			

			bos.flush();
			bis.close();
			bos.close();
			
			//썸네일 vo로 뭉쳐놓기
			prjVo.setThumbnailName(changeName);
			prjVo.setThumbnailPath(realPath);
		}
		

		Collection<Part> prjFile = req.getParts();//상세이미지
		
		for(Part file : prjFile) {
			if(!file.getName().equals("prjFile")) continue; //prjFile인 경우만 진행
			
			String originName = file.getSubmittedFileName(); //원본 파일명 얻기
			String changeName = new PrjOpenService().createChangeName(originName);
			
			InputStream is = file.getInputStream();//인풋스트림 준비
			BufferedInputStream bis = new BufferedInputStream(is);
			
			String realPath = req.getServletContext().getRealPath("/resources/upload");
			savePath = realPath +File.separator+ changeName;
			
			FileOutputStream os = new FileOutputStream(savePath);
			BufferedOutputStream bos = new BufferedOutputStream(os);
			
			byte[] buf = new byte[1024]; //한번에 1024 바이트씩 가져오고 싶어서 작성
			
			int size = 0;
			while((size = bis.read(buf))!= -1) {
				bos.write(buf, 0, size);
			}
			
			bos.flush();
			bis.close();
			bos.close();

			//파일 Vo로 뭉치기
			attVo.setOriginName(originName);
			attVo.setChangeName(changeName);
			attVo.setFileSrc(realPath);
			
		}
		

		String text = req.getParameter("prjText"); //상세설명
		String etc = "";
		if(req.getParameter("etc") != null) {
			etc = req.getParameter("etc"); //예상 어려움 (내용이 없으면 빈 문자열로)
		} 
		
		
		int shippingDate = Integer.parseInt(req.getParameter("shippingDate")); //결제 마감일로부터 n일 
		Date shippingDateResult = new PrjOpenService().shippingDateCalc(endDate, shippingDate); //배송일(날짜) 마감일 + 결제 7일 + 지정한 날짜 n일 ////
		
		
		//2page 창작자 정보
		String makerInfo = ""; //창작자 소개 (내용이 없으면 빈 문자열로)
		if(req.getParameter("makerInfo") != null) 
			makerInfo = req.getParameter("makerInfo");
		String accountNo = req.getParameter("accountNo");
		String accountBank = req.getParameter("accountBank");
		String accountName = req.getParameter("accountName");
		
		
		//3page 리워드 정보
		String[] price = req.getParameterValues("price");
		String[] quantity = req.getParameterValues("quantity");
		String[] option = req.getParameterValues("option");
		String[] detail = req.getParameterValues("detail");
		
		
		//////////////////////////////////////////////////////////
		//프로젝트 정보 데이터 뭉치기
		prjVo.setCategoryNo(category);
		prjVo.setName(title);
//		prjVo.setStartDate(startDate);
//		prjVo.setEndDate(endDate);
		prjVo.setGoal(goal);
		prjVo.setText(text);
		prjVo.setEtc(etc);
		prjVo.setShippingDate(shippingDateResult);
		prjVo.setMakerInfo(makerInfo);
		prjVo.setAccountNo(accountNo);
		prjVo.setAccountBank(accountBank);
		prjVo.setAccountName(accountName);
		
		

		
		
		
		//데이터 뭉치기
		
		
		
	}

}
