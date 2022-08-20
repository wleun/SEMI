package com.kh.project.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import java.util.Collection;
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
import com.kh.member.vo.MemberVo;
import com.kh.project.attachment.vo.ProjectAttachmentVo;
import com.kh.project.service.PrjOpenService;
import com.kh.project.vo.ProjectVo;
import com.kh.reward.vo.ProjectRewardVo;

@MultipartConfig(
		maxFileSize = 1024*1024*50,
		maxRequestSize = 1024*1024*50*5
)

@WebServlet(urlPatterns = "/project/open")
public class PrjOpenController extends HttpServlet{

	//프로젝트 오픈 신청 페이지
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//로그인 정보 없으면 메시지 표시 및 로그인 페이지로 보냄
		MemberVo loginMember = (MemberVo)req.getSession().getAttribute("loginMember");
		
		if(loginMember != null) {
			//카테고리 정보 가져오기
			List<CategoryVo> list = new PrjOpenService().selectCategoryList();
			req.setAttribute("list", list);
			req.getRequestDispatcher("/WEB-INF/views/project/openForm.jsp").forward(req, resp);
		}else {
			req.getSession().setAttribute("alertMsg", "로그인 후 이용 가능한 서비스입니다.");
			resp.sendRedirect(req.getContextPath()+"/member/login"); /////
		}
		
	}
	
	//오픈 폼 데이터 처리
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		ProjectVo prjVo = new ProjectVo();
		ProjectAttachmentVo attVo = null;
		ProjectRewardVo rewardVo = null;
		
		
		//데이터 꺼내기 
		//1page 프로젝트 기본정보
		
		String category = req.getParameter("prjCategory"); //카테고리
		String title = req.getParameter("prjTitle"); //프로젝트 제목
		
		String startDate = req.getParameter("startDate");//시작일(날짜)
		String endDate = req.getParameter("endDate");//마감일(날짜)
		
		int goal = Integer.parseInt(req.getParameter("prjAmount")); //목표금액
		
		
		
		//대표이미지
		Part thumbnail = req.getPart("thumbnail");
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
		
		
		//상세이미지
		LinkedList<ProjectAttachmentVo> attList = new LinkedList<ProjectAttachmentVo>(); //첨부파일 객체 담을 리스트
		Collection<Part> prjFile = req.getParts();
		
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

			//상세페이지 첨부파일 데이터 뭉치기
			attVo = new ProjectAttachmentVo();
			attVo.setOriginName(originName);
			attVo.setChangeName(changeName);
			attVo.setFileSrc(realPath);
			attList.add(attVo);
			
		}
		
		
		

		String text = req.getParameter("prjText"); //상세설명
		String etc = "";
		if(req.getParameter("etc") != null) {
			etc = req.getParameter("etc"); //예상 어려움 (내용이 없으면 빈 문자열로)
		} 
		
		
		int shippingDate = Integer.parseInt(req.getParameter("shippingDate")); //결제 마감일로부터 n일 
		String shippingDateResult = new PrjOpenService().shippingDateCalc(endDate, shippingDate); //배송일(날짜) 마감일 + 결제 7일 + 지정한 날짜 n일 

		
		//2page 창작자 정보
		String makerNo = req.getParameter("makerNo");
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
		prjVo.setStartDate(startDate);
		prjVo.setEndDate(endDate);
		prjVo.setGoal(goal);
		prjVo.setText(text);
		prjVo.setEtc(etc);
		prjVo.setShippingDate(shippingDateResult);
		
		prjVo.setMakerNo(makerNo);
		prjVo.setMakerInfo(makerInfo);
		prjVo.setAccountNo(accountNo);
		prjVo.setAccountBank(accountBank);
		prjVo.setAccountName(accountName);
		
		
		//리워드 정보 담을 리스트
		LinkedList<ProjectRewardVo> rewardList = new LinkedList<ProjectRewardVo>();
	
		//리워드 정보 데이터 뭉치기
		for(int i = 0; i<price.length; i++)
		{
			rewardVo = new ProjectRewardVo();
			rewardVo.setPrice(price[i]);
			rewardVo.setQuantity(quantity[i]);
			rewardVo.setOption(option[i]);
			rewardVo.setDetail(detail[i]);
			
			rewardList.add(rewardVo);
			
		}
		
	
		int result = new PrjOpenService().prjInsert(prjVo, attList, rewardList);
		
		
		if(result == 1) {
			req.getSession().setAttribute("alertMsg", "정상적으로 오픈 신청 처리되었습니다.");
			resp.sendRedirect(req.getContextPath());
		
		}else {
			//이상 발생 시 이미 올라간 첨부파일 삭제하고 메인페이지로
			if(prjVo.getThumbnailName() != null) {
				String savepath = prjVo.getThumbnailPath()+ File.separator+ prjVo.getThumbnailName();
				new File(savepath).delete();
			}
			if(!attList.isEmpty()) {
				for(int i = 0; i < attList.size(); i++) {
					String savepath = attList.get(i).getFileSrc()+ File.separator+ attList.get(i).getChangeName();
					new File(savepath).delete();
				}
			}
			req.getSession().setAttribute("errorMsg", "죄송합니다. 처리 중 문제가 발생되었습니다.");
			resp.sendRedirect(req.getContextPath()); 
		}
		
		
	}

}
