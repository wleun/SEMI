package com.kh.member.service;

import java.sql.Connection;
import java.util.List;

import static com.kh.common.JDBCTemplate.*;

import com.kh.common.vo.PageVo;
import com.kh.member.repository.MemberMysponsorDao;
import com.kh.memberNotice.repository.EventDao;
import com.kh.project.vo.SupportVo;

public class MemberMysponsorService {
	/*
	 * 후원내역 불러오기
	 */
	public List<SupportVo> mySponList(String loginNo,PageVo pageVo) {
			Connection conn = getConnection();
			
			List<SupportVo> sponList = new MemberMysponsorDao().mySponList( pageVo, loginNo, conn);
			close(conn);

			return sponList;
		
	}
	/*
	 * 총 글 수
	 */
	public int getCount(String loginNo) {
		Connection conn = getConnection();
		int result = new MemberMysponsorDao().getCount(loginNo, conn);
		
		close(conn);
		
		return result;
	}

}
