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

@WebFilter(urlPatterns = "/admin/main")
public class AdminMainFilter implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
			
		AdminVo loginAdmin = (AdminVo) ((HttpServletRequest)request).getSession().getAttribute("loginAdmin");
		
		if(loginAdmin != null) {
			chain.doFilter(request, response);
		} else {
			((HttpServletResponse)response).sendRedirect("/webPrj00/admin/login");
		}
	}

}
