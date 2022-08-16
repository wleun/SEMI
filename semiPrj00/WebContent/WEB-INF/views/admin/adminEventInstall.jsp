<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    
    #eventInstallOuter {
      display: flex;
      flex-wrap: wrap;
      flex-direction: row;
      justify-content: center;
      align-items: center;
      width: 1500px;
      height: 1000px;
      margin-left: 75px;
  }

  #eventInstall {
      display: flex;
      flex-direction: column;
      justify-content: flex-start;
      width: 85%;
      height: 70%;
      border: 1px solid #C3B091;
      border-radius: 10px;
  }

  
    #eventHeader {
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
    
    #eventInstall>form {
      display: flex;
      flex-direction: column;
      height: 100%;
      width: 100%;
    }

    #eventInstall>form * {
        font-size: 18px;
    }

  #eventWriteArea {
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

  #content input {
    width: 700px;
    height: 100%;
    border-radius: 10px;
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
    height: 15%;
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
    padding-left: 100px;
  }

  #fileInput input {
    border: none;
    border-radius: 0px;
  }

  #btns {
    width: 100%;
    height: 10%;
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

</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/adminLayout.jsp" %>

<content>
    <div id="eventInstallOuter">
        <div id="eventInstall">
            <div id="eventHeader"> 이벤트 작성 *
            </div>
            <form action="">
                <div id="eventWriteArea">
                    <div id="title">
                        <div id="titleText" class="padding-right">제목 : </div>
                        <div id="titleInput"><input type="text"></div>
                    </div>
                    <div id="content">
                        <div id="contentText" class="padding-right">내용 : </div>
                        <div id="contentInput"><input type="textarea"></div>
                    </div>
                    <div id="file">
                        <div id="fileText" class="padding-right" >이미지 파일 : </div>
                        <div id="fileInput"><input type="file"></div>
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

</body>
</html>