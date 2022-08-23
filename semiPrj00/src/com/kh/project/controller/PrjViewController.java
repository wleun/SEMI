package com.kh.project.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.vo.MemberVo;
import com.kh.project.service.PrjViewService;
import com.kh.project.service.PrjLikeService;
import com.kh.project.vo.ProjectVo;
import com.kh.reward.vo.ProjectRewardVo;

@WebServlet(urlPatterns = "/project/view")
public class PrjViewController extends HttpServlet {

	//프로젝트 상세페이지 보여주기
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		//클릭한 프로젝트의 프로젝트 번호 받아오기
		String prjNum = req.getParameter("num");
		
		//서버 가서 플젝 번호와 일치하는 프로젝트 vo 조회해오기
		ProjectVo pvo = new PrjViewService().selectProject(prjNum);
		
		//모인금액, 달성률, 남은시간, 총 후원자 수 객체로 가져오기
		new PrjViewService().getTotalDonation(prjNum);
		
		//서버 가서 플젝 번호와 일치하는 리워드 vo 조회해오기
		List<ProjectRewardVo> optionList = new PrjViewService().selectReward(prjNum);
		
		
		
		
		//전달할거 가지고 (  ) jsp 파일로 포워딩
		req.setAttribute("projectVo", pvo);
		req.setAttribute("optionList", optionList);
		req.getRequestDispatcher("/WEB-INF/views/project/projectDescriptionView.jsp").forward(req, resp);
	
	}
	
}
