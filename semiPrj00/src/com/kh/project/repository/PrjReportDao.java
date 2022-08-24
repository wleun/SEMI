package com.kh.project.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.kh.project.report.vo.ProjectReportVo;
import com.kh.project.vo.ProjectVo;

import static com.kh.common.JDBCTemplate.*;

public class PrjReportDao {

	//신고 insert
	public int insertReport(Connection conn, ProjectReportVo reportVo) throws Exception {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = "INSERT INTO REPORT (NO, PROJECT_NO, MEMBER_NO, CONTENT) VALUES (SEQ_REPORT_NO.nextval, ?, ?, ?)";
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, reportVo.getProjectNo());
			pstmt.setString(2, reportVo.getMemberNo());
			pstmt.setString(3, reportVo.getContent());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			throw e;
		} finally {
			close(pstmt);
		}
		
		return result;
		
		
	}

	

}
