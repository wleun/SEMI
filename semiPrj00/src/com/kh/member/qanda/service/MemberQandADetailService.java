package com.kh.member.qanda.service;

import java.sql.Connection;
import java.util.List;

import static com.kh.common.JDBCTemplate.*;
import com.kh.member.qanda.dao.MemberQandADetailDao;
import com.kh.member.qanda.vo.MypageAdetailVo;
import com.kh.member.qanda.vo.MypageQdetailVo;

public class MemberQandADetailService {

	private final MemberQandADetailDao dao = new MemberQandADetailDao();
	
	public List<MypageQdetailVo> selectQdetailList(String no, String makerNo) {
		
		Connection conn = getConnection();
		
		List<MypageQdetailVo> list = dao.selectQdetailList(conn, no, makerNo);
		
		close(conn);
		
		return list;
		
	}

	public List<MypageAdetailVo> selectAdetailList(String no) {
		
		Connection conn = getConnection();
		
		List<MypageAdetailVo> list = dao.selectAdetailList(conn, no);
		
		close(conn);
		
		return list;
	}

}
