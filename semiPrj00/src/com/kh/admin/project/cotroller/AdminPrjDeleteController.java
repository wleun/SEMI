package com.kh.admin.project.cotroller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.admin.project.repository.AdminPrjDao;
import com.kh.admin.project.service.AdminPrjService;
import com.kh.admin.project.vo.AdminPrjVo;

@WebServlet (urlPatterns = "/admin/project/delete")
public class AdminPrjDeleteController extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String[] checkBoxArr = req.getParameterValues("key");
		List<String> projectNoList = new ArrayList<String>();
				
		for (String projectNo : checkBoxArr) {
			projectNoList.add(projectNo);
		}
		
		int listSize = projectNoList.size();
		int result = new AdminPrjService().deleteProject(projectNoList);
		
		System.out.println("리스트 사이즈 : " + listSize);
		System.out.println("성공 횟수 : " + result);
		
		
		
		List<AdminPrjVo> projectVoList = null;
		if (result == listSize) {
			
			projectVoList = new AdminPrjService().selectStatusList(projectNoList);
			
			if(projectVoList==null) {
				System.out.println("프로젝트 삭제 후 상태 조회 실패");
				req.getSession().setAttribute("errorMsg", "삭제에 성공하였으나, 상태 조회에 실패하였습니다.");
				resp.sendRedirect("/semiPrj00/admin/project?p=1");
			}
			
		} else {
			System.out.println("삭제 실패");
			req.getSession().setAttribute("errorMsg", "삭제에 실패하였습니다.");
			resp.sendRedirect("/semiPrj00/admin/project?p=1");
		}
		
		//디비에 가서, status 조회.
		//조회결과를 배열로 만들어서 응답하기
		// 화면 : ajax -> 컨 - 서 - 디 - 서 - 컨 - 서 - 디 - 서 - 컨 . 결과 . 응답
		
		System.out.println("삭제 후 프로젝트 상태조회 성공");
		resp.setCharacterEncoding("UTF-8");
		
		//GSON으로 자바 객체 -> JSON포맷 변환
		Gson gson =  new Gson();
				
		String jsonStr = gson.toJson(projectVoList);
		resp.getWriter().write(jsonStr);
		
		
		//클라이언트에 응답
		
		
		
		
		
//		resp.setCharacterEncoding("UTF-8");
//		
//		String answer = result + "회 삭제 완료했습니다.";
//		resp.getWriter().write("[D,D,D,D,D]");
		
	}
	
}
