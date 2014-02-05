<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<div class="profilePOK blockPOK">
<form action="pay.user" method="post">
<h2>결제 </h2><br>
<br>
    <div class="profile_radio">
       <input type="radio" name="paysubcode" value="1" class="block_radio">
       <input type="radio" name="paysubcode" value="2" class="block_radio">
	   <input type="radio" name="paysubcode" value="3" class="block_radio">
    
    </div>
    
	   <c:forEach var="pid" items="${payinfoDto }">
	     <div class="profilePOK_1 blockPOK_1">
		      <div>
	             ${pid.paysubcode }) ${pid.payname }
	          </div>
		      <br>
		      <p>
	                  본 상품은 ${pid.paypdate }일동안   무제한으로 음악 다운로드와 MyPlayerList를  제공 합니다. 
	          <br>
	                  가격 : ${pid.payprice }
	          </p>
         </div>
	   </c:forEach>
  
    <input type="submit" class="payOK button" value="결제 OK">
</form>

</div>

