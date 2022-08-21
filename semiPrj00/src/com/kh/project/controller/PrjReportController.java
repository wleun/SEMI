package com.kh.project.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.vo.MemberVo;
import com.kh.project.report.vo.ProjectReportVo;
import com.kh.project.repository.PrjReportDao;
import com.kh.project.service.PrjReportService;
import com.kh.project.vo.ProjectVo;

//프로젝트 신고
@WebServlet(urlPatterns = "/project/report")
public class PrjReportController extends HttpServlet{
	
	//확인용 메서드 추후 삭제!
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ProjectVo pvo = new ProjectVo();
		
		pvo = new PrjReportDao().selectPrj();
		
		req.setAttribute("projectVo", pvo);
	
		req.getRequestDispatcher("/WEB-INF/views/project/projectReport.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		MemberVo memberVo = (MemberVo)req.getSession().getAttribute("loginMember");
		
		if(memberVo == null) { //로그인 상태가 아니면 신고 접수 불가
			req.getSession().setAttribute("alertMsg", "로그인 후 이용 가능한 서비스입니다.");
			resp.sendRedirect(req.getContextPath()+"/member/login");
		}else {
		
		//데이터 가져오기
		String prjNo = req.getParameter("prjNo");
		String memberNo = memberVo.getNo();
		String reportContent = req.getParameter("reportContent");
		
		
		//데이터 뭉치기
		ProjectReportVo reportVo = new ProjectReportVo();
		
		reportVo.setProjectNo(prjNo);
		reportVo.setMemberNo(memberNo);
		reportVo.setContent(reportContent);
		
		
		int result = new PrjReportService().insertReport(reportVo);
		
		if(result == 1) {
			req.getSession().setAttribute("alertMsg", "접수되었습니다. 처리 결과는 별도로 답변을 드리지 않습니다.");
			req.getRequestDispatcher(req.getContextPath()+"/project/view");
		}else {
			req.getSession().setAttribute("alertMsg", "처리 과정에 문제가 발생하였습니다. 다시 시도해 주세요.");
			req.getRequestDispatcher(req.getContextPath()+"/project/view");
		}
	}
		
	}

}
