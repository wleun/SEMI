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

	//삭제 예정
	public ProjectVo selectPrj() {
		Connection conn = getConnection();
		ProjectVo pvo = null;
		
		String sql = "select * from project where project_no = 4";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				pvo = new ProjectVo();
				pvo.setPrjectNo(rs.getString(1));
				pvo.setCategoryNo(rs.getString(2));
				pvo.setName(rs.getString(3));
				pvo.setRegisterDate(rs.getString(4));
				pvo.setStartDate(rs.getString(5));
				pvo.setEndDate(rs.getString(6));
				pvo.setGoal(rs.getInt(7));
				pvo.setMakerNo(rs.getString(8));
				pvo.setText(rs.getString(9));
				pvo.setAccountNo(rs.getString(10));
				pvo.setShippingDate(rs.getString(11));
				pvo.setThumbnailName(rs.getString(12));
				pvo.setThumbnailPath(rs.getString(13));
				pvo.setEtc(rs.getString(14));
				pvo.setAccountBank(rs.getString(15));
				pvo.setAccountName(rs.getString(16));
				pvo.setMakerInfo(rs.getString(17));
				pvo.setStatus(rs.getString(18));
	
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 
		return pvo;
	}

}
