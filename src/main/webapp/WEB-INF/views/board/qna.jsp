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
 page:  ${page }
 max:  ${maxpage }
 start:  ${startpage }
 end:  ${endpage }
   <br>
   
   <c:set var="a" value="${startpage }"></c:set>
	${a}
   <center>
  <div style="clear: both">
  <br>
   <table>
   <tr align=center height=20>
      <td colspan=7 style=font-family:Tahoma;font-size:10pt;>
         <c:choose>
         <c:when test="${page<=1}">[����]&nbsp;</c:when>
         <c:otherwise>
         <a href="qna.user?page=${page-1}">[����]</a>&nbsp;
         </c:otherwise>
         </c:choose>
        
         <c:set var="a" value="${startpage }"></c:set>
        
        
        <%--  <c:forEach begin="${a}" end="${endpage }" step="${a}">
         <c:choose>
         	<c:when test="${a==page }">[${a}]</c:when>
         	<c:otherwise>
         	
         	<a href="qna.user?page=${a}">[${a}]</a>&nbsp;
         	</c:otherwise>
         	
         </c:choose>
         </c:forEach>
         --%>
     
       <c:forEach begin="${a}" end="${endpage }" step="${a}">
         
        <c:choose>
         	<c:when test="${a==page }">[${a}]</c:when>
         	
         	<c:otherwise>
         	<a href="qna.user?page=${a}">[${a}]</a>&nbsp;
         	</c:otherwise>
         	
         </c:choose> 
         </c:forEach>
        
         
         
          
         <c:choose>
         <c:when test="${page>=maxpage }">[����]</c:when>
         <c:otherwise>
         <a href="qna.user?page=${page+1}">[����]</a>
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
			<a href="notice.jsp">����</a>
			<c:forEach var="i" begin="1" end="${getqnum}" step="1">
				<a href="notice.htm?pg=1&f=${param.f}&q=${param.q}">${i}</a>&nbsp;
				</c:forEach>
			<span>����</span>
		</div>
	</div> --%>
