package com.kh.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.vo.PageVo;
import com.kh.member.service.MemberMysponsorService;
import com.kh.member.vo.MemberVo;
import com.kh.memberNotice.Service.EventService;
import com.kh.project.vo.SupportVo;

@WebServlet(urlPatterns = "/member/mysponsor")
public class MemberMysponsorController2 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//로그인 정보 가져오기
				MemberVo loginMember = (MemberVo)req.getSession().getAttribute("loginMember");
				String loginNo = loginMember.getNo();
		
		//--------페이징 처리
		
		
			//listCount 구하기(총게시글수)
			int listCount = new MemberMysponsorService().getCount(loginNo);
			
			//currentPage 구하기
			int currentPage = Integer.parseInt(req.getParameter("p"));
			
			//pageLimit 구하기
			int pageLimit = 5;
			
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
		
		
		List<SupportVo> sponList = new MemberMysponsorService().mySponList(loginNo,pageVo);
		
		req.setAttribute("pv", pageVo);
		req.setAttribute("sponList", sponList);
		req.getRequestDispatcher("/WEB-INF/views/member/memberMySponsorPage.jsp").forward(req, resp);
		
	}
	
}
