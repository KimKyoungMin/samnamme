<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>

<%
int startpage = (Integer)request.getAttribute("startpage");
int endpage = (Integer)request.getAttribute("endpage");
int nowpage = (Integer)request.getAttribute("page");
String userid = (String)request.getAttribute("userid");
%>

<div class="profileA blockA">
<h2 align="center">My Info</h2>
<br>
<form action="account.user" method="post">
YourID <input type="text" name="userid" class="email text2-input" value="${usertDto.userid }" readonly><br>
Name    <input type="text" name="uname" class="email text2-input" value="${usertDto.uname }"><br>
Phone  <input type="text" name="utel" class="email text2-input" value="${usertDto.utel }"><br>
E-mail <input type="text" name="uemail" class="email text2-input" value="${usertDto.uemail }"><br>
<input type="submit" class="edit button" value="Edit">
</form>
</div>





<div class="profileD blockD">
<h2 align="center">My DownList</h2>
<br>
<c:choose>
  <c:when test="${md.size()==0}">
    <h3>다운 받은 리스트가 없습니다.</h3>
  </c:when>
  <c:otherwise>
  <div class="profileDtable">
     <table>
       <tr>
          <th>NO.</th>
          <th>제목</th>
          <th>가수</th>
       </tr>
       <c:forEach var="mdlist" items="${md }">
          <tr>
            <td>${mdlist.getMinfonum() }</td>
            <td>${mdlist.getMtitle() }</td> 
            <td>${mdlist.getMsname() }</td>
           </tr>
       </c:forEach>
     </table>
     
     
  </div>
  </c:otherwise>
</c:choose>

  <div style="clear: both" align="center">
  <br>
   <table  class="list_n_menu">
   <tr align=center height=20>
      <td colspan=7 style=font-family:Tahoma;font-size:10pt;>
         <c:choose>
         <c:when test="${page<=1}"><a class="disabled">◀</a>&nbsp;</c:when>
         <c:otherwise>
         <a href="account.user?userid=<%=userid %>&page=${page-1}" class="disabled">◀</a>&nbsp;
         </c:otherwise>
         </c:choose>
        
      <%for(int a=startpage;a<=endpage;a++){
				if(a==nowpage){%>
				<a class="current"><%=a %></a>
				<%}else{ %>
				<a href="account.user?page=<%=a %>&userid=<%=userid %>" class="disabled"><%=a %></a>&nbsp;
				<%} %>
			<%} %>
          
         <c:choose>
         <c:when test="${page>=maxpage }"><a class="active">▶</a></c:when>
         <c:otherwise>
         <a class="disabled" href="account.user?userid=<%=userid %>&page=${page+1}">▶</a>
         </c:otherwise>
         </c:choose>
      </td>
   </tr>
   </table>
   </div>

</div>




<div class="profileP blockP">
<s:authentication property="name" var="loginUser"/>
<h2 align="center">Payment</h2>
<br>
<b>${loginUser }</b> 님 <br>
<br>
<c:choose>
  <c:when test="${pd==null }">
      결제한 상품이 없습니다.
  </c:when>
  <c:otherwise>
       결제한 상품은 <b>${pd.payname }</b> 입니다.<br>
     <br>
     <br>
     <b>유효 기간</b> <br>
     <input type="text" class="text5-input" name="paydate" value="${pd.paydate }" readonly> 부터 
     <input type="text" class="text5_1-input" name="expdate" value="${pd.expdate }" readonly> 까지
  </c:otherwise>
</c:choose>

<form action="paymentform.user" method="get">
	<input type="submit" class="pay button" value="자세히 보기">
</form>
	
		




</div>




