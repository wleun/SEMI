package com.kh.admin.notice.controller;

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

import com.kh.admin.attachment.vo.AdminNoticeAttachmentVo;
import com.kh.admin.login.vo.AdminVo;
import com.kh.admin.notice.service.AdminNoticeService;
import com.kh.admin.notice.vo.AdminNoticeVo;

@MultipartConfig(
		maxFileSize = 1024*1024*50,
		maxRequestSize = 1024*1024*50*5
)

@WebServlet (urlPatterns = "/admin/notice/edit")
public class AdminNoticeEditController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String no = req.getParameter("no");
		
		AdminNoticeVo adminNoticeVo = new AdminNoticeService().selectOne(no);
		AdminNoticeAttachmentVo adminNoticeAttachmentVo = new AdminNoticeService().selectFile(no);
		
		if(adminNoticeVo!=null && adminNoticeAttachmentVo!=null) {
			
			req.setAttribute("adminNoticeVo", adminNoticeVo);
			req.setAttribute("adminNoticeAttachmentVO", adminNoticeAttachmentVo);
			req.setAttribute("functionName", "공지사항 수정");
			
			req.getRequestDispatcher("/WEB-INF/views/admin/notice/adminNoticeEdit.jsp").forward(req, resp);
		
		} else {
			req.getSession().setAttribute("errorMsg", "공지사항 정보를 불러올 수 없습니다.");
			resp.sendRedirect("/semiPrj00/admin/notice?p=1");
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
		Part thumbnailFile = req.getPart("thumbnailFile");
		Part imageFile = req.getPart("imageFile");
		
		AdminNoticeVo adminNoticeVo = new AdminNoticeVo();
		
		adminNoticeVo.setNo(no);
		adminNoticeVo.setImportantYn(important);
		adminNoticeVo.setTitle(title);
		adminNoticeVo.setContent(content);
		adminNoticeVo.setAdminName(adminNo);
		
		String savePath = "";
		
		if(thumbnailFile.getSubmittedFileName().length() >0) {
String thumbnaulFileName = thumbnailFile.getSubmittedFileName();
			
			InputStream is = thumbnailFile.getInputStream();
			BufferedInputStream bis = new  BufferedInputStream(is);
		
			String realPath = req.getServletContext().getRealPath("/resources/admin/notice");
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
			
			adminNoticeVo.setThumbnailPath(realPath);
			adminNoticeVo.setThumbnailName(thumbnaulFileName);
		}
		
		AdminNoticeAttachmentVo adminNoticeAttachmentVo = null;
		
		if(imageFile.getSubmittedFileName().length() > 0) {
			String imageFileName = imageFile.getSubmittedFileName();
			
			InputStream is = imageFile.getInputStream();
			BufferedInputStream bis = new  BufferedInputStream(is);
		
			String realPath = req.getServletContext().getRealPath("/resources/admin/notice");
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
			
			adminNoticeAttachmentVo = new AdminNoticeAttachmentVo();
			
			adminNoticeAttachmentVo.setName(imageFileName);
			adminNoticeAttachmentVo.setPath(realPath);
			adminNoticeAttachmentVo.setNoticeNo(no);
			
		}
		
		int result = new AdminNoticeService().editNotice(adminNoticeVo, adminNoticeAttachmentVo);
	
	
		if(result==1) {
			
			System.out.println(adminNo + " 의 공지사항 수정 완료");
			
			req.getSession().setAttribute("alertMsg", "공지사항 수정이 완료되었습니다.");
			resp.sendRedirect("/semiPrj00/admin/notice/detail?no=" + adminNoticeVo.getNo());
		} else {
			
			if(adminNoticeAttachmentVo != null) {
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
				req.getSession().setAttribute("errorMsg", "[ERROR-CODE :" + result + "] 이미지 파일이 비어있습니다.");
			} else if (result ==-4) {
				System.out.println("[ERROR-CODE :" + result + "]");
				req.getSession().setAttribute("errorMsg", "[ERROR-CODE :" + result + "] 섬네일 파일이 비어있습니다.");
			} else if (result ==-5) {
				System.out.println("[ERROR-CODE :" + result + "]");
				req.getSession().setAttribute("errorMsg", "[ERROR-CODE :" + result + "] 이미지와 섬네일 파일 저장에 실패하였습니다. 다시 시도해주세요.");
			} else {
				System.out.println("[ERROR-CODE :" + result + "]");
				req.getSession().setAttribute("errorMsg", "[ERROR-CODE :" + result + "] 알 수 없는 오류가 발생하였습니다.");
			}
			
			resp.sendRedirect("/semiPrj00/admin/notice?p=1");
		}
	 
	
	
	}

}