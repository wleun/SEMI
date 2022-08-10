<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#radio-btn:checked{
        background-color: #48CA7D;
        border: 0;
    }
    .modal-card-name{
        width: 150px;
        padding: 20px;
        font-size: 16px;
    }
    .modal-card-num{
        width: 500px;
        padding: 20px;
        font-size: 16px;
    }
	.modal-default{
		width: 50px;
	}
	#modal-submit-btn{
		background-color: #48CA7D;
		border: 0;
		border-radius: 100px;
	}
</style>
</head>
<body>

	<form action="<%=contextPath%>/project/support" method="get">

		<!-- The Modal -->
		<div class="modal" id="payment-register">
			<div class="modal-dialog modal-lg">
			<div class="modal-content">
		
				<!-- Modal Header -->
				<div class="modal-header">
				<h4 class="modal-title">결제수단 변경</h4>
				<button class="btn"><a href="#">+추가하기</a></button>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
		
				<!-- Modal body -->
				<div class="modal-body">
					<table>
						<tr>
							<td class="modal-card-name"></td>
							<td><div class="btn btn-sm btn-danger disabled modal-default">기본</div></td>
							<td class="modal-card-num">************1234</td>
							<td>
								<input type="radio" id="radio-btn" class="form-check-input modal-radio modal-radio" checked>
							</td>
						</tr>
						<tr>
							<td class="modal-card-name"></td>
							<td><div class="modal-default btn btn-sm btn-danger disabled">기본</div></td>
							<td id="card-num">************5678</td>
							<td>
								<input type="radio" id="radio-btn" class="form-check-input modal-radio">
							</td>
						</tr>
					</table>
				</div>
		
				<!-- Modal footer -->
				<div class="modal-footer">
				<button type="submit" class="btn btn-success" data-bs-dismiss="modal" id="modal-submit-btn">적용</button>
				</div>
			</div>
			</div>
		</div>

	</form>
	
	
	<script>
		$(function(){
			$(".modal-radio").click(function(){
				if($(".modal-radio") != $(this)){
					$(".modal-radio").prop("checked",false);
					$(this).prop("checked",true);
				}
			});
		});
		
	</script>

</body>
</html>