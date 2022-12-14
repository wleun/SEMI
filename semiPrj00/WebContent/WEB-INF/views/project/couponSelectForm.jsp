<%@page import="com.kh.coupon.vo.CouponVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<CouponVo> couponList = (ArrayList<CouponVo>)request.getAttribute("couponList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>200%</title>
<style>
    .modal-coupon-name{
        width: 150px;
        padding: 20px;
        font-size: 16px;
    }
    .modal-coupon-num{
        width: 500px;
        padding: 20px;
        font-size: 16px;
    }
	#coupon-modal-submit-btn{
		background-color: #48CA7D;
		border: 0;
		border-radius: 50px;
	}
</style>
</head>
<body>



	<!-- The Modal -->
	<div class="modal" id="coupon-select">
		<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content">
	
			<!-- Modal Header -->
			<div class="modal-header">
			<h4 class="modal-title">쿠폰 선택하기</h4>
			<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
	

			<!-- Modal body -->
			<div class="modal-body">
				<table>
					<%for(CouponVo vo : couponList){%>
					<tr>
						<td class="modal-coupon-name"></td>
						<td class="modal-coupon-num"><label for="check-btn1"><%=vo.getName()%></label></td>
						<td>
							<input type="checkbox" id="check-btn1" class="form-check-input" name="coupon" value=<%=vo.getDiscount()%>>
						</td>
					</tr>
					<%}%>
				</table>
			</div>
	
			<!-- Modal footer -->
			<div class="modal-footer">
			<button type="submit" class="btn btn-success" data-bs-dismiss="modal" id="coupon-modal-submit-btn">적용</button>
			</div>

		</div>
		</div>
	</div>

</body>
</html>