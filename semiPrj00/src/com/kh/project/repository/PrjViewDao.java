package com.kh.project.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static com.kh.common.JDBCTemplate.*;

import com.kh.project.notice.vo.ProjectNoticeVo;
import com.kh.project.vo.ProjectVo;
import com.kh.reward.vo.ProjectRewardVo;

public class PrjViewDao {

	//번호에 해당하는 플젝 조회해오기
	public ProjectVo selectProject(Connection conn, String prjNum) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProjectVo pvo = null;
		
		String sql = "SELECT P.PROJECT_NO, C.NAME AS CATEGORY_NO, P.NAME, TO_CHAR(P.REGISTER_DATE,'YY/MM/DD') AS REGISTER_DATE, TO_CHAR(P.START_DATE,'YYYY.MM.DD') AS START_DATE, TO_CHAR(P.END_DATE,'YYYY.MM.DD') AS END_DATE, P.GOAL, M.NICK AS MAKER_NO, P.TEXT, P.ACCOUNT_NO, TO_CHAR(P.SHIPPING_DATE,'YYYY.MM.DD') AS SHIPPING_DATE, P.THUMBNAIL_NAME, P.THUMBNAIL_PATH, P.ETC, P.ACCOUNT_BANK, P.ACCOUNT_NAME, P.MAKER_INFO, P.STATUS FROM PROJECT P JOIN CATEGORY C ON P.CATEGORY_NO = C.CATEGORY_NO JOIN MEMBER M ON P.MAKER_NO = M.NO WHERE P.PROJECT_NO = ?";
		System.out.println("pvo 조회: 여기까지 왔나?!");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, prjNum);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String projectNo = rs.getString("PROJECT_NO");
				String categoryNo = rs.getString("CATEGORY_NO");
				String name = rs.getString("NAME");
				String registerDate = rs.getString("REGISTER_DATE");
				String startDate = rs.getString("START_DATE");
				String endDate = rs.getString("END_DATE");
				int goal = rs.getInt("GOAL");
				String makerNo = rs.getString("MAKER_NO");
				String text = rs.getString("TEXT");
				String accountNo = rs.getString("ACCOUNT_NO");
				String shippingDate = rs.getString("SHIPPING_DATE");
				String thumbnailName = rs.getString("THUMBNAIL_NAME");
				String thumbnailPath = rs.getString("THUMBNAIL_PATH");
				String etc = rs.getString("ETC");
				String accountBank = rs.getString("ACCOUNT_BANK");
				String accountName = rs.getString("ACCOUNT_NAME");
				String makerInfo = rs.getString("MAKER_INFO");
				String status = rs.getString("STATUS");
				
				pvo = new ProjectVo();
				pvo.setPrjectNo(projectNo);
				pvo.setCategoryNo(categoryNo);
				pvo.setName(name);
				pvo.setRegisterDate(registerDate);
				pvo.setStartDate(startDate);
				pvo.setEndDate(endDate);
				pvo.setGoal(goal);
				pvo.setMakerNo(makerNo);
				pvo.setText(text);
				pvo.setAccountNo(accountNo);
				pvo.setShippingDate(shippingDate);
				pvo.setThumbnailName(thumbnailName);
				pvo.setThumbnailPath(thumbnailPath);
				pvo.setEtc(etc);
				pvo.setAccountBank(accountBank);
				pvo.setAccountName(accountName);
				pvo.setMakerInfo(makerInfo);
				pvo.setStatus(status);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		System.out.println("서비스로 전달할 pvo:"+pvo);
		return pvo;
	}

	//리워드 옵션 조회해오기
	public List<ProjectRewardVo> selectReward(Connection conn, String prjNum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProjectRewardVo> list = new ArrayList<ProjectRewardVo>();
		
		String sql = "SELECT NO,\"OPTION\",DETAIL,PRICE,QUANTITY FROM REWARD WHERE PROJECT_NO = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, prjNum);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String no = rs.getString("NO");
				String optionName = rs.getString("\"OPTION\"");
				String detail = rs.getString("DETAIL");
				String price = rs.getString("PRICE");
				String quantity = rs.getString("QUANTITY");
				
				ProjectRewardVo rvo = new ProjectRewardVo();
				rvo.setNo(no);
				rvo.setOption(optionName);
				rvo.setDetail(detail);
				rvo.setPrice(price);
				rvo.setQuantity(quantity);
				
				list.add(rvo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return list;
	}


	public int getTotalDonation(Connection conn, String prjNum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int sum = 0;
		String sql = "SELECT SUM(D.AMOUNT) AS AMOUNT FROM DONATE_LIST D JOIN REWARD R ON D.REWARD_NO = R.NO WHERE CANCEL_YN = 'N' AND R.PROJECT_NO = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, prjNum);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				sum = rs.getInt("AMOUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		System.out.println("dao의 sum 값:"+sum);
		return sum;
	}

	//공지사항 존재하는지 확인
	public List<ProjectNoticeVo> selectNotice(Connection conn, String prjNum) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProjectNoticeVo> noticeList = new ArrayList<ProjectNoticeVo>();
		
		String sql = "SELECT M.NICK AS MEMBER_NO, N.CONTENT, TO_CHAR(N.NEWS_DATE, 'YYYY/MM/DD') AS NEWS_DATE FROM NEWS N JOIN MEMBER M ON N.MEMBER_NO = M.NO WHERE N.PROJECT_NO = ? AND N.DELETE_YN = 'N'";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, prjNum);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String member = rs.getString("MEMBER_NO");
				String content = rs.getString("CONTENT");
				String newsDate = rs.getString("NEWS_DATE");
				
				ProjectNoticeVo nvo = new ProjectNoticeVo();
				nvo.setMemberNo(member);
				nvo.setContent(content);
				nvo.setNewsDate(newsDate);
				
				noticeList.add(nvo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		System.out.println("noticeList값:"+noticeList);
		return noticeList;
	}

	//총 후원자 수 계산하기
	public String getTotalDonator(Connection conn, String prjNum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String count = null;
		String sql = "SELECT TO_CHAR(COUNT(MEMBER_NO),'999,999') AS MEMBER_NO FROM DONATE_LIST D JOIN REWARD R ON D.REWARD_NO = R.NO WHERE CANCEL_YN = 'N' AND R.PROJECT_NO = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, prjNum);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getString("MEMBER_NO");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return count;
	}

	//카테고리번호 조회해오기
	public String getCategoryNo(Connection conn, String prjNum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String categoryNo = null;
		String sql = "SELECT CATEGORY_NO FROM PROJECT WHERE PROJECT_NO = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, prjNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				categoryNo = rs.getString("CATEGORY_NO");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return categoryNo;
	}

	//상세페이지 이미지 가져오기
	public List<String> getDescriptionImage(Connection conn, String prjNum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String> pathList = new ArrayList<String>();
 		
		String sql = "SELECT FILE_SRC,CHANGE_NAME FROM DESCRIPTION_FILE WHERE PROJECT_NO = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, prjNum);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String fileSrc = rs.getString("FILE_SRC");
				String changeName = rs.getString("CHANGE_NAME");
				
				String path = fileSrc.substring(fileSrc.length()-17,fileSrc.length())+"\\"+changeName;
				
				pathList.add(path);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		System.out.println("dao에서 경로list:"+pathList);
		return pathList;
	}
}
