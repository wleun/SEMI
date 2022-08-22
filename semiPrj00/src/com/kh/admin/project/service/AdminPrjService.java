package com.kh.admin.project.service;

import static com.kh.common.JDBCTemplate.*;
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

	public int deleteProject(List<String> projectNoList) {
		
		int successCnt = 0;
		int result = 0;
		Connection conn = getConnection();
		
		try {
			
			for (String projectNo : projectNoList) {
				
				result = new AdminPrjDao().deleteProject(conn,projectNo);
				
				if(result==1) {successCnt = successCnt + 1;}
				else {System.out.println("프로젝트 번호" + projectNo + "번 삭제 중 오류 발생");}
				
			}
			
			if(result==1) {commit(conn);}
			else {rollback(conn);}
			
		} catch(Exception e) {
			rollback(conn);
			e.printStackTrace();
		} finally {
			close(conn);
		}
		
		System.out.println(successCnt);
		
		return successCnt;
	}

}
