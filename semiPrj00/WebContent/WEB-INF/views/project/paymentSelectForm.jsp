<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>200%</title>
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
	.opacity-0{
		opacity: 0%!important;
	}
	#card-modal-submit-btn{
		background-color: #48CA7D;
		border: 0;
		border-radius: 50px;
	}
</style>
</head>
<body>



	<!-- The Modal -->
	<div class="modal" id="payment-select">
		<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content">
	
			<!-- Modal Header -->
			<div class="modal-header">
			<h4 class="modal-title">결제수단 변경</h4>
			<button class="btn"><a href="<%=request.getContextPath()%>/member/paymentRegister">+추가하기</a></button>
			<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
	

			<!-- Modal body -->
			<div class="modal-body">
				<table>
					<tr>
						<td class="modal-card-name"></td>
						<td><div class="btn btn-sm btn-danger disabled modal-default opacity-0">기본</div></td>
						<td class="modal-card-num"><label for="radio-btn1">************1234</label></td>
						<td>
							<input type="radio" id="radio-btn1" class="form-check-input card-modal-radio" value="************1234" checked>
							<input type="hidden" id="card-no" value="">
						</td>
					</tr>
				</table>
			</div>
	
			<!-- Modal footer -->
			<div class="modal-footer">
			<button type="submit" class="btn btn-success" data-bs-dismiss="modal" id="card-modal-submit-btn">적용</button>
			</div>

		</div>
		</div>
	</div>

	
	
	<script>
		$(function(){
			$(".card-modal-radio").click(function(){
				if($(".card-modal-radio") != $(this)){
					$(".card-modal-radio").prop("checked",false);
					$(this).prop("checked",true);
				}
			});

			if($(".card-modal-radio").is(":checked")){
				$(".card-modal-radio:checked").parent().parent().children().eq(1).children().first().removeClass("opacity-0");
			}
		});
		
	</script>

</body>
</html>