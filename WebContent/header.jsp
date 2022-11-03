<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<nav class="navbar navbar-expand-lg navbar-light bg-primary">
	  <a class="navbar-brand"  id="logo" href="index.jsp" >KOLON SPORT</a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	
	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item active">
	        <a class="nav-link" href="#">KOLON SPORT<span class="sr-only">(current)</span></a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#">ISSUE</a>
	      </li>
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
	          OUTDOOR
	        </a>
	        <div class="dropdown-menu">
	          <a class="dropdown-item" href="#">SHOES</a>
	          <div class="dropdown-divider"></div>
	          <a class="dropdown-item" href="#">CAMPING</a>
	          <div class="dropdown-divider"></div>
	          <a class="dropdown-item" href="#">WEAR</a>
	        </div>
	      </li>
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="true">
	          Community
	        </a>
	        <div class="dropdown-menu">
	          <a class="dropdown-item" href="GetBoardListCtrl">Notice</a>
	          <a class="dropdown-item" href="#">FAQ</a>
	          <a class="dropdown-item" href="#">Q&A</a>
	        </div>
	      </li>
	    </ul>
		  <form class="container-fluid justify-content-start">
		    <a href="LoginProCrtl" class="btn btn-secondary">로그인</a>
		    <a href="./custom/insertCustom.jsp" class="btn btn-secondary" >회원가입</a>
		  </form>
	  
	  </div>
	</nav>