<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>

<h2>회원 정보</h2>
<div class="userinfo">
<h2 align="center">User Info</h2>
<br>
<form action="settingpay.admin" method="post">
UserID <input type="text" name="userid" class="email text2-input" value="${ud.userid }" readonly><br>
Name    <input type="text" name="uname" class="email text2-input" value="${ud.uname }"><br>
Phone  <input type="text" name="utel" class="email text2-input" value="${ud.utel }"><br>
E-mail <input type="text" name="uemail" class="email text2-input" value="${ud.uemail }"><br>
<input type="submit" class="edit button" value="결제 내역 보기">
</form>
</div>


<div class="userinfo">
<h2 align="center">User DownList</h2>
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
       <c:forEach var="m" items="${md }">
          <tr>
            <td>${m.getMinfonum() }</td>
            <td>${m.getMtitle() }</td> 
            <td>${m.getMsname() }</td>
           </tr>
       </c:forEach>
     </table>
     
     
  </div>
  </c:otherwise>
</c:choose>

</div>

<div>
<a href="javascript:history.go(-1);" class="userinfo button">이전</a>
</div>





