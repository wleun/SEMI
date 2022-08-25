package com.kh.admin.project.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.kh.admin.event.repository.AdminEventDao;
import com.kh.admin.event.vo.AdminEventVo;
import com.kh.admin.member.repository.AdminMemberDao;
import com.kh.admin.member.vo.AdminMemberVo;
import com.kh.admin.project.repository.AdminPrjDao;
import com.kh.admin.project.vo.AdminPrjVo;
import com.kh.common.vo.PageVo;

public class AdminPrjService {

	//페이징 관련 카운트
	
	public int getCount() {
		Connection conn = getConnection();
		int result = new AdminPrjDao().getCount(conn);
		
		close(conn);
		
		return result;
	}

	//페이징 리스트
	public List<AdminPrjVo> selectList(PageVo pageVo) {
		Connection conn = getConnection();
		Connection conn2 = getConnection();
		List<AdminPrjVo> adminPrjVoList = new AdminPrjDao().selectList(conn,conn2,pageVo);
		
		close(conn);
		close(conn2);
		return adminPrjVoList;
	}

	//프로젝트 삭제 (ajax, UPDATE)
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

	//삭제된 프로젝트 조회 (ajax,SELECT)
	public List<AdminPrjVo> selectStatusList(List<String> projectNoList) {
		
		Connection conn = getConnection();
		List<AdminPrjVo> projectVoList = new ArrayList();
		AdminPrjVo resultVo = null;
		
		for (String projectNo : projectNoList) {
			
			resultVo = new AdminPrjDao().selectStatusList(projectNo, conn);
			projectVoList.add(resultVo);
			
		}
		
		close(conn);
		return projectVoList;
		
	}

	//대시보드 - 메인페이지 정보 가져오기 (시작전 프로젝트)
	public List<AdminPrjVo> getBeforePrjData() {
		Connection conn = getConnection();
		
		List<AdminPrjVo> beforePrjVoList = new AdminPrjDao().getBeforePrjData(conn);
		
		close(conn);
		
		return beforePrjVoList;
	}

	//대시보드 - 메인페이지 정보 가져오기 (진행중 프로젝트)
	public List<AdminPrjVo> getPrjData() {
		Connection conn = getConnection();
		
		List<AdminPrjVo> prjVoList = new AdminPrjDao().getPrjData(conn);
		
		close(conn);
		
		return prjVoList;
	}

	//대시보드 - 메인페이지 정보 가져오기 (성공한 프로젝트)
	public List<AdminPrjVo> getSuccessPrjData() {
		Connection conn = getConnection();
		
		List<AdminPrjVo> successPrjData = new AdminPrjDao().getsuccessPrjData(conn);
		
		close(conn);
		
		return successPrjData;
	}

}
