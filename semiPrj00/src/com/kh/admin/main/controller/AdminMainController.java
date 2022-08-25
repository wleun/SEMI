package com.kh.admin.main.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.event.service.AdminEventService;
import com.kh.admin.event.vo.AdminEventVo;
import com.kh.admin.main.service.AdminMainService;
import com.kh.admin.main.vo.AdminMainCountVo;
import com.kh.admin.notice.service.AdminNoticeService;
import com.kh.admin.notice.vo.AdminNoticeVo;
import com.kh.admin.project.service.AdminPrjService;
import com.kh.admin.project.vo.AdminPrjVo;
import com.kh.admin.proposal.service.AdminProposalService;
import com.kh.admin.proposal.vo.AdminProposalVo;
import com.kh.admin.report.service.AdminReportService;
import com.kh.admin.report.vo.AdminReportVo;

@WebServlet(urlPatterns = "/admin/main")
public class AdminMainController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. 카운트 받아오기
		
		AdminMainCountVo cntVo = new AdminMainService().getCounts();
		
		if(cntVo==null) {
			System.out.println("카운트 받아오는 과정에서 에러발생");
			req.setAttribute("errorMsg", "메인 페이지를 불러오는 작업 (카운트) 중 에러가 발생하였습니다.");
			resp.sendRedirect("/semiPrj00/admin/project?p=1");
		}
		
		//2. 신고 정보 가져오기
		List<AdminReportVo> reportVoList = new AdminReportService().getMainData();
		
		if(reportVoList==null) {
			System.out.println("신고정보 받아오는 과정에서 에러발생");
			req.setAttribute("errorMsg", "메인 페이지를 불러오는 작업 (신고 정보 가져오기) 중 에러가 발생하였습니다.");
			resp.sendRedirect("/semiPrj00/admin/project?p=1");
		}
		
		//3. 이벤트 정보 가져오기
		List<AdminEventVo> eventVoList = new AdminEventService().getMainData();
		
		if(eventVoList==null) {
			System.out.println("이벤트정보 받아오는 과정에서 에러발생");
			req.setAttribute("errorMsg", "메인 페이지를 불러오는 작업 (이벤트 정보 가져오기) 중 에러가 발생하였습니다.");
			resp.sendRedirect("/semiPrj00/admin/project?p=1");
		}
		
		//4. 공지사항 정보 가져오기
		List<AdminNoticeVo> noticeVoList = new AdminNoticeService().getMainData();
		
		if(noticeVoList==null) {
			System.out.println("공지사항 정보 받아오는 과정에서 에러발생");
			req.setAttribute("errorMsg", "메인 페이지를 불러오는 작업 (공지사항 정보 가져오기) 중 에러가 발생하였습니다.");
			resp.sendRedirect("/semiPrj00/admin/project?p=1");
		}
		
		//5. 제안서 정보 가져오기
		List<AdminProposalVo> proposalVoList = new AdminProposalService().getMainData();
		
		if(proposalVoList==null) {
			System.out.println("제안서 정보 받아오는 과정에서 에러발생");
			req.setAttribute("errorMsg", "메인 페이지를 불러오는 작업 (제안서 정보 가져오기) 중 에러가 발생하였습니다.");
			resp.sendRedirect("/semiPrj00/admin/project?p=1");
		}
		
		//6. 시작전 프로젝트 정보 가져오기
		List<AdminPrjVo> beforePrjVoList = new AdminPrjService().getBeforePrjData();
		
		if(beforePrjVoList==null) {
			System.out.println("시작전 프로젝트 정보를 받아오는 과정에서 에러발생");
			req.setAttribute("errorMsg", "메인 페이지를 불러오는 작업 (시작전 프로젝트 정보 가져오기) 중 에러가 발생하였습니다.");
			resp.sendRedirect("/semiPrj00/admin/project?p=1");
		}
		
		//7. 진행중 프로젝트 정보 가져오기
		List<AdminPrjVo> prjVoList = new AdminPrjService().getPrjData();
		
		if(prjVoList==null) {
			System.out.println("프로젝트 정보를 받아오는 과정에서 에러발생");
			req.setAttribute("errorMsg", "메인 페이지를 불러오는 작업 (프로젝트 정보 가져오기) 중 에러가 발생하였습니다.");
			resp.sendRedirect("/semiPrj00/admin/project?p=1");
		}
		
		
		//8. 성공한 프로젝트 정보 가져오기
		List<AdminPrjVo> successPrjVoList = new AdminPrjService().getSuccessPrjData();
		
		if(successPrjVoList==null) {
			System.out.println("성공 프로젝트 정보를 받아오는 과정에서 에러발생");
			req.setAttribute("errorMsg", "메인 페이지를 불러오는 작업 (성공 프로젝트 정보 가져오기) 중 에러가 발생하였습니다.");
			resp.sendRedirect("/semiPrj00/admin/project?p=1");
		}
		
		req.setAttribute("cntVo",cntVo);
		req.setAttribute("reportVoList", reportVoList);
		req.setAttribute("eventVoList", eventVoList);
		req.setAttribute("noticeVoList", noticeVoList);
		req.setAttribute("beforePrjVoList", beforePrjVoList);
		req.setAttribute("proposalVoList", proposalVoList);
		req.setAttribute("prjVoList", prjVoList);
		req.setAttribute("successPrjVoList", successPrjVoList);
		req.setAttribute("functionName", "대시보드");
		req.getRequestDispatcher("/WEB-INF/views/admin/main/adminDashboard.jsp").forward(req, resp);
	}
	
	
}
