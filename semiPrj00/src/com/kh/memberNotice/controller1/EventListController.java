package com.kh.memberNotice.controller1;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.event.vo.AdminEventVo;
import com.kh.common.vo.PageVo;
import com.kh.memberNotice.Service.EventService;
import com.kh.memberNotice.Service.NoticeService;

@WebServlet(urlPatterns = "/member/eventList")
public class EventListController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//--------페이징 처리
		
	
		//listCount 구하기(총게시글수)
		int listCount = new EventService().getCount();
		
		//currentPage 구하기
		int currentPage = Integer.parseInt(req.getParameter("p"));
		
		//pageLimit 구하기
		int pageLimit = 10;
		
		//boardLimit 값 구하기(한 페이지 내 게시글 수)
		int boardLimit = 4;
		
		//maxPage값 구하기(총 페이지 수)
		int maxPage = (int)Math.ceil(((double)listCount / boardLimit));
		
		//startPage (페이징바 시작)
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		//endPage (페이징바 끝)
		int endPage = startPage + pageLimit -1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		//vo페이지 관련 변수담기
		PageVo pageVo = new PageVo();
		pageVo.setBoardLimit(boardLimit);
		pageVo.setCurrentPage(currentPage);
		pageVo.setEndPage(endPage);
		pageVo.setListCount(listCount);
		pageVo.setMaxPage(maxPage);
		pageVo.setPageLimit(pageLimit);
		pageVo.setStartPage(startPage);

		List<AdminEventVo> EventVoList = new EventService().selectList(pageVo);
		
		req.setAttribute("pv", pageVo);
		req.setAttribute("list", EventVoList);
				
		req.getRequestDispatcher("/WEB-INF/views/noticeEvent/event.jsp").forward(req, resp);
	}
}
