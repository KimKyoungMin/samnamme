<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>
<h2>공지사항</h2>

<div align="right">
<s:authorize ifAnyGranted="ROLE_ADMIN">
			    <a href="noticewrite.user">공지사항 등록</a>
	      </s:authorize>
	
</div>
<!-- noticeBoardList -->
<c:forEach var="f" items="${noticeBoardList}">
<div class="blockL">
	<div class="blockM">
		<ul>
			<li>${f.getUserid()}: ${f.getBtitle() }<br>
				<div style="text-align: left">${f.getBdate() }</div>
			</li>
			<div class="notice">
				${f.getBcontent() }<br>
				<s:authorize ifAnyGranted="ROLE_ADMIN">
			    <a href="noticeupdate.user?bnum=${f.getBnum() }">글 수정하기</a> ||
				<a href="noticedelete.user?bnum=${f.getBnum() }">글 삭제하기</a>
	      </s:authorize>
				
				 <img
					src="CSS/noticeboardpic/${f.getBpicname()}" width="500px"
					height="300px">
			</div>
		</ul>
	</div>
	<!-- noticeBoardReplyList -->
	<div class="blockN">
	<c:forEach var="c" items="${noticeBoardReplyList}">
		<c:if test="${f.getBnum() == c.getBnum()}">
			${c.getUsername() } : ${c.getCcontent() } <div style="text-align: left">${c.getCdate() }</div><br>
			</c:if>
	</c:forEach>
	</div>
	</div>
</c:forEach>
<div class="blockM">
<form method="get" action="">
<input type="hidden" name="lastnum" value="${lastNumber.getLastnum() }">
<input type="submit" name="" value="공지사항 더 확인하기">
</form>
</div>
