package com.kh.admin.login.service;

import com.kh.admin.login.repository.AdminLoginDao;
import com.kh.admin.login.vo.AdminVo;
import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;

public class AdminLoginService {

	public AdminVo login(AdminVo vo) {
		
		Connection conn = getConnection();
		
		AdminVo loginAdmin = new AdminLoginDao().login(vo,conn);
		
		close(conn);
		
		return loginAdmin;
	}

}
