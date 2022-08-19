package com.kh.admin.login.repository;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.kh.admin.login.vo.AdminVo;

public class AdminLoginDao {

	public AdminVo login(AdminVo vo, Connection conn) {
		
		AdminVo loginAdmin = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT NO,ID,PWD,NAME FROM ADMIN WHERE ID=? AND PWD=?";
		
		try {
			
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPwd());
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				String no = rs.getString("NO");
				String id = rs.getString("ID");
				String pwd = rs.getString("PWD");
				String name = rs.getString("NAME");
				
				loginAdmin = new AdminVo();
				
				loginAdmin.setNo(no);
				loginAdmin.setId(id);
				loginAdmin.setPwd(pwd);
				loginAdmin.setName(name);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		
		
		return loginAdmin;
	}

}
