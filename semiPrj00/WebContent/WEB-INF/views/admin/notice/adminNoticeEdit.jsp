<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    
    #noticeEditOuter {
      display: flex;
      flex-wrap: wrap;
      flex-direction: row;
      justify-content: center;
      align-items: center;
      width: 1500px;
      height: 1000px;
      margin-left: 75px;
  }

  #noticeEdit {
      display: flex;
      flex-direction: column;
      justify-content: flex-start;
      width: 85%;
      height: 70%;
      border: 1px solid #C3B091;
      border-radius: 10px;
  }

  
    #noticeHeader {
      width: 100%;
      height: 10%;
      background-color: #F9F5EA;
      border-bottom: 1px solid #C3B091;
      border-radius: 10px 10px 0px 0px;
      display: flex;
      flex-direction: row;
      justify-content: center;
      align-items: center;
      font-size: 22px;
      color: #C3B091;
    }

    #headerNotUsedArea {
      width: 15%;
    }

    #noticeHeaderText {
      width: 70%;
      text-align: center;
    }

    #noticeImportant {
      width: 100%;
      display: flex;
      flex-direction: row;
      justify-content: space-evenly;
      font-size: medium;
      align-items: center;
    }

    #noticeImportant select {
      width: 80px;
      height: 30px;
      text-align: center;
    }
    
    #noticeEdit>form {
      display: flex;
      flex-direction: column;
      height: 100%;
      width: 100%;
    }

    #noticeEdit>form * {
        font-size: 18px;
    }

  #noticeWriteArea {
    width: 100%;
    height: 100%;
    display: flex;
    flex-direction: column;
  }

  #title {
    width: 100%;
    height: 15%;
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
  }

  #title input {
    width: 700px;
    height: 40px;
    border-radius: 10px;
  }

  #content textarea {
    width: 700px;
    height: 100%;
    border-radius: 10px;
    border: 1px solid #C3B091;
  }

  .padding-right {
    padding-right: 20px;
  }

  #content {
    width: 100%;
    height: 60%;
    display: flex;
    flex-direction: row;
    justify-content: center;
  }

  #file {
    width: 100%;
    height: 18%;
    display: flex;
    flex-direction: column;
    justify-content: space-evenly;
    align-items: center;
    padding-left: 100px;
  }

  #fileInput input {
    border: none;
    border-radius: 0px;
  }

  #btns {
    width: 100%;
    height: 7%;
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
  }

  #notUsedArea {
    width: 80%;
    height: 100%;
    display: flex;
  }

  #formBtns {
    width: 20%;
    height: 100%;
    display: flex;
    flex-direction: row;
    justify-content: space-evenly;
  }

  #formBtns * {
    width: 90px;
    height: 30px;
  }

  .filebox #upload-name1{
    display: inline-block;
    height: 40px;
    padding: 0 10px;
    vertical-align: middle;
    border: 1px solid #dddddd;
    border-radius: 10px;
    color: #999999;
  }
  .filebox #upload-name2{
    display: inline-block;
    height: 40px;
    padding: 0 10px;
    vertical-align: middle;
    border: 1px solid #dddddd;
    border-radius: 10px;
    color: #999999;
  }
  .filebox label {
    display: inline-block;
    padding: 10px 20px;
    color: #fff;
    vertical-align: middle;
    background-color: #48CA7D;
    border-radius: 50px;
    cursor: pointer;
    height: 40px;
    margin-left: 10px;
}
  .filebox input[type=file] {
    position: absolute;
    width: 0;
    height: 0;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip: rect(0,0,0,0);
    border: 0;
  }

  

</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/adminLayout.jsp" %>

<content>
    <div id="noticeEditOuter">
        <div id="noticeEdit">
            <div id="noticeHeader"> 
              <div id="headerNotUsedArea"></div>
              <div id="noticeHeaderText">공지사항 수정 *</div>
         <form id="edit_form" action="<%=contextPath %>/admin/notice/edit" method="post" enctype="multipart/form-data">
              <div id="noticeImportant">
                중요도 : 
                <select name="important">
                  <option value="N">일반</option>
                  <option value="Y">중요</option>
                </select>
              </div>
            </div>
                <div id="noticeWriteArea">
                    <div id="title">
                        <div id="titleText" class="padding-right">제목 : </div>
                        <div id="titleInput"><input type="text" name="title" value="${adminNoticeVo.title}"></div>
                    </div>
                <input type="hidden" name="no" value="${adminNoticeVo.no}">
                    <div id="content">
                        <div id="contentText" class="padding-right">내용 : </div>
                        <div id="contentInput"><textarea name="content" cols="30" rows="10">${adminNoticeVo.content}</textarea></div>
                    </div>
                    <div id="file">
                    *파일을 다시 업로드해주세요.
                      <div class="filebox">
                        <input id="upload-name1" value="섬네일 이미지 첨부" placeholder="섬네일 이미지 첨부">
                        <label for="fileInsert1">파일찾기</label>
                        <input type="file" id="fileInsert1" name="thumbnailFile">
                      </div>
                      <div class="filebox">
                        <input id="upload-name2" value="공지사항 이미지 파일 첨부" placeholder="공지사항 이미지 파일 첨부">
                        <label for="fileInsert2">파일찾기</label> 
                        <input type="file" id="fileInsert2" name="imageFile">
                      </div>
                    </div>  
                    <div id="btns">
                        <div id="notUsedArea"></div>
                        <div id="formBtns">
                            <input type="submit" value="작성완료" class="button">
                            <button>뒤로가기</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>

</content>

<script>
  $("#fileInsert1").on('change',function(){
    var fileName = $("#fileInsert1").val();
    $("#upload-name1").val(fileName);
  });

  $("#fileInsert2").on('change',function(){
    var fileName = $("#fileInsert2").val();
    $("#upload-name2").val(fileName);
  });
</script>

</body>
</html>