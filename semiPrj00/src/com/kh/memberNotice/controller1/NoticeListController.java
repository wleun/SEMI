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
		//페이징 처리------------
		int listCount;		//현재 총 게시글 갯수
		int currentPage;	//현재 페이지(==사용자가 요청한 페이지
		int pageLimit;		//페이지 하단 보여질 페이지 버튼 갯수
		int boardLimit;		//한 페이지 내 보여질 게시글 최대 갯수
		
		int maxPage;		//가장 마지막 페이지(==총 페이지 수)
		int startPage;		//페이징 바 시작
		int endPage;		//페이징 바 끝
		
		//listCount 값 구하기
		listCount = new NoticeService().getCount();//DB에 가서 테이블 총 게시글 갯수 구하기
		
		//currentPage 값 구하기
		currentPage = Integer.parseInt(req.getParameter("p"));
		
		//pageLimit 값 구하기
		pageLimit = 10;
		
		//boardLimit 값 구하기
		boardLimit = 5;
		
		//maxPage 제일 마지막 페이지
		maxPage = (int)Math.ceil(((double)listCount / boardLimit));
		
		//startPage 페이징 바 시작
		startPage = (currentPage-1) / pageLimit * pageLimit + 1;
		
		//endPage 페이지 바 끝
		endPage = startPage + pageLimit -1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		//vo에 페이지 관련 변수 담기
		PageVo pageVo = new PageVo();
		pageVo.setBoardLimit(boardLimit);
		pageVo.setCurrentPage(currentPage);
		pageVo.setEndPage(endPage);
		pageVo.setListCount(listCount);
		pageVo.setMaxPage(maxPage);
		pageVo.setPageLimit(pageLimit);
		pageVo.setStartPage(startPage);
		
		//게시글 관련 데이터 준비 ( 여러개니 list)
		List<AdminNoticeVo> adminNoticeVoList = new NoticeService().selectList(pageVo);
		
		//준비한 데이터 담기
		req.setAttribute("pv", pageVo);
		req.setAttribute("list", adminNoticeVoList);
		
		
		//화면 보여주기
		req.getRequestDispatcher("/WEB-INF/views/noticeEvent/notice.jsp").forward(req, resp);
	}
}
