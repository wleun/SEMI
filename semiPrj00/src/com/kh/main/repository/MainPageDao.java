package com.kh.main.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.kh.project.vo.ProjectVo;

public class MainPageDao {

	//추천
	public List<ProjectVo> selectRecommend(Connection conn) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		//회원 등급이 골드이면서 프로젝트가 진행중이고 프로젝트별 후원 토탈값을 구한 sql문 (상태, 레벨 수정예정)
		String sql = "SELECT * FROM PROJECT P JOIN MEMBER M ON P.MAKER_NO = M.NO JOIN "
				+ "(SELECT p.project_no, SUM(TOTAL) FROM PROJECT P JOIN REWARD R ON p.project_no = r.project_no JOIN "
				+ "(SELECT R.NO, SUM((TO_NUMBER(d.amount)*TO_NUMBER(d.quantity))+TO_NUMBER(NVL(d.additional, 0))) TOTAL FROM REWARD R "
				+ "JOIN DONATE_LIST D ON r.no = d.reward_no GROUP BY R.NO) T ON T.NO = R.NO GROUP BY p.project_no) T ON p.PROJECT_NO = t.PROJECT_NO "
				+ "WHERE P.STATUS = 'S' AND M.M_LEVEL='실버'";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ProjectVo prjVo = new ProjectVo();
				prjVo.setPrjectNo(rs.getString("PROJECT_NO"));
				prjVo.setCategoryNo(rs.getString("CATEGORY_NO"));
				prjVo.setName(sql);;
				prjVo.setEndDate(sql);
				prjVo.setGoal(0);
				prjVo.setMakerNo(sql);
				prjVo.setThumbnailName(sql);
				
				
				
			}
			
			
			
			
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		
		
		return null;
		
		
		
	}

}
