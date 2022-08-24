package com.kh.admin.proposal.service;

import static com.kh.common.JDBCTemplate.*;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.kh.admin.attachment.vo.AdminProposalAttachmentVo;
import com.kh.admin.member.repository.AdminMemberDao;
import com.kh.admin.notice.repository.AdminNoticeDao;
import com.kh.admin.notice.vo.AdminNoticeVo;
import com.kh.admin.proposal.repository.AdminProposalDao;
import com.kh.admin.proposal.vo.AdminProposalVo;
import com.kh.common.vo.PageVo;
import com.kh.member.vo.MemberVo;
import com.kh.project.vo.ProjectVo;

public class AdminProposalService {

	//페이징 관련 카운트 
	public int getCount() {
		Connection conn = getConnection();
		int result = new AdminProposalDao().getCount(conn);
		
		close(conn);
		
		return result;
	}

	//페이징 리스트
	public List<AdminProposalVo> selectList(PageVo pageVo) {
		Connection conn = getConnection();
		List<AdminProposalVo> adminProposalVoList = new AdminProposalDao().selectList(conn,pageVo);
		
		close(conn);
		return adminProposalVoList;
	}
	
	//제안서 상세조회
	public AdminProposalVo selectOne(String no) {
		Connection conn = getConnection();
		AdminProposalVo adminProposalVo = new AdminProposalDao().selectOne(conn,no);
		
		close(conn);
		
		return adminProposalVo;
	}

	//제안서 상세조회 (파일)
	public List<AdminProposalAttachmentVo> selectFile(String no) {
		
		Connection conn = getConnection();
		List<AdminProposalAttachmentVo> proposalAttachmentVoList = new AdminProposalDao().selectFile(conn,no);
		
		close(conn);
		
		return proposalAttachmentVoList;
	}

	//제안서 상태변경 (ajax, UPDATE)
	public int changeStatus(String option, String no) {
		Connection conn = getConnection();
		int result = 0;
		
		try {
			result = new AdminProposalDao().changeStatus(conn, option, no);
			
			if(result==1) {
				commit(conn);
			} else {
				rollback(conn);
			}
		}catch(Exception e) {
			rollback(conn);
			e.printStackTrace();
		}finally {
			close(conn);
		}
		return result;
	}
	
	//제안서 변경된 상태 조회 (ajax, SELECT)
	public String selectStatus(String no) {
		Connection conn = getConnection();
		String status = new AdminProposalDao().selectStatus(conn, no);
		
		close(conn);
		return status;
	}

}
