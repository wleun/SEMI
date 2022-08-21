package com.kh.project.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.project.service.PrjSupportService;
import com.kh.project.vo.ProjectVo;
import com.kh.reward.vo.ProjectRewardVo;

@WebServlet(urlPatterns = "/project/support")
public class PrjSupportController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String num = req.getParameter("num");
		String reward = req.getParameter("reward");
		
		if(num != null && reward != null) {
			
			ProjectVo prjVo = new PrjSupportService().selectPrj(num);
			ProjectRewardVo rewardVo = new PrjSupportService().selectReward(reward);
			
			req.setAttribute("prjVo", prjVo);
			req.setAttribute("rewardVo", rewardVo);
			
			if(prjVo != null && rewardVo != null) {
				if(!(num.equals(rewardVo.getProjectNo()))) {
					req.getSession().setAttribute("alertMsg", "리워드가 일치하지 않습니다.");
					resp.sendRedirect(req.getContextPath());
				}else {
					req.getRequestDispatcher("/WEB-INF/views/project/supportForm.jsp").forward(req, resp);
				}
			}else {
				req.getSession().setAttribute("alertMsg", "프로젝트를 불러오지 못했습니다.");
				resp.sendRedirect(req.getContextPath()+"/project/view?num=" + num);
			}
		}else {
			req.getSession().setAttribute("alertMsg", "유효하지 않은 페이지입니다.");
			resp.sendRedirect(req.getContextPath());
		}
	}//doget
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
	}//dopost
	
}//class
