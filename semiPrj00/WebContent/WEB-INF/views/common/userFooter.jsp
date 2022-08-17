<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<style>
	#footerWrapper {
		width: 1920px;
		height: 200px;
	}
	
	#footerWrapper a {
		text-decoration-line: none;
		color: black;
		font-size: small;
	}
	
	#footerWrapper a:hover {
		color: #48CA7D;
	}
	
	#footerLine {
		width: 1800px;
		margin: 0 auto;
	}
	
	.footer-sitemaplink {
		width: 800px;
		display: flex;
        flex-wrap: nowrap;
		flex-direction: row;
		justify-content: space-around;
	}
	
	.sitemap-link {
		text-align: center;
		display: flex;
        flex-wrap: nowrap;
		flex-direction: column;
		line-height: 40px;
	}
	
	.footer-side {
		display: flex;
        flex-wrap: nowrap;
		flex-direction: row;
		justify-content: space-around;
		margin-top: 20px;
	}
	
	.footer-customer {
		text-align: center;
	}
	
	.footer-company {
		font-size: xx-small;
		margin-top: 37px;
		padding-left: 450px;
		color: gray;
	}
</style>
</head>
<body>

	<div id="footerWrapper">
		<footer>
			<hr id="footerLine">
			<div class="footer-side">
				<div class="footer-sitemaplink">
					<div class="sitemap-link">
						<h6>200%</h6>
						<a href="<%=request.getContextPath()%>/member/noticeList">공지사항</a> 
						<a href="<%=request.getContextPath()%>/member/eventList">이벤트</a>
					</div>
					<div class="sitemap-link">
						<h6>이용안내</h6>
						<a href="<%=request.getContextPath()%>/info/openguide">프로젝트 오픈가이드</a> 
						<a href="<%=request.getContextPath()%>/info/support">후원가이드</a>
					</div>
					<div class="sitemap-link">
						<h6>정책</h6>
						<a href="<%=request.getContextPath()%>/info/privacypolicy">개인정보처리방침</a> 
						<a href="<%=request.getContextPath()%>/info/policy">이용약관</a>
					</div>
				</div>

				<div class="footer-customer">
					<h6 style="margin-bottom: 20px;">고객센터</h6>
					<h6>1599-1234</h6>
					<small>상담 가능 시간 09:00 ~ 18:00 (주말, 공휴일 제외)</small>
				</div>
			</div>
			<div class="footer-company">
				<div class="company-info">회사명 : 200%(주) 주소: 서울특별시 강남구 역삼동 테헤란로
					개발진: 이게왜되는거조 대표번호 : 02-0000-0000</div>
				<div class="company-info">200%는 플랫폼 제공자로서 프로젝트의 당사자가 아니며, 직접적인
					통신판매를 진행하지 않습니다. 프로젝트의 완수 및 선물제공의 책임은 해당 프로젝트의 창작자에게 있으며, 프로젝트와
					관련하여 후원자와 발생하는 법적 분쟁에 대한 책임은 해당 창작자가 부담합니다.</div>
			</div>
		</footer>
	</div>
</body>
</html>