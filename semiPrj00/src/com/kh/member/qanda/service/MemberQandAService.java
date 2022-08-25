package com.kh.member.qanda.service;

import java.sql.Connection;
import java.util.List;

import static com.kh.common.JDBCTemplate.*;
import com.kh.member.qanda.dao.MemberQandaDao;
import com.kh.member.qanda.vo.MypageAdetailVo;
import com.kh.member.qanda.vo.MypageQdetailVo;

public class MemberQandAService {

	private final MemberQandaDao dao = new MemberQandaDao();
	
	public List<MypageQdetailVo> selectQList(String no) {

		Connection conn = getConnection();
		
		List<MypageQdetailVo> list = dao.selectQList(conn, no);
		
		close(conn);
		
		return list;
	}

	public List<MypageAdetailVo> selectAList(String no) {
		
		Connection conn = getConnection();
		
		List<MypageAdetailVo> list = dao.selectAList(conn, no);
		
		close(conn);
		
		return list;
	}

}
