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
	<h2 class="title">로그인</h2>
	<form name="frm1" action="../LoginProCtrl" method="post" id="" class="frm1">
		<table class="table">
			<tbody>
				<tr>
					<th>아이디</th>
					<td><input type="text" id= "cusId" name="cusId" placeholder="아이디 입력" class="form-control" autofocus required/></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" id= "cusPw" name="cusPw" placeholder="비밀번호 입력" class="form-control" required/></td>
				</tr>
			</tbody>
		</table>
		<div class="btn-group">
			<input type="submit" name="submit-btn" class="btn btn-secondary" value="로그인">
			<input type="reset" name="reset-btn" class="btn btn-secondary" value="취소">
		</div>
	</form>
	
</div>

</body>
</html>