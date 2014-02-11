<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

  





<form action="pay.user" method="post">
<h2>결제 </h2><br>
<br>
	   <c:forEach var="pid" items="${payinfoDto }">
	     <div class="profilePOK_1 blockPOK_1">
		      <div>
	             <input type="radio" name="paysubcode" value="${pid.paysubcode }" class="block_radio">
	             <b>${pid.paysubcode }) ${pid.payname }</b>
	          </div>
		      <br>
		             선택한 이용권 > ${pid.paypdate } 이용권<br>
	            -MP3 다운로드 (DRM Free) / 평생 소장 (기간 제한 없음)<br>   
	            -무제한 음악 감상<br>
	            -본 상품은 결제한 날로 부터 ${pid.paypdate }일 동안 제공되며, 유효기간이 지난 후 부터는 사용하실 수 없습니다.<br>    
	            -결제 이후 유효기간이 끝나기 전까지는 다른 상품을 구매하실 수 없습니다. <br>
	          <br>
	                  총 결제 금액 : ${pid.payprice }
         </div>
	   </c:forEach>
  
    <input type="submit" class="payOK_1 button" value="결제 OK">
</form>
