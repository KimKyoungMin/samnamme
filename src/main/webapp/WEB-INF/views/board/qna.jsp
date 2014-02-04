<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
int startpage = (Integer)request.getAttribute("startpage");
int endpage = (Integer)request.getAttribute("endpage");
int nowpage = (Integer)request.getAttribute("page");
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>


</head>
<body>
	qna 게시판
	<div align="right">
		<a href="qnaWrite.user">글쓰기</a> &nbsp;
	</div>
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

			<c:forEach items="${qnaList}" var="n">
				<tr>
					<td class="seq">${n.qnum}</td>
					<td class="title"><a href="qnaDetail.user?qnum=${n.qnum}">${n.qtitle}</a></td>
					<td class="writer">${n.userid}</td>
					<td class="regdate">${n.qdate}</td>
					<td class="hit">${n.qcount}</td>
				</tr>
			</c:forEach>

		</tbody>
	</table>
 page:  ${page }
 max:  ${maxpage }
 start:  ${startpage }
 end:  ${endpage }
   <br>
   
  
	${a}
   <center>
  <div style="clear: both">
  <br>
   <table  class="list_n_menu">
   <tr align=center height=20>
      <td colspan=7 style=font-family:Tahoma;font-size:10pt;>
         <c:choose>
         <c:when test="${page<=1}"><a class="active">이전</a>&nbsp;</c:when>
         <c:otherwise>
         <a href="qna.user?page=${page-1}" class="disabled">이전</a>&nbsp;
         </c:otherwise>
         </c:choose>
        
      <%for(int a=startpage;a<=endpage;a++){
				if(a==nowpage){%>
				<a class="current"><%=a %></a>
				<%}else{ %>
				<a href="qna.user?page=<%=a %>" class="disabled"><%=a %></a>&nbsp;
				<%} %>
			<%} %>
          
         <c:choose>
         <c:when test="${page>=maxpage }"><a class="active">다음</a></c:when>
         <c:otherwise>
         <a href="qna.user?page=${page+1}">다음</a>
         </c:otherwise>
         </c:choose>
      </td>
   </tr>
   </table>
   </div>
   </center>


</body>
</html>

<%-- 

	<div id="pager-wrapper" class="margin-small">
		<br>
		<div>
			<a href="notice.jsp">이전</a>
			<c:forEach var="i" begin="1" end="${getqnum}" step="1">
				<a href="notice.htm?pg=1&f=${param.f}&q=${param.q}">${i}</a>&nbsp;
				</c:forEach>
			<span>다음</span>
		</div>
	</div> --%>
