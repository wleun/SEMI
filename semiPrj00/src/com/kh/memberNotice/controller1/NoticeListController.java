package com.kh.memberNotice.controller1;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.notice.vo.AdminNoticeVo;
import com.kh.common.vo.PageVo;
import com.kh.memberNotice.Service.NoticeService;

@WebServlet(urlPatterns = "/member/noticeList")
public class NoticeListController extends HttpServlet{
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//페이징 처리
//		int listCount;
//		int currentPage;
//		int pageLimit;
//		int boardLimit;
//		
//		int maxPage;
//		int startPage;
//		int endPage;
//		
//		//listCount값 구하기
//		listCount = new NoticeService().getCount();
//		
//		//currentPage값 구하기
//		currentPage = Integer.parseInt(req.getParameter("p"));
//		
//		//pageLimit값 구하기
//		pageLimit = 5;
//		
//		//boardLimit값 구하기
//		boardLimit = 5;
//		
//		maxPage = (int)Math.ceil((double)(listCount/boardLimit));
//		
//		startPage = (currentPage-1)/pageLimit * pageLimit + 1;
//		
//		endPage = startPage + pageLimit -1;
//		if(endPage>maxPage) {
//			endPage = maxPage;
//		}
//		
//		//vo에 페이지 관련 변수담기
//		PageVo pageVo = new PageVo();
//		pageVo.setBoardLimit(boardLimit);
//		pageVo.setCurrentPage(currentPage);
//		pageVo.setEndPage(endPage);
//		pageVo.setListCount(listCount);
//		pageVo.setMaxPage(maxPage);
//		pageVo.setPageLimit(pageLimit);
//		pageVo.setStartPage(startPage);
//		
//		//게시글 관련 데이터 준비
//		List<AdminNoticeVo> boardVoList = new NoticeService().selectList(pageVo);
//		
//		//준비한 데이터 담기
//		req.setAttribute("pv", pageVo);
//		req.setAttribute("list", boardVoList);
		//화면 보여주기
		req.getRequestDispatcher("/WEB-INF/views/noticeEvent/notice.jsp").forward(req, resp);
	}
}
