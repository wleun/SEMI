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
    .modal-addr-name{
        width: 150px;
        padding: 20px;
        font-size: 16px;
    }
    .modal-addr-num{
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
	#addr-modal-submit-btn{
		background-color: #48CA7D;
		border: 0;
		border-radius: 100px;
	}
</style>
</head>
<body>



	<!-- The Modal -->
	<div class="modal" id="addr-select">
		<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content">
	
			<!-- Modal Header -->
			<div class="modal-header">
			<h4 class="modal-title">주소 변경</h4>
			<button class="btn"><a href="<%=request.getContextPath()%>/project/addrRegister">+추가하기</a></button>
			<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
	

			<!-- Modal body -->
			<div class="modal-body">
				<table>
					<tr>
						<td class="modal-addr-name"></td>
						<td><div class="btn btn-sm btn-danger disabled modal-default opacity-0">기본</div></td>
						<td class="modal-addr-num"><label for="radio-btn1">주소1+주소2</label></td>
						<td>
							<input type="radio" id="radio-btn1" class="form-check-input addr-modal-radio" value="주소1+주소2" checked>
						</td>
					</tr>
					<tr>
						<td class="modal-addr-name"></td>
						<td><div class="modal-default btn btn-sm btn-danger disabled opacity-0">기본</div></td>
						<td class="modal-addr-num"><label for="radio-btn2">주소3+주소4</label></td>
						<td>
							<input type="radio" id="radio-btn2" class="form-check-input addr-modal-radio" value="주소3+주소4">
						</td>
					</tr>
					<tr>
						<td class="modal-addr-name"></td>
						<td><div class="modal-default btn btn-sm btn-danger disabled opacity-0">기본</div></td>
						<td class="modal-addr-num"><label for="radio-btn3">주소5+주소6</label></td>
						<td>
							<input type="radio" id="radio-btn3" class="form-check-input addr-modal-radio" value="주소5+주소6">
						</td>
					</tr>
				</table>
			</div>
	
			<!-- Modal footer -->
			<div class="modal-footer">
			<button type="submit" class="btn btn-success" data-bs-dismiss="modal" id="addr-modal-submit-btn">적용</button>
			</div>

		</div>
		</div>
	</div>

	
	
	<script>
		$(function(){
			$(".addr-modal-radio").click(function(){
				if($(".addr-modal-radio") != $(this)){
					$(".addr-modal-radio").prop("checked",false);
					$(this).prop("checked",true);
				}
			});

			if($(".addr-modal-radio").is(":checked")){
				$(".addr-modal-radio:checked").parent().parent().children().eq(1).children().first().removeClass("opacity-0");
			}
		});
		
	</script>

</body>
</html>