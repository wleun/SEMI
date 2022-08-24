package com.kh.main.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import static com.kh.common.JDBCTemplate.*;

import com.kh.project.vo.ProjectVo;

public class MainPageDao {

	//추천 그룹 select
	public List<ProjectVo> selectRecommend(Connection conn) throws Exception {
		
		List<ProjectVo> recommendList = new ArrayList<ProjectVo>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		//회원 등급이 골드이면서 프로젝트가 진행중이고 프로젝트별 후원 토탈값을 구한 sql문 (상태, 레벨 수정예정)
		String sql = "SELECT p.*, m.*, c.name categoty_name, total FROM PROJECT P JOIN MEMBER M ON P.MAKER_NO = M.NO JOIN category C ON p.category_no = c.category_no "
				+ "	JOIN (SELECT p.project_no, SUM(TOTAL) total FROM PROJECT P JOIN REWARD R ON p.project_no = r.project_no "
				+ "	JOIN (SELECT R.NO, SUM((TO_NUMBER(d.amount)*TO_NUMBER(d.quantity))+TO_NUMBER(NVL(d.additional, 0))) total FROM REWARD R"
				+ "	JOIN DONATE_LIST D ON r.no = d.reward_no GROUP BY R.NO) T ON T.NO = R.NO GROUP BY p.project_no) T ON p.project_no = t.PROJECT_NO ";
				//+ "WHERE P.STATUS = 'I' AND M.M_LEVEL='골드'";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				if(recommendList.size() == 6) { //6개 정보만 가져오기
					break;
				}else {
				
				ProjectVo prjVo = new ProjectVo();
				prjVo.setPrjectNo(rs.getString("PROJECT_NO")); //프로젝트 번호
				prjVo.setCategoryNo(rs.getString("categoty_name")); //카테고리 이름
				prjVo.setName(rs.getString("NAME")); //프로젝트 타이틀
				prjVo.setStartDate(rs.getString("START_DATE")); //시작날짜
				prjVo.setEndDate(rs.getString("END_DATE")); //마감날짜
				prjVo.setGoal(rs.getInt("goal")); //목표금액
				prjVo.setEtc(rs.getString("TOTAL")); //총 모인금액 (임시로 etc에 넣기)
				prjVo.setMakerNo(rs.getString("NICK")); //메이커 닉네임 
				prjVo.setThumbnailName(rs.getString("THUMBNAIL_NAME")); //썸네일 파일명
				
				recommendList.add(prjVo);

				}
			}
			
		} catch (SQLException e) {
			throw e;
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return recommendList;
		

	}

	public List<ProjectVo> selectEarly(Connection conn) throws Exception {
		List<ProjectVo> earlyList = new ArrayList<ProjectVo>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		//신규
		String sql = "SELECT p.*, m.*, c.name categoty_name, total FROM PROJECT P JOIN MEMBER M ON P.MAKER_NO = M.NO"
				+ "JOIN category C ON p.category_no = c.category_no"
				+ "JOIN (SELECT p.project_no, SUM(TOTAL) total FROM PROJECT P JOIN REWARD R ON p.project_no = r.project_no"
				+ "JOIN (SELECT R.NO, SUM((TO_NUMBER(d.amount)*TO_NUMBER(d.quantity))+TO_NUMBER(NVL(d.additional, 0))) total"
				+ "FROM REWARD R JOIN DONATE_LIST D ON r.no = d.reward_no GROUP BY R.NO) T ON T.NO = R.NO GROUP BY p.project_no)"
				+ "ON p.project_no = t.PROJECT_NO WHERE P.STATUS = 'R' AND p.end_date=TO_CHAR(SYSDATE, 'YYYY/MM/DD')";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				if(earlyList.size() == 6) { //6개 정보만 가져오기
					break;
				}else {
				
				ProjectVo prjVo = new ProjectVo();
				prjVo.setPrjectNo(rs.getString("PROJECT_NO")); //프로젝트 번호
				prjVo.setCategoryNo(rs.getString("categoty_name")); //카테고리 이름
				prjVo.setName(rs.getString("NAME")); //프로젝트 타이틀
				prjVo.setEndDate(rs.getString("END_DATE")); //마감날짜
				prjVo.setGoal(rs.getInt("TOTAL")); //총 모인금액
				prjVo.setMakerNo(rs.getString("NICK")); //메이커 닉네임 
				prjVo.setThumbnailName(rs.getString("THUMBNAIL_NAME")); //썸네일 파일명
				
				earlyList.add(prjVo);

				}
			}
			
		} catch (SQLException e) {
			throw e;
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return earlyList;
	}

	public List<ProjectVo> selectDeadline(Connection conn) throws Exception {
		List<ProjectVo> deadlineList = new ArrayList<ProjectVo>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		//마감날짜가 오늘이고 프로젝트별 후원 토탈값을 구한 sql문 (상태 수정예정)
		String sql = "SELECT p.*, m.*, c.name categoty_name, total FROM PROJECT P JOIN MEMBER M ON P.MAKER_NO = M.NO JOIN category C ON p.category_no = c.category_no "
				+ "JOIN (SELECT p.project_no, SUM(TOTAL) total FROM PROJECT P JOIN REWARD R ON p.project_no = r.project_no "
				+ "JOIN (SELECT R.NO, SUM((TO_NUMBER(d.amount)*TO_NUMBER(d.quantity))+TO_NUMBER(NVL(d.additional, 0))) total FROM REWARD R "
				+ "JOIN DONATE_LIST D ON r.no = d.reward_no GROUP BY R.NO) T ON T.NO = R.NO GROUP BY p.project_no) T ON p.project_no = t.PROJECT_NO "
				+ "WHERE P.STATUS = 'R' AND p.end_date=TO_CHAR(SYSDATE, 'YYYY/MM/DD')";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				if(deadlineList.size() == 6) { //6개 정보만 가져오기
					break;
				}else {
				
				ProjectVo prjVo = new ProjectVo();
				prjVo.setPrjectNo(rs.getString("PROJECT_NO")); //프로젝트 번호
				prjVo.setCategoryNo(rs.getString("categoty_name")); //카테고리 이름
				prjVo.setName(rs.getString("NAME")); //프로젝트 타이틀
				prjVo.setEndDate(rs.getString("END_DATE")); //마감날짜
				prjVo.setGoal(rs.getInt("TOTAL")); //총 모인금액
				prjVo.setMakerNo(rs.getString("NICK")); //메이커 닉네임 
				prjVo.setThumbnailName(rs.getString("THUMBNAIL_NAME")); //썸네일 파일명
				
				deadlineList.add(prjVo);

				}
			}
			
		} catch (SQLException e) {
			throw e;
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return deadlineList;
	}

}
