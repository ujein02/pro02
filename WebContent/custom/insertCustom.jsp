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
<link rel="stylesheet" href="common.css">
<style>
.title { padding-top:36px; padding-bottom:20px; }
</style>
</head>
<body>
<%@ include file="../header.jsp" %>

<div class="content container">
	<h2 class="title">회원가입</h2>
	<form name="frm1" action="../InsertCustomCtrl" method="post" id=insertCustom class="frm1" onsubmit="return joinAlert(this)">
		<table class="table">
			<tbody>
				<tr>
					<th>아이디</th>
					<td>
						<div class="form-row">
							<input type="text" id= "cusId" name="cusId" placeholder="아이디 입력" class="form-control" autofocus required/>
							<input type="button" class="btn btn-secondary" value="아이디 중복 확인" onclick="idCheck()">
							<input type="hidden" name="idck" value="no">
						</div>
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
					<td><input type="text" id= "cusName" name="cusName" placeholder="이름 입력" class="form-control" required/></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" id= "address1" name="address1" placeholder="기본 주소 입력" class="form-control" required/><br>
					<input type="text" id= "cusName" name="address2" placeholder="상세주소 입력" class="form-control" required/><br>
					<input type="text" id="postcode" name="postcode" style="width:160px;float:left;margin-right:20px;" placeholder="우편번호" class="form-control" required/><br>
					<button id="post_btn" onclick="findAddr()" class="btn btn-primary">우편번호 검색</button>
					</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input type="text" id= "tel" name="tel" placeholder="010-0000-0000" class="form-control" required/></td>
				</tr>
			</tbody>
		</table>
		<div class="btn-group">
			<input type="submit" name="submit-btn" class="btn btn-secondary" value="회원가입">
			<input type="reset" name="reset-btn" class="btn btn-secondary" value="취소">
			
		</div>
	</form>
	
</div>
<script>
	function idCheck(){
		var cusId = document.frm1.cusId.value;
		var win = window.open("idCheck.jsp?cusId="+cusId,"id 중복 체크", "width=400, height=300");
	}
	
	
	function joinAlert(f){
		if(f.cusPw.value!=f.cusPw2.value){
			alert("비밀번호와 비밀번호 확인이 서로 다릅니다.");
			f.cusPw.focus();
			return false;
		}
		if(f.idck.value!="yes"){
			alert("아이디 중복 체크를 하지 않으셨습니다.");
			return false;
		}
	}
	
	
</script>
<script>
function findAddr() {
	new daum.Postcode({
		oncomplete: function(data) {
			console.log(data);
			var roadAddr = data.roadAddress;
			var jibunAddr = data.jibunAddress;
			document.getElementById("postcode").value = data.zonecode;
			if(roadAddr !== '') {
				document.getElementById("address1").value = roadAddr;				
			} else if(jibunAddr !== ''){
				document.getElementById("address1").value = jibunAddr;
			}
			document.getElementById("address2").focus();
		}
	}).open();
}
</script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>