package com.kh.admin.proposal.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.kh.admin.member.repository.AdminMemberDao;
import com.kh.admin.proposal.repository.AdminProposalDao;
import com.kh.common.vo.PageVo;
import com.kh.member.vo.MemberVo;
import com.kh.project.vo.ProjectVo;

public class AdminProposalService {

	public int getCount() {
		Connection conn = getConnection();
		int result = new AdminProposalDao().getCount(conn);
		
		close(conn);
		
		return result;
	}

	public List<ProjectVo> selectList(PageVo pageVo) {
		Connection conn = getConnection();
		List<ProjectVo> adminProposalVo = new AdminProposalDao().selectList(conn,pageVo);
		
		close(conn);
		return adminProposalVo;
	}

}
