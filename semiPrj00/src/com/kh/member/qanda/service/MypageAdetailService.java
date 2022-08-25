package com.kh.member.qanda.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.kh.member.qanda.dao.MypageAdetailDao;
import com.kh.member.qanda.vo.MypageAdetailVo;
import com.kh.member.qanda.vo.MypageQdetailVo;

public class MypageAdetailService {

	private final MypageAdetailDao dao = new MypageAdetailDao();
	
	public List<MypageQdetailVo> selectQdetailList(String no, String makerNo) {
		
		Connection conn = getConnection();
		
		List<MypageQdetailVo> list = dao.selectQdetailList(conn, no, makerNo);
		
		close(conn);
		
		return list;
		
	}

	public int insertAdetail(MypageAdetailVo vo, String no) {
		
		Connection conn = getConnection();
		int result = dao.insertAdetail(conn, vo, no);
		
		if(result == 1) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
		
	}

}
