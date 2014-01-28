<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>

<s:authentication property="name" var="loginUser"/>

<h2> ${loginUser }¥‘¿« My Player List</h2>
<br>
<div class="popup">
  <ul>
	   <c:forEach var="m" items="${mylists}">
		  <li>
			  <a href="#">${m.getMtitle()}/${m.getMsname()}</a>
			  <hr>
    	  </li>
	   </c:forEach>
  </ul>
</div>

