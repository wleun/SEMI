package com.kh.member.service;

import java.sql.Connection;
import java.util.List;

import static com.kh.common.JDBCTemplate.*;
import com.kh.member.repository.MemberMyprjDao;
import com.kh.project.vo.ProjectVo;

public class MemberMyprjService {
	
	private final MemberMyprjDao dao = new MemberMyprjDao();

	public List<ProjectVo> seletPrj(String[] type) {
		
		Connection conn = getConnection();
		
		
		List<ProjectVo> list = null;
		if(type.length == 3) {
			// 상태 구분 없이, 전체 조회
			list = dao.selectPrjAll(conn, type);
		}else {
			// 상태에 따라 조회
			list = dao.selectPrj(conn, type);
		}
		
		close(conn);
		
		return list;
	}

}
