<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<div class="ausers">
  <h2>회원 List</h2>
  <table border="1">
    <thead>
       <tr>
          <th>회원Id</th>
          <th>회원이름</th>
          <th>전화번호</th>
          <th>이메일</th>
          <th>컨텐츠사용유효기간</th>
       </tr>
    </thead>
    <tbody>
       <c:forEach var="u" items="${userList}">
	       <tr>
			    <td class="userid">${u.getUserid() }</td>
			    <td class="uname">${u.getUname() }</td>  
			    <td class="utel">${u.getUtel() }</td>
			    <td class="uemail">${u.getUemail() }</td>
			    <td class="uexpdate">${u.getUexpdate() }</td>       
	       </tr>
       </c:forEach>
    </tbody>
  </table>
  

</div>
