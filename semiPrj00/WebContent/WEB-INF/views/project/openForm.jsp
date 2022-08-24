<%@page import="com.kh.category.vo.CategoryVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
		List<CategoryVo> list = (List<CategoryVo>)request.getAttribute("list");
	%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<meta charset="UTF-8">
<title>200% 프로젝트 오픈 신청</title>


<style>
	body {
		width: 1920px;
	}
	
	#blank {
		width: 100%;
		height: 300px;
	}
	
	#topSide {
		margin: 0 auto;
		width: 65%;
		height: 150px;
	}
	
	#topSide * {
		font-weight: 600;
		margin-left: 200px;
	}
	
	main {
		margin: 0 auto;
		width: 70%;
	}
	
	main table {
		margin: 0 auto;
		width: 700px;
	}
	
	#title {
		margin: 100px 300px;
		font-weight: 600;
		height: 40px;
		line-height: 40px;
		padding-left: 20px;
		background-color: #48CA7D;
		color: white;
		border-radius: 10px;
	}
	
	table td {
		text-align: center;
		padding: 25px;
	}
	
	#dateCalc {
		font-size: x-large;
		font-weight: 800;
	}
	
	#dateInfo {
		text-align: center;
		font-size: larger;
		margin-bottom: 100px;
	}
	
	form .form-control {
		width: 300px;
		margin: 0 auto;
		box-shadow: none;
	}
	
	form input[type="date"] {
		width: 200px;
	}
	
	/*input 태그 number일 경우 증가, 감소 버튼 없애기*/
	input[type="number"]::-webkit-outer-spin-button,
		input[type="number"]::-webkit-inner-spin-button {
		-webkit-appearance: none;
		margin: 0;
	}
	
	.info {
		font-size: x-small;
		color: gray;
		padding-top: 0px;
		padding-left: 210px;
	}
	
	.btn-area {
		text-align: center;
		margin-top: 100px;
		margin-bottom: 25px;
	}
	
	.btn-area * {
		margin: 0 50px;
	}
	
	#maker, #reward {
		display: none;
	}
