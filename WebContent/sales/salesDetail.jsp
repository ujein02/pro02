<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, kr.co.myshop.vo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>판매 상세 내역 페이지</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="common.css">

<style>
.title { padding-top:36px; padding-bottom:20px; }
.btn-group {float:right; padding:10px;}
</style>
</head>
<body>
<%@ include file="../header.jsp" %>
<%
	Sales vo = (Sales) request.getAttribute("sales");
%>
<div class="container-fluid" id="content">
	<div class="row" id="content_row">
		<% if(sid!=null && sid.equals("admin")) { %>
		<%@ include file="../admin/admin_sidebar.jsp" %>
		<% } %>
		<% if(sid!=null && sid.equals("admin")) { %>
		<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
		<% } else { %>
		<main class="content container">
		<% } %>
			<h2 class="title">판매 상세 내역</h2>
			<table class="table">
				<tbody>
					<tr>
						<th>판매 번호</th>
						<td><%=vo.getSaleNo() %></td>
					</tr>
					<tr>
						<th>판매 제품 번호</th>
						<td><%=vo.getProNo() %></td>
					</tr>
					<tr>
						<th>판매 수량</th>
						<td><%=vo.getAmount() %></td>
					</tr>
					<tr>
						<th>판매일</th>
						<td><%=vo.getSaleDate() %></td>
					</tr>
					<tr>
						<th>배송번호</th>
						<td><%=vo.getParselNo() %></td>
					</tr>
					<tr>
						<th>결제번호</th>
						<td><%=vo.getProNo() %></td>
					</tr>
				</tbody>
			</table>
			<div class="btn-group">
				<a href="<%=request.getContextPath() %>/GetMemberSalesInfoCtrl" class="btn btn-secondary">목록으로</a>
				<% if(vo.getCusId().equals(sid) && vo.getParselState()==0) { %>
				<a href="<%=request.getContextPath() %>/DeleteSalesCtrl?saleNo=<%=vo.getSaleNo() %>" class="btn btn-primary">결제 취소</a>
				<a href="<%=request.getContextPath() %>/UpdateSalesCtrl?parselNo=<%=vo.getParselNo() %>" class="btn btn-secondary">배송 정보 수정</a>
				<% } %>
			</div>
		</main>
	</main>		
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>