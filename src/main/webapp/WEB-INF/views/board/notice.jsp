<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<h2>Notice board</h2>
<div align="right">
	<a href="noticewrite.user">글쓰기</a>
</div>
<!-- noticeBoardList -->
<c:forEach var="f" items="${noticeBoardList}">
	<div class="blockM">
		<ul>
			<li>${f.getUserid()}: ${f.getBtitle() }<br>
			</li>
			<div class="notice">
				${f.getBcontent() }<br> <img
					src="CSS/noticeboardpic/${f.getBpicname()}" width="500px"
					height="300px">
			</div>
		</ul>
	</div>
	<!-- noticeBoardReplyList -->
	<div class="blockM" style="margin-top: 50px">
	<c:forEach var="c" items="${noticeBoardReplyList}">
		<c:if test="${f.getBnum() == c.getBnum()}">
			${c.getUsername() } : ${c.getCcontent() }<br>
			</c:if>
	</c:forEach>
	</div>
</c:forEach>

<!-- </div> -->