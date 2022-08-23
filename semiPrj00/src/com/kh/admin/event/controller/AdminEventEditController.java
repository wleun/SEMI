package com.kh.admin.event.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.kh.admin.attachment.vo.AdminEventAttachmentVo;
import com.kh.admin.event.service.AdminEventService;
import com.kh.admin.event.vo.AdminEventVo;
import com.kh.admin.login.vo.AdminVo;

@MultipartConfig(
		maxFileSize = 1024*1024*50,
		maxRequestSize = 1024*1024*50*5
)

@WebServlet (urlPatterns = "/admin/event/edit")
public class AdminEventEditController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String no = req.getParameter("no");
		
		AdminEventVo adminEventVo = new AdminEventService().selectOne(no);
		AdminEventAttachmentVo adminEventAttachmentVo = new AdminEventService().selectFile(no);
		
		if(adminEventVo != null && adminEventAttachmentVo != null) {
			
			req.setAttribute("adminEventVo", adminEventVo);
			req.setAttribute("adminEventAttachmentVo", adminEventAttachmentVo);
			req.setAttribute("functionName", "이벤트 수정");
						
			req.getRequestDispatcher("/WEB-INF/views/admin/event/adminEventEdit.jsp").forward(req, resp);
		} else {
			req.getSession().setAttribute("errorMsg", "이벤트 정보를 불러올 수 없습니다.");
			resp.sendRedirect("/semiPrj00/admin/event?p=1");
		}
		
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		AdminVo adminVo = (AdminVo) req.getSession().getAttribute("loginAdmin");
		
		String adminNo = adminVo.getNo();
		
		String no = req.getParameter("no");
		String important = req.getParameter("important");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String startDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");
		Part thumbnailFile = req.getPart("thumbnailFile");
		Part imageFile = req.getPart("imageFile");
		
		AdminEventVo adminEventVo = new AdminEventVo();
		
		adminEventVo.setNo(no);
		adminEventVo.setImportantYN(important);
		adminEventVo.setTitle(title);
		adminEventVo.setContent(content);
		adminEventVo.setStartDate(startDate);
		adminEventVo.setEndDate(endDate);
		adminEventVo.setAdminName(adminNo);		
		
		System.out.println("=======이벤트 번호=========");
		System.out.println(adminEventVo.getNo());
		System.out.println(adminEventVo.getImportantYN());
		System.out.println(adminEventVo.getTitle());
		System.out.println(adminEventVo.getContent());
		System.out.println(adminEventVo.getStartDate());
		System.out.println(adminEventVo.getEndDate());
		System.out.println(adminEventVo.getAdminName());
		System.out.println("=======================");
		
		String savePath = "";
		
		if(thumbnailFile.getSubmittedFileName().length() > 0) {
			String thumbnaulFileName = thumbnailFile.getSubmittedFileName();
			
			InputStream is = thumbnailFile.getInputStream();
			BufferedInputStream bis = new  BufferedInputStream(is);
		
			String realPath = req.getServletContext().getRealPath("/resources/admin/event");
			savePath = realPath + File.separator + thumbnaulFileName;
		
			FileOutputStream os = new FileOutputStream(savePath); 
			BufferedOutputStream bos =  new BufferedOutputStream(os); 
			
			byte[] buf = new byte[1024];
			int size = 0;
			while( (size = bis.read(buf)) != -1 ) { 
				bos.write(buf, 0, size);
			}
			
			bos.flush();
			
			bis.close();
			bos.close();
			
			adminEventVo.setThumbnailPath(realPath);
			adminEventVo.setThumbnailName(thumbnaulFileName);
			
			System.out.println("========썸네일===========");
			System.out.println(adminEventVo.getThumbnailName());
			System.out.println(adminEventVo.getThumbnailPath());
			System.out.println("======================");
			
		
		} 
		AdminEventAttachmentVo adminEventAttachmentVo = null;
		
		if(imageFile.getSubmittedFileName().length() > 0) {
			String imageFileName = imageFile.getSubmittedFileName();
			
			InputStream is = imageFile.getInputStream();
			BufferedInputStream bis = new  BufferedInputStream(is);
		
			String realPath = req.getServletContext().getRealPath("/resources/admin/event");
			savePath = realPath + File.separator + imageFileName;
		
			FileOutputStream os = new FileOutputStream(savePath); //아웃풋 스트림 준비
			BufferedOutputStream bos =  new BufferedOutputStream(os); //버퍼드 아웃 스트림
			
			byte[] buf = new byte[1024];
			int size = 0;
			while( (size = bis.read(buf)) != -1 ) { //못읽어올 때까지 진행
				bos.write(buf, 0, size);
			}
			
			bos.flush();
			
			bis.close();
			bos.close();
			
			adminEventAttachmentVo = new AdminEventAttachmentVo();
			
			adminEventAttachmentVo.setName(imageFileName);
			adminEventAttachmentVo.setPath(realPath);
			adminEventAttachmentVo.setEventNo(no);
			
			System.out.println("==========이벤트 파일============");
			System.out.println(adminEventAttachmentVo.getName());
			System.out.println(adminEventAttachmentVo.getPath());
			System.out.println(adminEventAttachmentVo.getEventNo());
			System.out.println("=============================");
			
		} 
		
		//edit
		int result = new AdminEventService().editEvent(adminEventVo,adminEventAttachmentVo);
		
		
		//결과에 따라 해결
		
		if(result==1) {
			System.out.println(adminNo + " 의 이벤트 수정 완료");
			
			req.getSession().setAttribute("alertMsg", "이벤트 수정이 완료되었습니다.");
			resp.sendRedirect("/semiPrj00/admin/event/detail?no=" + adminEventVo.getNo());
		} else {
			if(adminEventAttachmentVo != null) {
				new File(savePath).delete();
			}
			
			if(result==-1) {
				System.out.println("[ERROR-CODE :" + result + "]");
				req.getSession().setAttribute("errorMsg", "[ERROR-CODE :" + result + "] 제목을 입력하여 주세요.");
			} else if (result ==-2) {
				System.out.println("[ERROR-CODE :" + result + "]");
				req.getSession().setAttribute("errorMsg", "[ERROR-CODE :" + result + "] 내용을 입력하여 주세요.");
			} else if (result ==-3) {
				System.out.println("[ERROR-CODE :" + result + "]");
				req.getSession().setAttribute("errorMsg", "[ERROR-CODE :" + result + "] 시작일자를 입력하여 주세요.");
			} else if (result ==-4) {
				System.out.println("[ERROR-CODE :" + result + "]");
				req.getSession().setAttribute("errorMsg", "[ERROR-CODE :" + result + "] 마감일자를 입력하여 주세요.");
//			} else if (result ==-5) {
//				System.out.println("[ERROR-CODE :" + result + "]");
//				req.getSession().setAttribute("errorMsg", "[ERROR-CODE :" + result + "] 섬네일 파일이 비어있습니다. ");
//			} else if (result ==-6) {
//				System.out.println("[ERROR-CODE :" + result + "]");
//				req.getSession().setAttribute("errorMsg", "[ERROR-CODE :" + result + "] 이미지 파일이 비어있습니다.");
			} else if (result ==-7) {
				System.out.println("[ERROR-CODE :" + result + "]");
				req.getSession().setAttribute("errorMsg", "[ERROR-CODE :" + result + "] 이미지 파일이 비어있습니다.");
			} else if (result ==-8) {
				System.out.println("[ERROR-CODE :" + result + "]");
				req.getSession().setAttribute("errorMsg", "[ERROR-CODE :" + result + "] 섬네일 파일이 비어있습니다.");
			} else if (result ==-9) {
				System.out.println("[ERROR-CODE :" + result + "]");
				req.getSession().setAttribute("errorMsg", "[ERROR-CODE :" + result + "] 이미지와 섬네일 파일 저장에 실패하였습니다. 다시 시도해주세요.");
			} else {
				System.out.println("[ERROR-CODE :" + result + "]");
				req.getSession().setAttribute("errorMsg", "[ERROR-CODE :" + result + "] 알 수 없는 오류가 발생하였습니다.");
			}
			
			resp.sendRedirect("/semiPrj00/admin/event?p=1");
		}
		
		
	}


}
