<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, kr.co.myshop.vo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>공지사항 수정</title>
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
	<h2 class="title">공지사항 수정</h2>
	<form name="frm1" action="../InsertBoardProCtrl" method="post" class="frm1">
		<table class="table">
			<tbody>
				
				<tr>
					<th>제목</th>
					<td><input type="text" name="title" placeholder="제목 입력" class="form-control" autofocus required/></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea cols="80" rows="6" name="content" id="content" class="form-control" required></textarea></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="author" id="author" value="admin" class="form-control"/></td>
				</tr>
			</tbody>
		</table>
		<div class="btn-group">
			<input type="submit" name="submit-btn" class="btn btn-secondary" value="글 등록">
			<input type="reset" name="reset-btn" class="btn btn-secondary" value="취소">
			<a href="../GetBoardListCtrl" class="btn btn-secondary">목록으로</a>
		</div>
	</form>
	
</div>
</body>
</html>