package com.kh.admin.member.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.kh.admin.event.repository.AdminEventDao;
import com.kh.admin.event.vo.AdminEventVo;
import com.kh.admin.member.repository.AdminMemberDao;
import com.kh.admin.member.vo.AdminMemberVo;
import com.kh.admin.project.repository.AdminPrjDao;
import com.kh.common.vo.PageVo;
import com.kh.member.vo.MemberVo;

public class AdminMemberService {

	//페이징 카운트 
	public int getCount() {
		Connection conn = getConnection();
		int result = new AdminMemberDao().getCount(conn);
		
		close(conn);
		
		return result;
	}

	//페이징 리스트 가져오기
	public List<AdminMemberVo> selectList(PageVo pageVo) {
		Connection conn = getConnection();
		Connection conn2 = getConnection();
		List<AdminMemberVo> memberVoList = new AdminMemberDao().selectList(conn,conn2,pageVo);
		
		close(conn);
		close(conn2);
		return memberVoList;
	}

	//맴버 정지
	public int suspendMember(List<String> memberNoList) {
		int successCnt = 0;
		int result = 0;
		Connection conn = getConnection();
		
		try {
			
			for (String memberNo : memberNoList) {
				
				result = new AdminMemberDao().suspendMember(conn,memberNo);
				
				if(result==1) {successCnt = successCnt + 1;}
				else {System.out.println("프로젝트 번호" + memberNo + "번 삭제 중 오류 발생");}
				
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

	//맴버 정지해제
	public int suspendCancelMember(List<String> memberNoList) {
		int successCnt = 0;
		int result = 0;
		Connection conn = getConnection();
		
		try {
			
			for (String memberNo : memberNoList) {
				
				result = new AdminMemberDao().suspendCancelMember(conn,memberNo);
				
				if(result==1) {successCnt = successCnt + 1;}
				else {System.out.println("프로젝트 번호" + memberNo + "번 삭제 중 오류 발생");}
				
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
