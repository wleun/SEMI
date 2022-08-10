package com.kh.common;

import java.sql.Statement;
import java.util.Properties;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JDBCTemplate {
	
	public static Connection getConnection() throws Exception {
		
			Properties prop = new Properties();
			String filePath = JDBCTemplate.class.getResource("/db/setup/data.properties").getPath();
			prop.load(new FileInputStream(filePath));
			
			String driver = prop.getProperty("driver");
			String url = prop.getProperty("url");
			String dbId = prop.getProperty("dbId");
			String dbPwd = prop.getProperty("dbPwd");
			
			Class.forName(driver);
			
			Connection conn = DriverManager.getConnection(url, dbId, dbPwd);
			conn.setAutoCommit(false);
			return conn;
		
	
	}
	
	public static void commit(Connection conn) {
		try {if(conn != null) conn.commit();} catch (SQLException e) {e.printStackTrace();}
	}
	
	public static void rollback(Connection conn) {
		try{if(conn != null) conn.rollback();}catch(SQLException e) {e.printStackTrace();}
	}
	
	public static void close(Statement stmt) {
		try {if(stmt != null) {stmt.close();}} catch(Exception e) {e.printStackTrace();}
	}
	
	public static void close(ResultSet rs) {
		try {if(rs != null) {rs.close();}} catch(Exception e) {e.printStackTrace();}

	}
	
	public static void close(Connection conn) {
		try {if(conn != null) {conn.close();}} catch(Exception e) {e.printStackTrace();}

	}
		
	
}
