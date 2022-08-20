package com.kh.project.service;

import java.sql.Connection;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.UUID;
import com.kh.category.vo.CategoryVo;
import com.kh.project.attachment.vo.ProjectAttachmentVo;
import com.kh.project.repository.PrjOpenDao;
import com.kh.project.vo.ProjectVo;
import com.kh.reward.vo.ProjectRewardVo;

import static com.kh.common.JDBCTemplate.*;

public class PrjOpenService {
	
	//파일 이름 변경
	public String createChangeName(String originName) {
		//.위치로 확장자 가져오기
				int dotIdx = originName.lastIndexOf(".");
				String ext = originName.substring(dotIdx);
				
				//중복을 막기위해 오늘날짜, 시간을 얻어옴
				long now = System.currentTimeMillis();
				String random = UUID.randomUUID().toString();
				random = random.substring(0, 8);
				
				String changeName = "200_" + now + "_" + random + ext;
				
				return changeName;
		
	}
	

	//배송일 구하는 메소드
	public String shippingDateCalc(String endDate, int day) {
		
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		Date end = null;
		try {
			end = dateFormat.parse(endDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		cal.setTime(end);
		cal.add(Calendar.DATE, 7); //결제 기간 +7 지정한날짜 +n
		cal.add(Calendar.DATE, day);
		
		String shippingDate = dateFormat.format(cal.getTime()); //Date > String으로 변환
		
		return shippingDate;
	}
	
	
	//카테고리 번호 가져와서 폼에 표시
	public List<CategoryVo> selectCategoryList() {
		
		Connection conn = getConnection();
		List<CategoryVo> list = new PrjOpenDao().selectCategoryList(conn);
		
		close(conn);
		
		return list;
	}


	//프로젝트 정보 insert
	public int prjInsert(ProjectVo prjVo, LinkedList<ProjectAttachmentVo> attList, LinkedList<ProjectRewardVo> rewardList) {
		
		Connection conn = null;
		
		conn = getConnection();
		
		int result1 = 0;
		int result2 = 0;
		int result3 = 0;
		
		//DAO 호출
		try {
			result1 = new PrjOpenDao().insertProject(conn, prjVo);
			result2 = new PrjOpenDao().insertProjectFile(conn, attList);
			result3 = new PrjOpenDao().insertProjectReward(conn, rewardList);
			
			//트랜잭션 처리
			if(result1 * result2 * result3 == 1) {
				commit(conn);
				
			} else {
				rollback(conn);
			}
			
		} catch (Exception e) {
			System.out.println("프로젝트 신청 처리 중 문제 발생");
			e.printStackTrace();
		} finally {
			close(conn);
		}
		
		
		return result1 * result2 * result3;


	}
	
	
	

}
