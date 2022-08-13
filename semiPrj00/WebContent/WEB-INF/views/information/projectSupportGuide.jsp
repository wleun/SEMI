<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>200% 쉽고 간편하게 시작해요. 후원 가이드</title>
<style>
	body {
		width: 1920px;
	}
	
	#blank {
		width: 100%;
		height: 300px;
	}
	
	main {
		margin: 0 auto;
		width: 60%;
	}
	
	#title {
		padding-bottom: 100px;
	}
	
	.guide-content {
		margin-top: 100px;
	}
	
	.sub-title {
		padding-bottom: 30px;
	}
	
	.guide-header {
		margin-bottom: 200px;
	}
	
	span {
		font-size: large;
		color: #48CA7D;
	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/userHeader.jsp"%>
	<div id="blank"></div>
	<main>
		<div class="guide-header">
			<h3 id="title">200%가 처음인 당신을 위해 후원 가이드를 알려드릴게요.</h3>
			<span>200%는 친환경적인 프로젝트들을 만나볼 수 있는 친환경 리워드형 크라우드 펀딩 사이트입니다.</span>
			<p>
				프로젝트는 새로 제품이나 콘텐츠의 기획서입니다. 환경을 생각하면서도 기발하고 보다 다양한 주제의 프로젝트들을 만나보세요.<br>
				후원이란 이러한 프로젝트의 실현을 위해 제작비를 지원하는 것입니다. 목표금액을 달성하면 제품들을 실물로 만나볼 수 있어요.<br>
				리워드란 후원자님들에게만 주어지는 특별한 혜택입니다. 원하시는 옵션을 골라 해당하는 금액을 지원하면 선물을 받아볼 수 있어요.
			</p>
		</div>
		<div class="guide-content">
			<h5 class="sub-title">선물 정보</h5>
			<p>
				창작자님이 후원 금액에 따라 그에 대한 선물을 받아볼 수 있도록 옵션을 구성해 놓았습니다. 후원자님은 원하는 선물을 선택할 수 있어요.
				후원자님의 도움으로 펀딩이 성공하면 예상 전달일에 선택하신 선물을 받아볼 수 있습니다. 그 때까지 설레는 마음으로 기다려주세요!
			</p>
		</div>
		<div class="guide-content">
			<h5 class="sub-title">후원자 정보</h5>
			<p>배송이 원할하게 진행될 수 있도록 후원자님의 연락처, 이메일 그리고 배송지를 정확하게 기입해주세요. 기입한 연락처와 이메일로 후원 관련 소식을 들어볼 수 있습니다.<br>
				연락처나 이메일에서 변경하고 싶은 내용이 있다면 마이페이지에서 변경할 수 있습니다.
			</p>
		</div>
		<div class="guide-content">
			<h5 class="sub-title">쿠폰</h5>
			<p>
				200%에서는 추천인 등록, 이벤트와 같은 요소에서 쿠폰을 제공해드리고 있습니다. 후원 페이지에서 보유한 쿠폰을 적용하여 할인된 금액으로 선물을 만나보세요!
			</p>
		</div>
		<div class="guide-content">
			<h5 class="sub-title">결제수단</h5>
			<p>펀딩 성공 시 프로젝트가 마감된 이후 7일간 24시간 간격으로 결제가 진행됩니다. 설정하신 결제 수단에 문제가 없는지 한번 더 확인해주세요.<br>
				기본으로 설정된 결제수단이 있다면 후원 페이지에서 자동으로 적용되어 있는걸 확인하실 수 있습니다.
			</p>
		</div>
		<div class="guide-content">
			<h5 class="sub-title">주의 사항</h5>
			<p>200%에서의 후원은 아직 실현되지 않은 프로젝트가 실현될 수 있도록 제작비를 후원하는 과정으로, 기존의 상품 또는 용역을 거래의 대상으로 하는 매매와는 차이가 있습니다.
				따라서, 전자상거래법상 청약철회 등의 규정이 적용되지 않습니다.
				또한 프로젝트 진행 과정에서 계획이 지연, 변경되거나 무산될 수도 있습니다.<br> 후원하는 프로젝트를 완수할 책임과 권리는 창작자에게 있습니다.
				이 점 유의해주세요.
			</p>
		</div>
	</main>
	
</body>
</html>