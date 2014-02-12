<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<h2>회원 List</h2>
<div class="datagrid">
  <div style="overflow-y:auto;  width:960px; height:380px;border-color: #c8c8c8; border-style:solid">
  <table style=" width: 940px; text-align: left;">
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
			    <td class="userid"><a href="ausersDetail.admin?userid=${u.getUserid() }">${u.getUserid() }</a></td>
			    <td class="uname">${u.getUname() }</td>  
			    <td class="utel">${u.getUtel() }</td>
			    <td class="uemail">${u.getUemail() }</td>
			    <td class="uexpdate">${u.getUexpdate() }</td>       
	       </tr>
       </c:forEach>
    </tbody>
  </table>
  </div> 

</div>
