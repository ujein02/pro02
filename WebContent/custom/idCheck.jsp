<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		String cusId = request.getParameter("cusId");
		if(cusId==null || cusId=="") cusId="";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>아이디 중복 확인</title>

</head>
<body>

<div class="content container">
	<h2 class="title">아이디 중복 확인</h2>
	<form name="frm1" action="../IdCheckCtrl" method="post" id="" class="frm1" onsubmit="return invalidCheck(this)">
		<label for="cusId">아이디</label>
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