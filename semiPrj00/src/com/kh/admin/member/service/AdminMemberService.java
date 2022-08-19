package com.kh.admin.member.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.kh.admin.event.repository.AdminEventDao;
import com.kh.admin.event.vo.AdminEventVo;
import com.kh.admin.member.repository.AdminMemberDao;
import com.kh.common.vo.PageVo;
import com.kh.member.vo.MemberVo;

public class AdminMemberService {

	public int getCount() {
		Connection conn = getConnection();
		int result = new AdminMemberDao().getCount(conn);
		
		close(conn);
		
		return result;
	}

	public List<MemberVo> selectList(PageVo pageVo) {
		Connection conn = getConnection();
		List<MemberVo> memberVoList = new AdminMemberDao().selectList(conn,pageVo);
		
		close(conn);
		return memberVoList;
	}

}
