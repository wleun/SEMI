<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    
	body{
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
        


        #reportForm{
       		margin : 0 auto;
       }
        table td{
            padding: 25px; 
            
        } 
        #content{
        	width: 400px;
        }
        
        #reportInfo{
            font-size: x-small;
            color: gray;
            text-align: center;
        }
        


</style>
</head>

<body>

	<%@ include file="/WEB-INF/views/common/userHeader.jsp" %>
	
	
	    <!-- Open the Modal -->
        <button type="button" id="prjReport" class="btn shadow-none" data-bs-toggle="modal" data-bs-target="#myModal">
            <span>프로젝트 신고</span>
          </button>
  
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
      	  <form action="/project/report" method="post">
        	<input type="hidden" name="prjNo" value="">
	            <table id="reportForm">
	            	<tr>
	            		 <td>신고 사유</td>
	           		</tr>
	                <tr>
	                   
	                    <td><textarea name="reportContent" id="content" cols="30" rows="10" style="resize: none;" placeholder="내용이 충분하지 않을 경우 사실 확인이 어려울 수 있습니다."></textarea></td>
	                </tr>
	                <tr>
	                   
	                    <td id="reportInfo"><span style="color: gray;">신고 사유를 상세히 작성해주세요. 문제 확인 및 조치가 보다 신속하게 진행됩니다.</span></td>
	                </tr>
	            </table>
            </form>

        </div>
  
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-bs-dismiss="modal">접수하기</button>
        </div>
  
      </div>
    </div>
  </div>
            
	

</body>
</html>