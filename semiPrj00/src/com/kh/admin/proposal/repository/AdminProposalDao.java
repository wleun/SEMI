package com.kh.admin.proposal.repository;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.kh.admin.proposal.vo.AdminProposalVo;
import com.kh.common.vo.PageVo;
import com.kh.member.vo.MemberVo;
import com.kh.project.vo.ProjectVo;

public class AdminProposalDao {

	public int getCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		
		String sql = "SELECT COUNT(PROJECT_NO) AS COUNT FROM PROJECT";
		
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

	public List<AdminProposalVo> selectList(Connection conn, PageVo pageVo) {
		
		
		List<AdminProposalVo> list = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql= "SELECT * FROM ( SELECT ROWNUM AS RNUM , T.* FROM ( SELECT P.PROJECT_NO , P.NAME , M.NICK , C.NAME AS CATEGORY_NAME , P.REGISTER_DATE , P.STATUS , P.START_DATE , P.END_DATE , P.GOAL , P.SHIPPING_DATE , P.TEXT , P.THUMBNAIL_NAME , P.THUMBNAIL_PATH FROM PROJECT P JOIN MEMBER M ON P.MAKER_NO = M.NO JOIN CATEGORY C USING (CATEGORY_NO) ORDER BY P.PROJECT_NO DESC ) T ) WHERE RNUM BETWEEN ? AND ?";
		
		try {
				int start = (pageVo.getCurrentPage()-1)*pageVo.getBoardLimit() + 1;
				int end = start + pageVo.getBoardLimit() - 1;
				
				pstmt= conn.prepareStatement(sql);
				
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
				
				rs = pstmt.executeQuery();
				
				list = new ArrayList<AdminProposalVo>();
			
				while(rs.next()) {
					
					AdminProposalVo vo = new AdminProposalVo();
					
					String no = rs.getString("PROJECT_NO");
					String nick = rs.getString("NICK");
					String name = rs.getString("NAME");
					String categoryName = rs.getString("CATEGORY_NAME");
					String registerDate = rs.getString("REGISTER_DATE");
					String status = rs.getString("STATUS");
					String startDate = rs.getString("START_DATE");
					String endDate = rs.getString("END_DATE");
					int goal = rs.getInt("GOAL");
					String shippingDate = rs.getString("SHIPPING_DATE");
					String text = rs.getString("TEXT");
				    String thumbnailName = rs.getString("THUMBNAIL_NAME");
				    String thumbnailPath = rs.getString("THUMBNAIL_PATH");
					
				    
				    if("R".equals(status)) {
				    	status = "접수";
				    } else if("N".equals(status)) {
				    	status = "반려";
				    } else if("A".equals(status)) {
				    	status = "검토중";
				    } else if("B".equals(status)) {
				    	status = "프로젝트 진행전";
				    } else if("I".equals(status)) {
				    	status = "프로젝트 진행중";
				    } else if("S".equals(status)) {
				    	status = "프로젝트 성공";
				    } else if("F".equals(status)) {
				    	status = "프로젝트 실패";
				    } else {
				    	status = "삭제됨";
				    }
				    
				    
				    
				    
				    
				    
					vo.setNo(no);
					vo.setNick(nick);
					vo.setName(thumbnailName);
					vo.setCategoryName(categoryName);
					vo.setRegisterDate(registerDate);
					vo.setStatus(status);
					vo.setStartDate(startDate);
					vo.setEndDate(endDate);
					vo.setGoal(goal);
					vo.setShippingDate(shippingDate);
					vo.setText(text);
					vo.setThumbnailName(thumbnailName);
					vo.setThumbnailPath(thumbnailPath);
					
					list.add(vo);
				    
				
				}
			
			
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close(conn);
				close(pstmt);
			}
		
		
			return list;

	}
	
}	
