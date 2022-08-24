package com.kh.project.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.kh.project.notice.vo.ProjectNoticeVo;
import com.kh.project.repository.PrjViewDao;
import com.kh.project.vo.ProjectVo;
import com.kh.reward.vo.ProjectRewardVo;

public class PrjViewService {

	PrjViewDao dao = new PrjViewDao();
	
	//플젝 조회해오기
	public ProjectVo selectProject(String prjNum) {

		Connection conn = getConnection();
		
		ProjectVo pvo = dao.selectProject(conn, prjNum);
		
		if(pvo != null) {
			close(conn);
		}else {
			System.out.println("pvo 받아오기 실패");
		}
		
		return pvo;
		
	}

	//리워드 옵션 조회해오기
	public List<ProjectRewardVo> selectReward(String prjNum) {
		
		Connection conn = getConnection();
		
		List<ProjectRewardVo> list = dao.selectReward(conn, prjNum);
		
		if(list != null) {
			close(conn);
		}
		
		return list;
	}


	//총 후원금액 계산하기
	public int getTotalDonation(String prjNum) {
		Connection conn = getConnection();
		int sum = dao.getTotalDonation(conn, prjNum);
		
		if(sum >= 0) {
			close(conn);
		}
		System.out.println("service sum값:"+sum);
		return sum;
	}

	//공지사항 존재하는지 확인
	public List<ProjectNoticeVo> selectNotice(String prjNum) {
		
		Connection conn = getConnection();
		
		List<ProjectNoticeVo> noticeList = dao.selectNotice(conn,prjNum);
		
		if(noticeList != null) {
			close(conn);
		}
		return noticeList;
	}

	//총 후원자 계산하기
	public String getTotalDonator(String prjNum) {
		Connection conn = getConnection();
		String count = dao.getTotalDonator(conn, prjNum);
		
		if(count != null) {
			close(conn);
		}
		return count;
	}

	//카테고리번호 조회해오기
	public String getCategoryNo(String prjNum) {
		Connection conn = getConnection();
		
		String categoryNo = dao.getCategoryNo(conn, prjNum);
		if(categoryNo != null) {
			close(conn);
		}
		return categoryNo;
	}

	//상세페이지 이미지 가져오기
	public List<String> getDescriptionImage(String prjNum) {
		Connection conn = getConnection();
		List<String> pathList = dao.getDescriptionImage(conn, prjNum);
		
		if(pathList != null) {
			close(conn);
		}
		return pathList;
	}
}
