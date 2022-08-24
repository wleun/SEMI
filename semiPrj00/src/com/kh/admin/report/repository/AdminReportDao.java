package com.kh.admin.report.repository;

import static com.kh.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.kh.admin.event.vo.AdminEventVo;
import com.kh.admin.report.vo.AdminReportVo;
import com.kh.common.vo.PageVo;

public class AdminReportDao {

	public int getCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		
		String sql = "SELECT COUNT(NO) AS COUNT FROM REPORT WHERE REPORT_AC = 'A'";
		
		try {
			
			pstmt=conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt("COUNT");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return count;
	}

	public List<AdminReportVo> selectList(Connection conn, PageVo pageVo) {
		List<AdminReportVo> list = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="SELECT * FROM ( SELECT ROWNUM AS RNUM , T.* FROM ( SELECT R.NO , M.NICK , P.NAME , R.CONTENT , R.SUBMIT_DATE , R.REPORT_AC FROM REPORT R JOIN MEMBER M ON R.MEMBER_NO = M.NO JOIN PROJECT P USING (PROJECT_NO) WHERE R.REPORT_AC = 'A' ORDER BY R.NO DESC ) T ) WHERE RNUM BETWEEN ? AND ?";
		
		try {
			int start = (pageVo.getCurrentPage()-1)*pageVo.getBoardLimit() + 1;
			int end = start + pageVo.getBoardLimit() - 1;
			
			pstmt= conn.prepareStatement(sql);
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			list = new ArrayList<AdminReportVo>();
			
			while(rs.next()) {
				
				AdminReportVo vo = new AdminReportVo();
				
				String no = rs.getString("NO");
				String projectName = rs.getString("NAME");
				String memberNick = rs.getString("NICK");
				String content = rs.getString("CONTENT");
				String submitDate = rs.getString("SUBMIT_DATE");
				String reportAc = rs.getString("REPORT_AC");
				if("A".equals(reportAc)) {
					reportAc = "접수";
				}
				
				
				vo.setNo(no);
				vo.setProjectName(projectName);
				vo.setMemberNick(memberNick);
				vo.setContent(content);
				vo.setSubmitDate(submitDate);
				vo.setReportAc(reportAc);
				
				list.add(vo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}

		return list;
		
	}

	public int reportComplete(Connection conn, String no) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "UPDATE REPORT SET REPORT_AC = 'C' WHERE NO = ? ";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, no);
			
			result=pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

}
