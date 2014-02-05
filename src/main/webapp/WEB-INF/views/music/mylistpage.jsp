<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>

<script type="text/javascript"> 
	//mylist ���� �������� 
	function doopen(mfilename){
		//alert(mfilename);
		opener.document.getElementById("mfilename").value=mfilename;
		opener.document.getElementById("au").src = "upload/" + mfilename;
		self.close();
	}
</script>

<s:authentication property="name" var="loginUser"/>

<h2> ${loginUser }���� My Player List</h2>
<br>
<c:choose>
   <c:when test="${mylists.size()==0}">
        <h2>�뷡 ����Ʈ�� �����ϴ�.</h2>
   </c:when>
   <c:otherwise>
	   <div class="popup" name="popup">
		 <ul>
			<c:forEach var="m" items="${mylists}">
				<li><a href="javascript:doopen('${m.getMfilename()}');">${m.getMtitle()}/${m.getMsname()}</a>
			    <hr></li>
			</c:forEach>
		 </ul>
	   </div>
	</c:otherwise>
</c:choose>
  




