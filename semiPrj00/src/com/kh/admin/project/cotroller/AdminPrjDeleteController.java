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
import com.kh.admin.project.service.AdminPrjService;

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
		
		
		if (result == listSize) {
			System.out.println(result + "횟수만큼 삭제 완료");
		} else {
			System.out.println(result + "횟수만큼의 삭제 실패");
		}
		
		//클라이언트에 응답
		resp.setCharacterEncoding("UTF-8");
		
		String answer = result + "회 삭제 완료했습니다.";
		resp.getWriter().write(answer);
		
	}
	
}
