<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<h2>결제 내역</h2>
<br>
<c:choose>
  <c:when test="${pt.size()==0 }">
      <h3>결제 내역이 없습니다.</h3> 
  </c:when>
  <c:otherwise>
     <div class="paymenttable">
       <table align="center">
         <tr>
		    <th>결제 상품</th>
		    <th>가격</th>
		    <th>결제일</th>
		    <th>유효 기간</th>
		    <th>유효 만료일</th>
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
<a href="javascript:history.go(-1);" class="payOK_1 button">이전</a>

