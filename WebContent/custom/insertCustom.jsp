<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, kr.co.myshop.vo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>회원가입</title>
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
	<h2 class="title">회원가입</h2>
	<form name="frm1" action="../InsertCustomProCtrl" method="post" id=insertCustom class="frm1" onsubmit="return joinAlert(this)">
		<table class="table">
			<tbody>
				<tr>
					<th>아이디</th>
					<td><input type="text" id= "cusId" name="cusId" placeholder="아이디 입력" class="form-control" autofocus required/>
						<button type="button" class="in_btn" onclick="idCheck()">아이디 중복 확인</button>
						<input type="hidden" name="idck" value="no"/>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" id= "cusPw" name="cusPw" placeholder="비밀번호 입력" class="form-control" required/></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password" id= "cusPw2" name="cusPw2" placeholder="비밀번호 입력" class="form-control" required/></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" id= "cusName" name="cusName" placeholder="비밀번호 입력" class="form-control" required/></td>
				</tr>
				<tr>
					<th>기본주소</th>
					<td><input type="text" id= "address" name="address" placeholder="주소 입력" class="form-control" required/></td>
				</tr>
				<tr>
					<th>상세주소</th>
					<td><input type="text" id= "cusName" name="address2" placeholder="상세주소 입력" class="form-control" required/></td>
				</tr>
				<tr>
					<th>휴대번호</th>
					<td><input type="text" id= "tel" name="tel" placeholder="010-0000-0000" class="form-control" required/></td>
				</tr>
			</tbody>
		</table>
		<div class="btn-group">
			<input type="submit" name="submit-btn" class="btn btn-secondary" value="회원가입">
			<input type="reset" name="reset-btn" class="btn btn-secondary" value="취소">
			<a href="../GetBoardListCtrl" class="btn btn-secondary">목록으로</a>
		</div>
	</form>
	
</div>
<script>
	function joinAlert(f){
		if(f.pw.value!=f.pw2.value){
			alert("비밀번호와 비밀번호 확인이 서로 일치하지 않습니다.");
			return false;
		}
		if(i.idck.value!="yes"){
			alert("아이디 중복 체크를 하지 않으셨습니다.");
			return false;
		}
	}
	
	function idCheck(){
		var win = window.open("./custom/idCheck.jsp","idCheckWin","width=600,height=400");
	}
</script>
</body>
</html>