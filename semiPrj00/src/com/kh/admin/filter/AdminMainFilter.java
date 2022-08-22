package com.kh.admin.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.login.vo.AdminVo;

@WebFilter(urlPatterns = "/admin/*")
public class AdminMainFilter implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		
		String path = ((HttpServletRequest)request).getRequestURI();
		AdminVo loginAdmin = (AdminVo) ((HttpServletRequest)request).getSession().getAttribute("loginAdmin");
		
		if(loginAdmin != null) {
			chain.doFilter(request, response);
			
		} else {
			if(path.contains("/login")) {
				((HttpServletRequest)request).getRequestDispatcher("/admin/login").forward(request, response);
			} else {
			((HttpServletRequest)request).getSession().setAttribute("errorMsg","잘못된 접근입니다. 해당 사이트는 로그인 후 이용해주시길 바랍니다.");
			((HttpServletResponse)response).sendRedirect("/semiPrj00/admin/login");
		
			}
		}

	}
	
}
