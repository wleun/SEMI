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

    #headerNotUsedArea {
      width: 15%;
    }

    #eventHeaderText {
      width: 70%;
      text-align: center;
    }

    #eventImportant {
      width: 100%;
      display: flex;
      flex-direction: row;
      justify-content: space-evenly;
      font-size: medium;
      align-items: center;
    }

    #eventImportant select {
      width: 80px;
      height: 30px;
      text-align: center;
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
    align-items: center;
  }

  #titleNotUsedArea {
    width: 20%;
    height: 100%;
  }

  #title input[type=text] {
    width: 700px;
    height: 40px;
    border-radius: 10px;
    color : black;
  }

  #datebox {
    width: 20%;
    height: 100%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
  }

  .datebox {
    color : #C3B091;
    font-size: small;
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
    <div id="eventInstallOuter">
        <div id="eventInstall">
            <div id="eventHeader"> 
              <div id="headerNotUsedArea"></div>
              <div id="eventHeaderText">????????? ?????? *</div>
         <form id="install_form" action="<%=contextPath %>/admin/event/install" method="post" enctype="multipart/form-data"> 
              <div id="eventImportant">
                ????????? : 
                <select name="important" required>
                  <option value="N">??????</option>
                  <option value="Y">??????</option>
                </select>
              </div>
            </div>
                <div id="eventWriteArea">
                    <div id="title">
                        <div id="titleNotUsedArea"></div>
                        <div id="titleText" class="padding-right">?????? : </div>
                        <div id="titleInput"><input type="text" name="title" required></div>
                        <div id="datebox">
                          <div class="datebox">????????? : <input type="date" id="startDate" name="startDate" onchange=dateCalc() max="2022-12-31" required></div>
                          <div class="datebox">????????? : <input type="date" id="endDate" name="endDate" onchange=dateCalc() max="2022-12-31" required></div>
                        </div>
                    </div>
                    <div id="content">
                        <div id="contentText" class="padding-right">?????? : </div>
                        <div id="contentInput"><textarea name="content" cols="30" rows="10" required></textarea></div>
                    </div>
                    <div id="file">
                      <div class="filebox">
                        <input id="upload-name1" value="????????? ????????? ??????" placeholder="????????? ????????? ??????" required>
                        <label for="fileInsert1">????????????</label>
                        <input type="file" id="fileInsert1" name="thumbnailFile">
                      </div>
                      <div class="filebox">
                        <input id="upload-name2" value="????????? ????????? ?????? ??????" placeholder="????????? ????????? ?????? ??????" required>
                        <label for="fileInsert2">????????????</label> 
                        <input type="file" id="fileInsert2" name="imageFile">
                      </div>
                    </div>  
                    <div id="btns">
                        <div id="notUsedArea"></div>
                        <div id="formBtns">
                            <input type="submit" value="????????????" class="button">
                            <button>????????????</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>

</content>

<script>

  //?????? input?????? file??? name ?????? (????????? ????????? ??????)
  $("#fileInsert1").on('change',function(){
    var fileName = $("#fileInsert1").val();
    $("#upload-name1").val(fileName);
  });

  //?????? input?????? file??? name ?????? (????????? ??????)
  $("#fileInsert2").on('change',function(){
    var fileName = $("#fileInsert2").val();
    $("#upload-name2").val(fileName);
  });

  // ?????? ?????? (??????????????? ???????????? ???????????? ???????????? ??????????????? ?????????)
  function getToday() {
			var date = new Date();
			var year = date.getFullYear();
			var month = ("0" + (1 + date.getMonth())).slice(-2);
			var day = ("0" + date.getDate()).slice(-2);
			return year + "-" + month + "-" + day;
		}

		// ?????? ?????? (??????????????? ???????????? ???????????? ???????????? ???????????? 1????????? ??????)
		function getTomorrow(startDay) {
			var temp = new Date(startDay);
			var date = new Date(temp.setDate(temp.getDate() + 1));
			var year = date.getFullYear();
			var month = ("0" + (1 + date.getMonth())).slice(-2);
			var day = ("0" + date.getDate()).slice(-2);
			return year + "-" + month + "-" + day;
		}

		const today = getToday();

		// ???????????? ????????? ??????
		function dateCalc() {

			let startDay = new Date(document.querySelector('#startDate').value);
			let endDay = new Date(document.querySelector('#endDate').value);

			//???????????? ????????? ?????? ??????
			if (startDay.getTime() >= endDay.getTime()) {
				alert("??????????????? ???????????? ????????? ??????????????????");
				document.getElementById('endDate').value = getTomorrow(startDay);
				dateCalc();

				//???????????? ???????????? ????????????
			} else if (document.querySelector('#startDate').value < today) {
				alert("??????????????? ???????????? ????????? ??????????????????");
				document.querySelector('#startDate').value = today;
				dateCalc();

				//?????? ?????? ?????? ??? ???????????? ??????
			} else {
				let passedTime = endDay.getTime() - startDay.getTime();
				passedTime = Math.round(passedTime / (1000 * 60 * 60 * 24));
				//NaN ?????? 
				if (isNaN(passedTime)) {
					passedTime = 0;
				}
				document.querySelector('#dateCalcResult').innerHTML = passedTime;

			}

		}

</script>

</body>
</html>