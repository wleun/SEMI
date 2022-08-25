package com.kh.member.repository;

import static com.kh.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.kh.member.vo.ProjectLikeVo;

public class MemberMylikeDao {

	public List<ProjectLikeVo> selectList(Connection conn, String no) {

		String sql = "SELECT P.PROJECT_NO, P.NAME, P.REGISTER_DATE, P.GOAL, L.NO FROM PROJECT_LIKE L INNER JOIN PROJECT P ON P.PROJECT_NO = L.PROJECT_NO WHERE MEMBER_NO = ? AND L.STATUS = 'N'";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<ProjectLikeVo> list = new ArrayList<ProjectLikeVo>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, no);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String prjNo = rs.getString("PROJECT_NO");
				String name = rs.getString("NAME");
				String reDate = rs.getString("REGISTER_DATE");
				String goal = rs.getString("GOAL");
				String likeNo = rs.getString("NO");
				
				ProjectLikeVo vo = new ProjectLikeVo();
				vo.setProjectNo(prjNo);
				vo.setProjectName(name);
				vo.setRegisterDate(reDate);
				vo.setGoal(goal);
				vo.setNo(likeNo);
				
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

}
