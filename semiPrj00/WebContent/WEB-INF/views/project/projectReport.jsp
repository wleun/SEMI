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
        
        table{
            margin: 0px;
        }
        table td{
            text-align: left;
            padding: 25px; 
        } 
        #reportInfo{
            font-size: x-small;
            color: gray;
            text-align: center;
        }

        #prjReport {
            margin-top: 300px;
            
        }
        
        #prjReport span {
            border-bottom: 1px solid gray;
            font-size: x-small;
            
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
          <h4 class="modal-title">프로젝트 신고</h4>
          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
        </div>
  
        <!-- Modal body -->
        <div class="modal-body">
            <table>
                <tr>
                    <td>프로젝트명</td>
                    <td>어떠한 프로젝트</td>
                </tr>
                <tr>
                    <td>신고 내용</td>
                    <td><textarea name="" id="content" cols="30" rows="10" style="resize: none;" placeholder="해당 프로젝트의 문제를 적어주세요."></textarea></td>
                </tr>
                <tr>
                   
                    <td colspan="2" id="reportInfo"><span  style="color: gray;">문제를 자세하게 적어주시면 확인하는데 큰 도움이 됩니다!</span></td>
                </tr>
            </table>

        </div>
  
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-bs-dismiss="modal">신고</button>
        </div>
  
      </div>
    </div>
  </div>
            
	

</body>
</html>