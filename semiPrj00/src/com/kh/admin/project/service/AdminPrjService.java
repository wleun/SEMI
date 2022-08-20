package com.kh.admin.project.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.kh.admin.member.repository.AdminMemberDao;
import com.kh.admin.member.vo.AdminMemberVo;
import com.kh.admin.project.repository.AdminPrjDao;
import com.kh.admin.project.vo.AdminPrjVo;
import com.kh.common.vo.PageVo;

public class AdminPrjService {

	public int getCount() {
		Connection conn = getConnection();
		int result = new AdminPrjDao().getCount(conn);
		
		close(conn);
		
		return result;
	}

	public List<AdminPrjVo> selectList(PageVo pageVo) {
		Connection conn = getConnection();
		Connection conn2 = getConnection();
		List<AdminPrjVo> adminPrjVoList = new AdminPrjDao().selectList(conn,conn2,pageVo);
		
		close(conn);
		close(conn2);
		return adminPrjVoList;
	}

}
