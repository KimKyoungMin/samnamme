<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
int startpage = (Integer)request.getAttribute("startpage");
int endpage = (Integer)request.getAttribute("endpage");
int nowpage = (Integer)request.getAttribute("page");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


</head>
<body>
	<h2>qna 게시판</h2>
	<div align="right">
		<a href="qnaWrite.user" class="dynamiclabel_2">글쓰기</a> &nbsp;
	</div>
	
	<table class="article-list margin-small">
		<thead>
			<tr>
				<td class="seq">번호</td>
				<td class="title">제목</td>
				<td class="writer">작성자</td>
				<td class="regdate">작성일</td>
				<td class="hit">조회수</td>
			</tr>
		</thead>
		<tbody style="background-color:#fff;">
			<c:forEach items="${qnaList}" var="n">
				<tr>
					<td class="seq">${n.qnum}</td>

					<td class="title"><c:choose>
							<c:when test="${n.qdepth!=0 }">
								<c:forEach begin="0" end="${n.qdepth*2 }" step="1">
							&nbsp;
							</c:forEach>
								<img src="./upload/rep.png">
							</c:when>
						</c:choose> <a href="qnaDetail.user?qnum=${n.qnum}">${n.qtitle}</a></td>
					
					<td class="writer">${n.userid}</td>
					<td class="regdate">${n.qdate}</td>
					<td class="hit">${n.qcount}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table> 

   <br>
 ${a}
   <center>
  <div style="clear: both">
  <br>
   <table  class="list_n_menu">
   <tr align=center height=20>
      <td colspan=7 style=font-family:Tahoma;font-size:10pt;>
         <c:choose>
         <c:when test="${page<=1}"><a class="active">◀</a>&nbsp;</c:when>
         <c:otherwise>
         <a href="qna.user?page=${page-1}" class="disabled">◀</a>&nbsp;
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
         <c:when test="${page>=maxpage }"><a class="active">▶</a></c:when>
         <c:otherwise>
         <a href="qna.user?page=${page+1}">▶</a>
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
