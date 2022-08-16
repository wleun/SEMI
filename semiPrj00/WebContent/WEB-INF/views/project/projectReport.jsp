<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body {
		width: 1920px;
		height: 900px;
	}
	
	#prjReport {
		margin-top: 300px;
	}
	
	#prjReport span {
		border-bottom: 1px solid gray;
		font-size: x-small;
	}
	
	/* 여기서부터 남겨야 함 */
	.prjInfo {
		display: flex;
		flex-direction: row;
		align-items: center;
		font-size: small;
		margin: 0 20px;
	}
	
	#prjImage {
		width: 130px;
		height: 130px;
	}
	
	#reportForm * {
		margin-top: 30px;
		margin-left: 20px;
	}
	
	#reportInfo {
		font-size: x-small;
		color: gray;
		text-align: center;
	}
	
	#prjName {
		word-break: break-all;
	}
</style>
</head>

<body>

	<%@ include file="/WEB-INF/views/common/userHeader.jsp"%>


	<!-- Open the Modal -->
	<button type="button" id="prjReport" class="btn shadow-none"
		data-bs-toggle="modal" data-bs-target="#myModal">
		<span>프로젝트 신고</span>
	</button>

	<!-- 여기부터 남기는 곳 -->
	<!-- The Modal -->
	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">프로젝트 신고하기</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="prjInfo">
						<div class="img-section">
							<img
								src=""
								alt="프로젝트 썸네일" id="prjImage">
						</div>
						<div style="padding-left: 20px;" id="prjName">
							프로젝트 이름<br>우리, Less Waste부터 함께 해보아요!
						</div>
					</div>
					<form action="<%=contextPath%>/project/report" method="post" id="reportForm">
						<input type="hidden" name="prjNo">
						<div>신고 내용</div>
						<textarea style="resize: none;" name="reportContent"
							id="reportContent" cols="45" rows="10"
							placeholder="자세한 신고 사유와 참고할 수 있는 URL을 작성해주세요."></textarea>
						<div id="reportInfo">* 신고 내용이 허위 사실인 경우, 이용에 제재를 받을 수 있습니다.</div>
					</form>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button
						style="background-color: #48CA7D; border-radius: 50px; color: white;"
						type="button" class="btn" data-bs-dismiss="modal">접수하기</button>
				</div>

			</div>
		</div>
	</div>



</body>
</html>