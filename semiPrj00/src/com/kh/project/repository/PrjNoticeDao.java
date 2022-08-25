package com.kh.project.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import static com.kh.common.JDBCTemplate.*;
import com.kh.project.notice.vo.ProjectNoticeVo;

public class PrjNoticeDao {

	//공지사항 news 테이블에 인서트
	public int insertNotice(Connection conn, ProjectNoticeVo nvo) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "INSERT INTO NEWS(NO,PROJECT_NO, MEMBER_NO, CONTENT) VALUES(SEQ_NEWS_NO.NEXTVAL,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nvo.getProjectNo());
			pstmt.setString(2, nvo.getMemberNo());
			pstmt.setString(3, nvo.getContent());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

}
