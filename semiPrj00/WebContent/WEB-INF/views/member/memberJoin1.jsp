<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
       
        #box{height: 150px;width: 1920px;}
        #join-outer{
        /* border: 1px solid blue;*/
         width: 700px;
         height: 800px;
         margin: 0px auto;
        }
        #join{
           /* border: 2px solid red;*/
            width: 90%;
            height: 100%;
            margin: 0 auto;
            background-color: rgba(255, 255, 255, 0.675);
        }
        #join-h1{
            text-align: center;
        }
       #content{
        border: 1px solid black;
        width: 95%;
        height: 270px;
        overflow: scroll;
        margin: 0 auto;
       }
       #check{
        position: relative;
        text-align: center;
        bottom: -10px;
        }
        ::placeholder{
        font-size: 12px;
       }
      .img-join{
        width: 70px;
        height: 70px;
        position: relative;
        left: 50px;
        bottom: -27px;
      }
    #pre{
        background-color: #48CA7D;
        border:none;
        border-radius: 8px;
        width: 50px;
        height:30px;
        margin: 5px;
    }
    #next{
        background-color: #48CA7D;
        border:none;
        border-radius: 8px;
        width: 50px;
        height:30px;
        margin: 5px;
    }
    </style>
</head>
<body>

	<%@ include file="/WEB-INF/views/common/userHeader.jsp" %>

    <main>
        <div id="box"></div>
        <div id="join-outer">
         <div id="join">
            <div class="img-join">
                <img src="<%=contextPath%>/resources/img/join1.png" alt="" class="img-join">
            </div>
            <div id="join-h1"><h1>개인정보동의서</h1></div>
           	<br><br>
            <div id="content">
                
                회사는 이용자의 개인정보를 중요시하며, '정보통신망 이용촉진 및 정보보호 등에 관한 법률' 등 관계법령에 의거하여 개인정보를 관리 및 보호하고 있습니다. 
                <br>
                1. 개인정보의 수집·이용목적
                회사는 수집한 개인정보를 다음의 목적을 위해 이용합니다.
                ▶ 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산
                컨텐츠 제공, 특정 맞춤 서비스 제공, 물품배송 또는 청구서 등 발송, 본인인증, 구매 및 요금 결제, 요금추심
                ▶ 회원관리
                회원제 서비스 이용 및 제한적 본인 확인제에 따른 본인확인, 개인식별, 불량회원의 부정 이용방지와 비인가 사용방지, 가입의사 확인, 가입 및 가입횟수 제한, 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 추후 법정 대리인 본인확인, 분쟁 조정을 위한 기록보존, 불만처리 등 민원처리, 고지사항 전달
                ▶ 신규 서비스 개발 및 마케팅·광고에 활용
                신규 서비스 개발 및 맞춤 서비스 제공, 통계학적 특성에 따른 서비스 제공 및 광고 게재, 서비스의 유효성 확인, 이벤트 및 광고성 정보 제공 및 참여기회 제공, 접속빈도 파악, 회원의 서비스이용에 대한 통계
                <br>  
                2. 수집하는 개인정보 항목
                회사는 회원가입, 상담, 서비스 신청 등을 위해 아래와 같은 개인정보를 수집하고 있습니다.
                - 필수항목 : 성명, 이메일 주소, 전화번호, 비밀번호, 회원제 사이트 등록의 경우 임시 아이디 및 비밀번호
                - 선택항목 : 휴대폰 번호
                또한 서비스 이용 과정이나 사업처리 과정에서 아래와 같은 정보들이 생성되어 수집될 수 있습니다.
                - 서비스 이용기록, 접속로그, 쿠키, 접속 IP 정보, 결제기록, 이용정지 기록
                <br>    
                ◎ 쿠키 등 사용 목적 
                회원과 비회원의 접속 빈도나 방문 시간 등을 분석, 이용자의 취향과 관심분야를 파악 및 자취 추적, 각종 이벤트 참여 정도 및 방문 회수 파악 등을 통한 타겟 마케팅 및 개인 맞춤 서비스 제공
                이용자는 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서, 이용자는 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다. 
                <br>    
                ◎ 쿠키 설정 거부 방법 
                예: 쿠키 설정을 거부하는 방법으로는 이용자가 사용하는 웹 브라우저의 옵션을 선택함으로써 모든 쿠키를 허용하거나 쿠키를 저장할 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다.
                설정방법 예(인터넷 익스플로어의 경우) : 웹 브라우저 상단의 도구 > 인터넷 옵션 > 개인정보
                단, 쿠키 설치를 거부하였을 경우 로그인이 필요한 일부 서비스 이용에 어려움이 있을 수 있습니다.
                <br>    
                3. 개인정보의 보유 및 이용기간
                원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.
                <내부정책에 의한 정보보유 사유>
                ▶ 보유 정보 : 부정이용 기록
                    - 보유 이유 : 부정이용 방지 
                    - 보존 기간 : 1년
                <br>    
                <관련법령에 의한 정보보유 사유>
                상법, 전자상거래 등에서의 소비자보호에 관한 법률, 국세기본법 등 관계법령의 규정에 의하여 일정 기간 동안 회원정보를 보관합니다. 이 경우 회사는 보관하는 정보를 그 보관의 목적으로만 이용하며 보존기간은 아래의 예시와 같습니다.
                ▶ 계약 또는 청약철회 등에 관한 기록 
                - 보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률 
                - 보존 기간 : 5년 
                ▶ 대금결제 및 재화 등의 공급에 관한 기록 
                - 보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률 
                - 보존 기간 : 5년 
                ▶ 세법이 규정하는 모든 거래에 관한 장부 및 증빙서류
                - 보존 이유 : 국세기본법, 법인세법 등
                - 보존 기간 : 5년
                ▶ 소비자의 불만 또는 분쟁처리에 관한 기록 
                - 보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률 
                - 보존 기간 : 3년 
                ▶ 본인확인에 관한 기록 
                - 보존 이유 : 정보통신 이용촉진 및 정보보호 등에 관한 법률 
                - 보존 기간 : 6개월 
                ▶ 표시/광고에 관한 기록
                - 보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률 
                - 보존 기간 : 6개월
                ▶ 방문에 관한 기록 
                - 보존 이유 : 통신비밀보호법 
                - 보존 기간 : 3개월</div>
               
            <div id="check">
                <div class="agree">
                    <br>
                    동의하지않습니다&nbsp;<input type="radio" name="check" value="no" checked>&nbsp;&nbsp;
                    동의합니다&nbsp;<input type="radio" name="check" value="yes">
                    <br><br>
                    <input type="button" value="이전" id="pre" onclick="location.href='<%=contextPath%>/member/login'">&nbsp;&nbsp;
                    <input type="submit" value="다음" id="next" onclick="Click(value)">
                </div>

               
            </div>
            
            
        </div>
        </div>
       
    </main>

    <script>
        function Click(){
            if($("input:radio[name='check']").is(":checked")==true){

                var check_val = $(":input:radio[name=check]:checked").val();

                if(check_val=='no'){
                    alert('개인정보 수집 및 이용 미동의 시 가입 불가!');
                    return false;
                }else if(check_val=='yes'){
                    window.location.href="<%=contextPath%>/member/join2";
                }
                

            }
        }
        
       
    </script>
</body>
</html>