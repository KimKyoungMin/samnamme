<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<div class="profileA blockA">
<h2 align="center">My Info</h2>
<br>
<form action="account.user" method="post">
YourID <input type="text" name="userid" class="email text2-input" value="${usertDto.userid }" readonly><br>
Name    <input type="text" name="uname" class="email text2-input" value="${usertDto.uname }"><br>
Phone  <input type="text" name="utel" class="email text2-input" value="${usertDto.utel }"><br>
E-mail <input type="text" name="uemail" class="email text2-input" value="${usertDto.uemail }"><br>
Expiry <input type="text" name="uexpdate" class="email text2-input" value="${usertDto.uexpdate }" readonly>
<input type="submit" class="edit button" value="Edit">
</form>
</div>

<div class="profileD blockD">
<h2 align="center">My DownList</h2>
<br>
<c:forEach var="mdlist" items="${md }">
${mdlist.getMinfonum() } / ${mdlist.getMtitle() } / ${mdlist.getMsname() }<hr>
</c:forEach>

</div>

<div class="profileP blockP">
<h2 align="center">Payment</h2>
<br>
<input type="button" class="edit button" value="결제">
<hr>

	<c:forEach var="pay" items="${pt }">
        상품 <input type="text" class="email text3-input" value="${pay.getPayname()}" readonly><br>
        기간 <input type="text" class="email text3-input" value="${pay.getPaydate()}" readonly><br> 
	  가격 <input type="text" class="email text3-input" value="${pay.getPaymoney()}" readonly> 
      <hr>
	</c:forEach>




</div>




