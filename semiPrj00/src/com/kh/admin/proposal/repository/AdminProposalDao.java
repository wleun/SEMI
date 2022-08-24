package com.kh.admin.proposal.repository;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.kh.admin.attachment.vo.AdminProposalAttachmentVo;
import com.kh.admin.proposal.vo.AdminProposalVo;
import com.kh.common.vo.PageVo;
import com.kh.member.vo.MemberVo;
import com.kh.project.vo.ProjectVo;

public class AdminProposalDao {
	
	//제안서 페이징 카운트

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
	
	//제안서 페이징

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
					vo.setName(name);
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
	
	//상세조회 (제안서)

	public AdminProposalVo selectOne(Connection conn, String no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		AdminProposalVo adminProposalVo = new AdminProposalVo();
		
		String sql = "SELECT P.PROJECT_NO , P.NAME , M.NICK , C.NAME AS CATEGORY_NAME , P.REGISTER_DATE , P.STATUS , TO_CHAR(P.START_DATE,'YYYY-MM-DD') AS START_DATE , TO_CHAR(P.END_DATE,'YYYY-MM-DD') AS END_DATE , P.GOAL , P.SHIPPING_DATE , P.TEXT , P.THUMBNAIL_NAME , P.THUMBNAIL_PATH FROM PROJECT P JOIN MEMBER M ON P.MAKER_NO = M.NO JOIN CATEGORY C USING (CATEGORY_NO) WHERE P.PROJECT_NO = ?";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,no);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				
				String proposalNo = rs.getString("PROJECT_NO");
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
				 
				 
				 adminProposalVo.setNo(no);
				 adminProposalVo.setNick(nick);
				 adminProposalVo.setName(thumbnailName);
				 adminProposalVo.setCategoryName(categoryName);
				 adminProposalVo.setRegisterDate(registerDate);
				 adminProposalVo.setStatus(status);
				 adminProposalVo.setStartDate(startDate);
				 adminProposalVo.setEndDate(endDate);
				 adminProposalVo.setGoal(goal);
				 adminProposalVo.setShippingDate(shippingDate);
				 adminProposalVo.setText(text);
				 adminProposalVo.setThumbnailName(thumbnailName);
				 adminProposalVo.setThumbnailPath(thumbnailPath);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return adminProposalVo;
	}
	
	
	//상세조회 (파일)

	public List<AdminProposalAttachmentVo> selectFile(Connection conn, String no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<AdminProposalAttachmentVo> list = null;
		
		String sql = "SELECT NO, PROJECT_NO, FILE_SRC, ORIGIN_NAME, CHANGE_NAME, UPLOAD_DATE FROM DESCRIPTION_FILE WHERE PROJECT_NO = ? ORDER BY NO ASC ";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,no);
			
			rs=pstmt.executeQuery();
			
			list = new ArrayList<AdminProposalAttachmentVo>();
			
			//while문으로 수정
			
			while(rs.next()) {
				
				AdminProposalAttachmentVo vo = new AdminProposalAttachmentVo();
				
				String path = rs.getString("FILE_SRC");
				String name = rs.getString("CHANGE_NAME");
				
				vo.setFilePath(path);
				vo.setChangeName(name);
				
				list.add(vo);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	public int changeStatus(Connection conn, String option, String no) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = "UPDATE PROJECT SET STATUS=? WHERE PROJECT_NO = ?";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, option);
			pstmt.setString(2, no);
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public String selectStatus(Connection conn, String no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String status = null;
		String sql = "SELECT STATUS FROM PROJECT  WHERE PROJECT_NO = ?";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				status = rs.getString("STATUS");
				
				if("R".equals(status)) {
					status = "접수";
				} else if ("N".equals(status)) {
					status = "반려";
				} else if ("A".equals(status)) {
					status = "검토중";
				} else if ("B".equals(status)) {
					status = "진행전";
				} else if ("I".equals(status)) {
					status = "진행중";
				} else if ("S".equals(status)) {
					status = "펀딩 성공";
				} else if ("F".equals(status)) {
					status = "펀딩 실패";
				} else {
					status = "삭제됨";
				}
			}
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn);
		}
		return status;
	}

}	
