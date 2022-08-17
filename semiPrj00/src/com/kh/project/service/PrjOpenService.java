package com.kh.project.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;
import com.kh.category.vo.CategoryVo;
import com.kh.project.repository.PrjOpenDao;

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
				
				String changeName = "200_"+now+"_"+random+ext;
				
				return changeName;
		
	}
	

	
	//배송일 구하는 메소드
	public Date shippingDateCalc(Timestamp endDate, int day) {
		
		Calendar cal = Calendar.getInstance();

		cal.setTime(endDate);
		cal.add(Calendar.DATE, 7); //결제 기간 +7 지정한날짜 +n
		cal.add(Calendar.DATE, day);
		
		Date shippingDate = (Date)cal.getTime(); //sql Date로 변환
		
		return shippingDate;
	}
	
	
	//카테고리 번호 가져와서 폼에 표시
	public List<CategoryVo> selectCategoryList() {
		
		Connection conn = getConnection();
		List<CategoryVo> list = new PrjOpenDao().selectCategoryList(conn);
		
		close(conn);
		
		return list;
	}

}
