<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	qna 게시판
	<div align="right"> <a href="qnaWrite.user">글쓰기</a> &nbsp; </div>
	<table class="article-list margin-small">
      					<thead>
							<tr>
								<th class="seq">번호</th>
								<th class="title">제목</th>
								<th class="writer">작성자</th>
								<th class="regdate">작성일</th>
								<th class="hit">조회수</th>
							</tr>
						</thead>
						</table>
						
						<table class="article-list margin-small">
						<tbody>

						<c:forEach items="${qnaList}"  var="n">
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
						
						
</body>
</html>