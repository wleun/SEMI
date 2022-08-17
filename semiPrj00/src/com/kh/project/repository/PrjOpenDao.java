package com.kh.project.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.category.vo.CategoryVo;
import static com.kh.common.JDBCTemplate.*;

public class PrjOpenDao {


	//카테고리 조회
	public List<CategoryVo> selectCategoryList(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<CategoryVo> list = new ArrayList<CategoryVo>();
		
		String sql = "SELECT CATEGORY_NO, NAME FROM CATEGORY";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new CategoryVo(rs.getString("CATEGORY_NO"), rs.getString("NAME")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return list;
		
				
	}

	
	
}
