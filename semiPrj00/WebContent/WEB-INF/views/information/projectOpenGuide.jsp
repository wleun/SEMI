<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>200% 쉽고 간편하게 시작해요. 창작자 가이드</title>
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
			<h3 id="title">쉽고 간편하게 시작해요. 창작자 가이드</h3>
			<span>평소 구상만 하던 당신만의 친환경적인 아이디어가 있었다면 200%에서 실현시켜보세요.</span>
			<p>
				많은 크라우드 펀딩 플랫폼이 존재하지만 친환경적인 소재와 아이디어는 발견하기 힘들었어요. 따로 카테고리에 분리되지 않고
				태그와 검색 기능만으로 찾아냈었어야 했죠.<br> 개발진인 우리 '이게왜되는거조'는 누구보다 자연을 사랑하고
				지구를 지킬 수 있는 아이디어를 가진 당신이 더욱 활약할 수 있는 기반을 만들기 위해 친환경 리워드형 크라우드펀딩 사이트인
				200%를 서비스하기 시작했습니다.<br> 여기 당신을 위한 가이드를 준비했습니다. 200%에서 당신의 프로젝트
				아이디어를 현실로 만들어보세요!
			</p>
		</div>
		<div class="guide-content">
			<h5 class="sub-title">프로젝트 카테고리</h5>
			<p>
				총 12개의 카테고리로 구성되어 있습니다. 당신의 아이디어를 쉽게 찾아낼 수 있도록 적합한 카테고리를 지정해주세요. <br>
				<br> <span>푸드</span>: 자연에서 얻어온 식재료를 사용하고 글루텐프리와 같은 건강하고 맛도 놓치지
				않는 식품들이 포함됩니다.<br> <span>홈, 리빙</span>: 유용하게 사용할 수 있고 다시 자원으로 쓸
				수 있는 튼튼한 가구나 생활용품들이 포함됩니다.<br> <span>테크, 가전</span>: 친환경적인 생활을
				도울 수 있는 프로그램이나 페이퍼리스 제품들이 포함됩니다.<br> <span>도서, 출판</span>: 비건들의
				이야기, 제로웨이스트를 실천하고 있는 사람들의 이야기를 담은 도서들이 포함됩니다.<br> <span>뷰티</span>:
				비건 스킨케어 제품이나 불필요한 포장을 줄인 메이크업 제품들이 포함됩니다. <br> <span>패션,
					잡화</span>: 누구나 편하게 입을 수 있고 리사이클 원단, 천연 염색을 한 제품들이 포함됩니다.<br> <span>여행,
					레져</span>: 태양광으로 충전하는 랜턴, 다양한 텀블러 제품들이 포함됩니다.<br> <span>스포츠</span>:
				친환경 소재 비건스웨이드 요가매트나 기능성 스포츠웨어 제품들이 포함됩니다.<br> <span>모빌리티</span>:
				라이딩만으로 전기 생산이 가능한 자전거 발전기와 같은 제품들이 포함됩니다.<br> <span>반려동물</span>:
				동물친구들의 털을 묶어줄 수 있는 친환경 밴드, 천연 고양이모래와 같은 제품들이 포함됩니다.<br> <span>클래스</span>:
				누구보다 친환경에 진심인 사람들의 강의나 모임이 포함됩니다.<br> <span>식테크</span>: 식물+재테그의
				합성어로 식물을 기르는 노하우등이 포함됩니다.
			</p>
		</div>
		<div class="guide-content">
			<h5 class="sub-title">프로젝트 제목</h5>
			<p>한눈에 들어오고 프로젝트를 잘 설명해줄 수 있는 간결하고 직관적인 제목을 지어주세요.</p>
		</div>
		<div class="guide-content">
			<h5 class="sub-title">프로젝트 시작, 마감일자</h5>
			<p>
				200%에 공유되는 시기와 마감되는 날짜를 정해주세요. 너무 짧거나 긴 진행기간은 프로젝트 진행에 혼선을 줄 수 있기
				때문에 심사 과정에서 반려가 될 수 있습니다.<br> 권장하는 기간은 60일이며 마감일 이후 7일동안 24시간
				간격으로 후원자들의 결제가 진행됩니다.
			</p>
		</div>
		<div class="guide-content">
			<h5 class="sub-title">프로젝트 목표금액</h5>
			<p>리워드 생산에 필요한 예산을 고려해 목표금액을 지정해주세요. 펀딩 성공 시 플랫폼 수수료 5%를 제외한 금액이
				지급되며 실패한 경우 수수료는 발생하지 않습니다.</p>
		</div>
		<div class="guide-content">
			<h5 class="sub-title">프로젝트 대표, 상세이미지, 영상</h5>
			<p>메인화면에 보여지는 썸네일과 상세 내용을 꼼꼼히 살펴볼 수 있는 이미지를 준비해주세요. 파일 형식은 jpg 또는
				png. 영상의 경우 mp4 형식을 지원합니다.</p>
		</div>
		<div class="guide-content">
			<h5 class="sub-title">프로젝트 상세 설명</h5>
			<p>후원자분들이 프로젝트를 빠르게 이해할 수 있도록 자세한 상품 정보를 작성해주세요.</p>
		</div>
		<div class="guide-content">
			<h5 class="sub-title">예상되는 어려움</h5>
			<p>펀딩 진행 및 선물 전달 과정에서 발생 가능한 문제가 있다면 후원자에게 명확하게 알려주세요. 대응 계획을 함께
				적는다면 후원자에게 신뢰를 줄 수 있습니다.</p>
		</div>
		<div class="guide-content">
			<h5 class="sub-title">예상 전달일</h5>
			<p>
				결제 종료일로부터 며칠후에 배송이 시작되는지 알려주세요. 예상한 시간보다 2~3일 정도 후로 지정하는 것을 추천드립니다.
				<br>배송 문제나 혼선에 대처할 수 있는 시간을 마련할 수 있도록이요.
			</p>
		</div>
		<div class="guide-content">
			<h5 class="sub-title">메이커 정보</h5>
			<p>창작자님의 이력과 간단한 소개를 적어주세요.</p>
		</div>
		<div class="guide-content">
			<h5 class="sub-title">리워드 정보</h5>
			<p>
				펀딩 성공 시 후원자님들에게 제공한 선물 정보를 기입해주세요. 구성하는 아이템, 아이템의 정보. 제공 수를 입력하시면
				됩니다. <br>리워드 옵션은 최소 1개에서 최대 6개까지 입력하실 수 있습니다.
			</p>
		</div>
	</main>

</body>
</html>