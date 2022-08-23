package com.kh.project.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

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
	public void getTotalDonation(String prjNum) {
		Connection conn = getConnection();
		dao.getTotalDonation(conn, prjNum);
	}

}
