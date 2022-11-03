<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, kr.co.myshop.vo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>로그인</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
.title { padding-top:36px; padding-bottom:20px; }
</style>
</head>
<body>
<%@ include file="../header.jsp" %>
<%
	Notice vo = (Notice) request.getAttribute("notice");
%>
<div class="content container">
	<h2 class="title">아이디 중복 확인</h2>
	<form name="frm1" action="../IdCheckProCtrl" method="post" id="" class="frm1" onsubmit="return invalidCheck(this)">
		<input type="text" id= "cusId" name="cusId" placeholder="4글자 이상 문자 또는 숫자 입력" class="form-control" autofocus required/>
		<input type="submit" class="form-control" value="중복확인">
	</form>
	<script>
	function invalidCheck(f){
		var cusId = f.cusId.value;
		cusId = cusId.trim();
		if(cusId.lengh<4){
			alert("아이디의 글자수는 4글자 이상이어야 합니다.");
			return false;
		}
	}
	</script>
</div>

</body>
</html>