</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/common/userHeader.jsp"%>
	<div id="blank"></div>

	<div id="topSide">
		<h4>프로젝트 시작하기</h4>
		<h5>당신의 멋진 아이디어를 보여주세요!</h5>
	</div>

	<main id="projectForm">
		<form action="<%=contextPath%>/project/open" method="post" enctype="multipart/form-data">
			<div id="project">
				<div id="title">1. 기본정보</div>
				<table>
					<tr>
						<td>프로젝트 카테고리*</td>
						<td><select class="form-select form-control"
							name="prjCategory" required>
							 <!-- CATEGORY 테이블로부터 조회해오기 -->
                            <%for(CategoryVo c : list){ %>
								<option value="<%=c.getCategoryNo()%>"><%=c.getCategoryName()%></option>
								
								<%} %>
						</select></td>
					</tr>
					<tr>
						<td>프로젝트 제목*</td>
						<td><input type="text" class="form-control" name="prjTitle"
							placeholder="제목을 입력해주세요." maxlength="30" required></td>
					</tr>
					<tr>
						<td>프로젝트 시작일자*</td>
						<td><input type="date" class="form-control" name="startDate"
							id="startDate" onchange=dateCalc() max="2022-12-31" required>
						</td>
					</tr>
					<tr>
						<td>프로젝트 마감일자*</td>
						<td><input type="date" class="form-control" name="endDate"
							id="endDate" onchange=dateCalc() max="2022-12-31" required>
						</td>
					</tr>
					<tr>
						<td colspan="2"><div id="dateInfo">
								이 프로젝트는 <span id="dateCalcResult">0</span>일 동안 진행됩니다.
							</div></td>
					</tr>
					<tr>
						<td>프로젝트 목표금액*</td>
						<td><input type="number" class="form-control"
							name="prjAmount" id="prjAmount" value="0"
							min="100000" max="999999999" style="display: inline;" onchange=amountCalc() required>
							원</td>
					</tr>
					<tr>
						<td colspan="2"><div class="info">
								펀딩 성공 시 예상 수령액 <span id="priceCalcResult">0</span>원 (플랫폼 수수료 5%)
							</div></td>
					</tr>

					<tr>
						<td>대표이미지*</td>
						<td><input type="file" class="form-control" id="File"
							name="thumbnail" accept="image/*" required></td>
					</tr>
					<tr>
						<td colspan="2"><div class="info">대표이미지는 1개만 업로드해주세요.</div></td>
					</tr>
					<tr>
						<td>상세 이미지/영상*</td>
						<td><input type="file" class="form-control" id="file"
							name="prjFile"
							accept="image/*, video/mp4,video/mkv, video/x-m4v,video/*"
							multiple required></td>
					</tr>
					<tr>
						<td>상세 설명*</td>
						<td><textarea class="form-control" name="prjText" cols="40"
								rows="10" style="resize: none;" maxlength="350"
								placeholder="이 프로젝트의 정보를 입력해주세요." required></textarea></td>
					</tr>
					<tr>
						<td>예상되는 어려움</td>
						<td><textarea class="form-control" name="etc" cols="40"
								rows="10" style="resize: none;" maxlength="350"
								placeholder="펀딩 진행 및 배송 과정에서 예상되는 어려움을 입력해주세요."></textarea></td>
					</tr>
					<tr>
						<td>예상 전달일*</td>
						<td>결제 종료일로부터 <input style="width: 50px; display: inline;"
							class="form-control" type="number" id="shippingDate"
							name="shippingDate" min="1" maxlength="2" value="0" 
							oninput="numberMaxLength(this);" required> 일 뒤
						</td>
					</tr>
					<tr>
						<td colspan="2"><div class="info">
								배송 시작일 <span id="shippingCalcResult"></span>
							</div></td>
					</tr>
					<tr>
						<td colspan="2" style="padding-top: 150px;"><button
								type="button" class="btn text-white" id="prjNextBtn"
								style="background-color: #48CA7D; border-radius: 50px;">다음으로</button></td>
					</tr>
				</table>
			</div>


			<div id="maker">
				<div id="title">2. 창작자 정보</div>
					<input type="hidden" name="makerNo" value="<%=loginMember.getNo()%>">
				<table>
					<tr>
						<td>메이커 정보</td>
						<td><textarea class="form-control" name="makerInfo"
								id="makerInfo" cols="30" rows="5" style="resize: none;" maxlength="160"
								placeholder="메이커님의 간단한 소개를 입력해주세요."></textarea></td>
					</tr>
					<tr>
						<td>후원 계좌*</td>
						<td><input class="form-control" type="number"
							name="accountNo" placeholder="계좌번호를 입력해주세요.('-' 제외)" 
							maxlength="20" oninput="numberMaxLength(this);" required>
						</td>
					</tr>
					<tr>
						<td>은행명*</td>
						<td><input class="form-control" type="text"
							name="accountBank" id="accountBank" maxlength="8" placeholder="은행명을 입력해주세요."
							required></td>

					</tr>
					<tr>
						<td>예금주*</td>
						<td><input class="form-control" type="text"
							name="accountName" id="accountName" maxlength="8" placeholder="예금주를 입력해주세요."
							required></td>
					</tr>
					<tr>
						<td colspan="2" style="padding-top: 150px;"><button
								type="button" class="btn text-white" id="makerNextBtn"
								style="background-color: #48CA7D; border-radius: 50px;">다음으로</button></td>
					</tr>
				</table>
			</div>

			<div id="reward">
				<div id="title">3. 리워드 추가하기</div>
				<table id="rewardTable">
					<tr>
						<td>리워드 금액*</td>
						<td><input type="number" class="form-control" name="price"
							min="1000" maxlength="7" oninput="numberMaxLength(this);"
							value="1000" placeholder="이 리워드의 금액을 입력해주세요."
							style="display: inline;" required>
							원</td>
					</tr>
					<tr>
						<td>리워드 수*</td>
						<td><input type="number" class="form-control" name="quantity"
							id="rewardNum" min="1" value="1" maxlength="5" oninput="numberMaxLength(this);"
							placeholder="이 리워드의 수를 입력해주세요."
							style="display: inline;" required> 개</td>
					</tr>

					<tr>
						<td>리워드 옵션명*</td>
						<td><input type="text" class="form-control" name="option"
							id="option" maxlength="25" placeholder="옵션명을 입력해주세요." required></td>
					</tr>
					<tr>
						<td>리워드 옵션 설명*</td>
						<td><textarea class="form-control" name="detail" cols="30"
								rows="5" style="resize: none;" placeholder="해당 리워드의 설명을 입력해주세요."
								maxlength="65" required></textarea></td>
					</tr>
					<tr>
						<td colspan="2"><hr></td>
					</tr>

				</table>
				<div id="rewardClone"></div>

				<div class="btn-area">
					<button type="button"
						style="background-color: #48CA7D; border-radius: 50px; margin: 0 20px;"
						class="btn text-white" id="addReward" data-bs-toggle="tooltip"
						title="옵션을 추가하려면 눌러주세요.">+</button>
					<button type="button"
						style="background-color: #48CA7D; border-radius: 50px; margin: 0 20px;"
						class="btn text-white" id="delReward" data-bs-toggle="tooltip"
						title="옵션을 삭제하려면 눌러주세요.">-</button>
					<button type="submit"
						style="background-color: #48CA7D; border-radius: 50px;"
						class="btn text-white" id="btn">신청완료하기</button>
				</div>
			</div>

		</form>

	</main>


	<script>
		// 오늘 날짜 (시작날짜가 오늘날짜 이전이면 자동으로 오늘날짜로 설정됨)
		function getToday() {
			var date = new Date();
			var year = date.getFullYear();
			var month = ("0" + (1 + date.getMonth())).slice(-2);
			var day = ("0" + date.getDate()).slice(-2);
			return year + "-" + month + "-" + day;
		}

		// 내일 날짜 (마감날짜가 시작날짜 이전이면 자동으로 시작날짜 1일후로 설정)
		function getTomorrow(startDay) {
			var temp = new Date(startDay);
			var date = new Date(temp.setDate(temp.getDate() + 1));
			var year = date.getFullYear();
			var month = ("0" + (1 + date.getMonth())).slice(-2);
			var day = ("0" + date.getDate()).slice(-2);
			return year + "-" + month + "-" + day;
		}

		const today = getToday();

		// 진행날짜 구하는 함수
		function dateCalc() {

			let startDay = new Date(document.querySelector('#startDate').value);
			let endDay = new Date(document.querySelector('#endDate').value);

			//시작일이 종료일 보다 크면
			if (startDay.getTime() >= endDay.getTime()) {
				alert("마감날짜는 시작날짜 이후로 설정해주세요");
				document.getElementById('endDate').value = getTomorrow(startDay);
				dateCalc();

				//시작일이 오늘보다 이전이면
			} else if (document.querySelector('#startDate').value < today) {
				alert("시작날짜는 오늘날짜 이후로 설정해주세요");
				document.querySelector('#startDate').value = today;
				dateCalc();

				//모든 조건 통과 시 진행날짜 계산
			} else {
				let passedTime = endDay.getTime() - startDay.getTime();
				passedTime = Math.round(passedTime / (1000 * 60 * 60 * 24));
				//NaN 방지 
				if (isNaN(passedTime)) {
					passedTime = 0;
				}
				document.querySelector('#dateCalcResult').innerHTML = passedTime;

			}

		}
		//input 타입이 number인거 자리수 제한
	    function numberMaxLength(e){
	        if(e.value.length > e.maxLength){
	            e.value = e.value.slice(0, e.maxLength); //0 자릿수부터 max 자리수까지 자르기
	        }
	    }

		//수수료(5%)를 뺀 정산값 표시 (실제 목표금액은 설정한 그대로 넣기)
		function amountCalc() {
			let amount = document.getElementById("prjAmount").value;
			//목표금액이 허용범위가 아니면 알림
			if(amount < 100000 || amount > 999999999){
				alert("목표금액은 100,000 ~ 999,999,999원 사이로 설정해주세요.")
				document.getElementById("prjAmount").value = 100000;
				amountCalc();
			}else{
				let priceCalc = Math.floor(amount - (amount / 100 * 5));
				document.getElementById("priceCalcResult").innerHTML = priceCalc;
				}
			}
	

		//선물 전달일 (배송일)계산
		$(function shippingDateCalc() {
			$('#shippingDate').on(
					'change',
					function() {
						let shippingDate = parseInt($('#shippingDate').val());
						let date = new Date($('#endDate').val());
						//날짜에 마감날짜 + 7일 + 설정한 일수로 설정
						date = new Date(date.setDate(date.getDate() + 7
								+ shippingDate));
						let year = date.getFullYear();
						let month = ("0" + (1 + date.getMonth())).slice(-2);
						let day = ("0" + date.getDate()).slice(-2);
						if ($.isNumeric(year)) {
							$('#shippingCalcResult').html(
									year + "-" + month + "-" + day);
						} else {
							//시작, 마감날짜 설정전이면 공란으로 표시
							$('#shippingCalcResult').html("");
						}
					});
		});


		//리워드 옵션 추가하기
		let rewardCnt = 0;
		$(function() {
			$('#addReward').on('click', function() {
				let clone = $("#rewardTable").clone();
				clone.find("input").val("");
				clone.find("textarea").val("");

				//리워드는 최대 6개까지 그 이상 추가하려고 하면 알림 표시
				if (rewardCnt < 5) {
					$("#rewardClone").append(clone);
					rewardCnt++;
				} else {
					alert("리워드 옵션 수는 최대 6개까지 지정할 수 있습니다.")
				}
			});
		});

		//리워드 옵션 삭제하기 (마지막 옵션을 삭제함)
		$(function() {
			$('#delReward').on('click', function() {
				//기본 옵션만 있는 경우 삭제할 수 없다는 알림 표시
				if (!$('#rewardClone > table').length) {
					alert('리워드 옵션은 최소 1개는 등록해야 합니다.');
				}
				$("#rewardClone > table:last").remove();
			});
		});

		//다음으로 버튼 누를 시 창작자페이지 div 보여주기 (모든 필수항목이 입력되어있다는 조건하에)
		let is_empty = false;
		$(function() {
			$('#prjNextBtn').on(
					'click',
					function() {
						$('#project').find(
								'input[required], textarea[required]').each(
								function() {
									if (!$(this).val() || $(this).val() == 0) {
										is_empty = true;
									}
								});
						if (is_empty) {
							alert('필수 항목을 작성해주세요.');
							is_empty = false; //empty 값 초기화
						} else {
							$('#project').css('display', 'none');
							$('#maker').css('display', 'block');
						}
					});
		});

		//다음으로 버튼 누를 시 리워드페이지 div 보여주기 (모든 필수항목이 입력되어있다는 조건하에)
		$(function() {
			$('#makerNextBtn').on(
					'click',
					function() {
						$('#maker').find('input[required], textarea[required]')
								.each(function() {
									if (!$(this).val() || $(this).val() == 0) {
										is_empty = true;
									}
								});
						if (is_empty) {
							alert('필수 항목을 작성해주세요.');
							is_empty = false; //empty 값 초기화
						} else {
							$('#reward').css('display', 'block');
							$('#maker').css('display', 'none');
						}
					});
		});
		
	</script>

</body>
</html>