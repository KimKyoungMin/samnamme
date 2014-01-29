<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>

<h2>공지사항</h2>
<script type="text/javascript">



</script>
<div align="right">
<s:authorize ifAnyGranted="ROLE_ADMIN">
			    <a href="noticewrite.user">공지사항 등록</a>
	      </s:authorize>
	
</div>
<!-- noticeBoardList -->
<c:forEach var="f" items="${noticeBoardList}">
	<div class="blockM">
		<ul>
			<li>${f.getUserid()}: ${f.getBtitle() }<br>
				<div style="text-align: left">${f.getBdate() }</div>
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
			${c.getUsername() } : ${c.getCcontent() } <div style="text-align: left">${c.getCdate() }</div><br>
			</c:if>
	</c:forEach>
	</div>
</c:forEach>

<!-- </div> -->