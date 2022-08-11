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
	
	// getConnection method
	public static Connection getConnection(){
		
		Connection conn = null;
		try {
			Properties prop = new Properties();
			String filePath = JDBCTemplate.class.getResource("/db/setup/data.properties").getPath();
			prop.load(new FileInputStream(filePath));
			
			String driver = prop.getProperty("driver");
			String url = prop.getProperty("url");
			String dbId = prop.getProperty("dbId");
			String dbPwd = prop.getProperty("dbPwd");
			
			Class.forName(driver);
			
			conn = DriverManager.getConnection(url, dbId, dbPwd);
			conn.setAutoCommit(false); // auto commit off
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return conn;
		
	
	}
	
	// Commit
	public static void commit(Connection conn) {
		try {if(conn != null && !conn.isClosed()) conn.commit();} catch (SQLException e) {e.printStackTrace();}
	}
	
	// Rollback
	public static void rollback(Connection conn) {
		try{if(conn != null && !conn.isClosed()) conn.rollback();}catch(SQLException e) {e.printStackTrace();}
	}
	
	// close(Statement)
	public static void close(Statement stmt) {
		try {if(stmt != null && !stmt.isClosed()) {stmt.close();}} catch(Exception e) {e.printStackTrace();}
	}
	
	//close(ResultSet)
	public static void close(ResultSet rs) {
		try {if(rs != null && !rs.isClosed()) {rs.close();}} catch(Exception e) {e.printStackTrace();}

	}
	
	//close(Connection)
	public static void close(Connection conn) {
		try {if(conn != null && !conn.isClosed()) {conn.close();}} catch(Exception e) {e.printStackTrace();}

	}
		
	
}
