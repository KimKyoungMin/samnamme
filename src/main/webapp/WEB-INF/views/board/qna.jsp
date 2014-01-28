<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	qna �Խ���
	<div align="right">
		<a href="qnaWrite.user">�۾���</a> &nbsp;
	</div>
	<table class="article-list margin-small">
		<thead>
			<tr>
				<th class="seq">��ȣ</th>
				<th class="title">����</th>
				<th class="writer">�ۼ���</th>
				<th class="regdate">�ۼ���</th>
				<th class="hit">��ȸ��</th>
			</tr>
		</thead>
	</table>

	<table class="article-list margin-small">
		<tbody>

			<c:forEach items="${qnaList}" var="n">
				<tr>
					<td class="seq">${n.qnum}</td>
					<td class="title"><a href="qnaDetail.user?qnum=${n.qnum}">${n.qtitle}</a></td>
					<td class="writer">${n.userid}</td>
					<td class="regdate">${n.qdate}</td>
					<td class="hit">${n.depth}</td>
				</tr>
			</c:forEach>

		</tbody>
	</table>




	<div id="pager-wrapper" class="margin-small">
		<div class="pager clear">
			<p id="btnPrev">
				<a class="button btn-prev" href="notice.jsp">����</a>
			</p>
			<ul>
				<li><a class="strong"
					href="notice.htm?pg=1&f=${param.f}&q=${param.q}">1</a></li>
				<li><a href="notice.htm?pg=2&f=${param.f}&q=${param.q}">2</a></li>
				<li><a href="notice.htm?pg=3&f=${param.f}&q=${param.q}">3</a></li>
				<li><a href="notice.htm?pg=4&f=${param.f}&q=${param.q}">4</a></li>
				<li><a href="notice.htm?pg=5&f=${param.f}&q=${param.q}">5</a></li>
			</ul>
			<p id="btnNext">
				<span class="button btn-next">����</span>
			</p>
		</div>
	</div>




</body>
</html>