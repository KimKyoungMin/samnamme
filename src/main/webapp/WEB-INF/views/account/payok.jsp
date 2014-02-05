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
    
	<div class="profilePOK_1 blockPOK_1">
       <div>
          1) 30일 이용권
       </div>
       <br>
       <p>
               본 상품은 30일동안   무제한으로 음악 다운로드와 MyPlayerList를  제공 합니다. 
       </p>
    </div>
	<div class="profilePOK_1 blockPOK_1">
	   <div>
          2) 60일 이용권
       </div>
       <br>
       <p>
               본 상품은 60일동안   무제한으로 음악 다운로드와 MyPlayerList를  제공 합니다. 
       </p>
	</div>
	<div class="profilePOK_1 blockPOK_1">
	   <div>
          3) 90일 이용권
       </div>
       <br>
       <p>
               본 상품은 90일동안   무제한으로 음악 다운로드와 MyPlayerList를  제공 합니다. 
       </p>
	</div>
	
    <input type="submit" class="payOK button" value="결제 OK">
</form>

</div>

