package com.kh.project.service;

import java.sql.Connection;

import static com.kh.common.JDBCTemplate.*;

import com.kh.project.repository.PrjSupportDao;
import com.kh.project.vo.ProjectVo;
import com.kh.reward.vo.ProjectRewardVo;

public class PrjSupportService {
	
	private final PrjSupportDao dao = new PrjSupportDao();

	/*
	 * 번호로 프로젝트 조회하기
	 */
	public ProjectVo selectPrj(String num) {
		
		Connection conn = null;
		ProjectVo prjVo = new ProjectVo();
		
		try {
			conn = getConnection();
			
			prjVo = dao.selectPrj(conn, num);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn);
		}
		
		return prjVo;
	}

	/*
	 * 번호로 리워드 조회하기
	 */
	public ProjectRewardVo selectReward(String reward) {
		
		Connection conn = null;
		ProjectRewardVo rewardVo = new ProjectRewardVo();
		
		try {
			conn = getConnection();
			
			rewardVo = dao.selectReward(conn, reward);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn);
		}
		
		return rewardVo;
	}

}//class
