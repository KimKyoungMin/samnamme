<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>

<script type="text/javascript">
	//mylist ø°º≠ ¿Ωæ«∆ƒ¿œ 
	function doplay(){
		var au = document.getElementById("au");		
		if(au.paused){
			au.play();
		}else{
			alert("ddd");
			au.pause();
		}
		
	}   
	//mylist ø°º≠ ¿Ωæ«∆ƒ¿œ 
	function doopen(mfilename){
		//alert(mfilename);
		opener.document.getElementById("mfilename").value=mfilename;
		opener.document.getElementById("au").src = "upload/" + mfilename;
		self.close();
		doplay();
	}
</script>

<s:authentication property="name" var="loginUser"/>

<h2> ${loginUser }¥‘¿« My Player List</h2>
<br>
<div class="popup" name="popup">
  <ul>
	   <c:forEach var="m" items="${mylists}">
		  <li>
			  <a href="javascript:doopen('${m.getMfilename()}');">${m.getMtitle()}/${m.getMsname()}</a>
			  <!-- onclick="javascript:self.close();parent.opener.location.reload();" -->
			  <hr>
    	  </li>
	   </c:forEach>
  </ul>
</div>

