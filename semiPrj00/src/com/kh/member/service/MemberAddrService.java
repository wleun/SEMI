package com.kh.member.service;

import java.sql.Connection;

import com.kh.addr.vo.AddrVo;
import static com.kh.common.JDBCTemplate.*;
import com.kh.member.repository.MemberAddrDao;

public class MemberAddrService {
	
	private final MemberAddrDao dao = new MemberAddrDao();

	/*
	 * 주소 insert
	 */
	public int insertAddr(AddrVo addrVo) {
		
		Connection conn = null;
		int result = 0;
		
		try {
			conn = getConnection();
			
			if(addrVo.getDefaultYN() == null) {
				addrVo.setDefaultYN("N");
			}else {
				addrVo.setDefaultYN("Y");
			}
			
			if(addrVo.getMemberNo() == null || addrVo.getName() == null || addrVo.getPhone() == null || addrVo.getPostNum() == null || addrVo.getAddr1() == null || addrVo.getAddr2() == null) {
				result = -1;
			}else {
				result = dao.insertAddr(conn, addrVo);
				if(result == 1) {
					commit(conn);
				}else {
					rollback(conn);
					System.out.println("error result ::: " + result);
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
			rollback(conn);
		}finally {
			close(conn);
		}
		
		return result;
	}

	/*
	 * 기존 기본설정 배송지 삭제
	 */
	public int updateAddr(String memberNo) {
		
		Connection conn = null;
		int update = 0;
		
		try {
			conn = getConnection();
			
			if(memberNo != null) {
				update = dao.updateAddr(conn, memberNo);
				if(update > 0) {
					commit(conn);
				}else {
					rollback(conn);
				}
			}else {
				update = -1;
				System.out.println("error update ::: " + update);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			rollback(conn);
		}finally {
			close(conn);
		}
		
		return update;
	}

}
