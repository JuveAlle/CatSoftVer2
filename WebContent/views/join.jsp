<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>나무소셜</title>
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/bootswatch.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
    <script type="text/javascript"	src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
    <script>
    	
    	function ckPassword() {
    	var password = document.getElementById("password").value;
    	var check = document.getElementById("check").value;
    		if(password != check){
	    		alert("비밀번호를 확인하세요");
    		}
    	}
    	
    	$(function() {
    		$("#btnCheck").click(ckId);
    	});
    	
    	var ckId = function(){
    		$.ajax({
    			url : "/CatSoft/member/check.do",
    			type : "get",
    			data : {
    				"id" : $("#id").val()
    			},
    			success : pass,
    			error : failCallback
    		});
    		alert($("#id").val());
    	}
    	
    	var pass = function(data) {
    		if (data) {
    			console.log("pass에 진입함" + data);
    			// 		dupStatus = data;
    			// 		console.log("dupStatus : " + dupStatus);
    			alert("사용가능한 아이디입니다.")
    			// 			dupStatus = false;
    		} else {
    			console.log(data);
    			alert("중복 코드입니다.")
    			// 			dupStatus = true;
    		}
    		;
    	};
    	var failCallback = function(data) {
    		console.log("콜백에 접속");
    		alert("입력해주세요");
    	}
    	
    	
    </script>
</head>
<body>

<!-- Main Navigation ========================================================================================== -->
<div class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">CatSoft</a>
        </div>
    </div>
</div>

<!-- Header ========================================================================================== -->
<header>
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="jumbotron">
                    <h1>CatSoft 회원가입</h1>
                </div>
            </div>
        </div>
    </div>
</header>

<!-- Container ======================================================================================= -->
<div class="container">
    <div class="row">
        <div class="col-lg-12">

            <div class="page-header">
                <h2 id="container">회원 가입하기</h2>
            </div>
            <div class="well">
                <p id="show">회원가입을 위해 아래 내용들을 작성해 주세요.</p>
                <form class="form-horizontal" action="${pageContext.request.contextPath}/memeber/join.do" method="POST" onsubmit="ckPassword()">
                    <fieldset>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">아이디</label>

                            <div class="col-lg-10">
                                <input type="text" style="width: 60%; display: inline-block;" class="form-control" placeholder="아이디" id="id" name="id" value="${user.id }">
                            	<button id="btnCheck" onclick="return false;">중복확인</button>
<!-- 									<input type="button" id="btnCheck" value="중복확인"> -->
                            	<label style="display: inline-block;" id="show"></label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">이름</label>

                            <div class="col-lg-10">
                                <input type="text" style="width: 60%;" class="form-control" placeholder="이름" id="name" name="name" value="${user.name}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">이메일</label>

                            <div class="col-lg-10">
                                <input type="text" style="width: 60%;" class="form-control" placeholder="이메일" id="email" name="email" value="${user.email }"> 
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">비밀번호</label>

                            <div class="col-lg-10">
                                <input type="password" style="width: 60%;" class="form-control" placeholder="비밀번호" id="password" name="password" value="${user.password }">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">비밀번호 확인</label>

                            <div class="col-lg-10">
                                <input type="password" style="width: 60%; display: inline-block;" class="form-control" placeholder="비밀번호 확인" id="check" name="check">
                            	<label style="display: inline-block;"></label>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-10 col-lg-offset-2">
                                <button type="submit" class="btn btn-primary">확인</button>
                                <button class="btn btn-default">취소</button>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>

    </div>

<!-- Footer ========================================================================================== -->
    <footer>
        <div class="row">
            <div class="col-lg-12">
                <p>Cat soft</p>
            </div>
        </div>
    </footer>
</div>

</body>
</html>