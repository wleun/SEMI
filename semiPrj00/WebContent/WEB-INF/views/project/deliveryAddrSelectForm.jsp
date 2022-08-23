<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.addr.vo.AddrVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	ArrayList<AddrVo> addrList = (ArrayList<AddrVo>)request.getAttribute("addrList");
%>
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
			<button class="btn"><a href="<%=request.getContextPath()%>/member/addrRegister">+추가하기</a></button>
			<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
	

			<!-- Modal body -->
			<div class="modal-body">
				<table>
					<%for(AddrVo vo : addrList){%>
					<tr>
						<td class="modal-addr-name"><%=vo.getName()%></td>
						<td><div class="modal-default btn btn-sm btn-danger disabled opacity-0">기본</div></td>
						<td class="modal-addr-num"><label for="radio-btn2"><%=vo.getAddr1()%> <%=vo.getAddr2()%></label></td>
						<td>
							<input type="radio" id="radio-btn2" class="form-check-input addr-modal-radio" value="<%=vo.getAddr1()%> <%=vo.getAddr2()%>" <%=vo.getDefaultYN()%>>
							<input type="hidden" value=<%=vo.getPhone()%>>
							<input type="hidden" id="addr-no" value=<%=vo.getNo()%>>
						</td>
					</tr>
					<%}%>
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
			//체크 하나만 되도록
			$(".addr-modal-radio").click(function(){
				if($(".addr-modal-radio") != $(this)){
					$(".addr-modal-radio").prop("checked",false);
					$(this).prop("checked",true);
				}
			});

			//기본일경우 기본버튼 나오도록
			if($(".addr-modal-radio").is(":checked")){
				$(".addr-modal-radio:checked").parent().parent().children().eq(1).children().first().removeClass("opacity-0");
			}
		});
		

	</script>

</body>
</html>