<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<h2>결제 내역</h2>
<br>
<c:choose>
  <c:when test="${pt.size()==0 }">
      <h2>결제 내역이 없습니다.</h2> 
  </c:when>
  <c:otherwise>
     <div class="paymenttable">
       <table align="center">
         <tr>
		    <th>결제 상품</th>
		    <th>가격</th>
		    <th>결제일</th>
		    <th>유효 기간</th>
        </tr>
		<c:forEach var="pay" items="${pt }">
		   <tr>
			 <td><input type="text" class="text3_1-input" value="${pay.getPayname()}" readonly><br></td>
			 <td><input type="text" class="text3_1-input" value="${pay.getPaymoney()}" readonly></td> 
			 <td><input type="text" class="text3_2-input" value="${pay.getPaydate()}" readonly><br></td> 
			 <td><input type="text" class="text3-input" value="${pay.getPaydate()}" readonly></td>  
			 <td>-<input type="text" class="text3-input" value="${pay.getExpdate()}" readonly></td>
		    </tr>
		</c:forEach>
      </table>
     </div>

  </c:otherwise>
</c:choose>

<form action="pay.user" method="get">
  <input type="submit" class="payOK_1 button" value="결제">
</form>

