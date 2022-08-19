package com.kh.admin.proposal.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet (urlPatterns = "/admin/proposal")
public class AdminProposalController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("functionName", "제안서 관리");
		req.getRequestDispatcher("/WEB-INF/views/admin/proposal/adminProposalView.jsp").forward(req, resp);
	}
}
