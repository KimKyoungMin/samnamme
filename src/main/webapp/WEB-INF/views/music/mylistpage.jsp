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
	
	//checkbox ��ü ���� & ����
	var check = false;
	function CheckAll() {
		var chk = document.getElementsByName("check[]");
		if (check == false) {
			check = true;
			for (var i = 0; i < chk.length; i++) {
				chk[i].checked = true; //��� üũ
			}
		} else {
			check = false;
			for (var i = 0; i < chk.length; i++) {
				chk[i].checked = false; //��� ����
			}
		}
	}
</script>

<s:authentication property="name" var="loginUser"/>

<h2> ${loginUser }���� My Player List</h2>
<br>

<c:choose>
   <c:when test="${mylists.size()==0}">
        <h3>���� ����Ʈ�� �����ϴ�.</h3>
   </c:when>
   <c:otherwise>
       <form action="musiclistDel.htm" method="get">
       <input type="checkbox" name="checkall" onclick="javascript:CheckAll()"><input type="submit" class="delete button2" value="����">
       <br>
       
	   <div class="popup" name="popup">
		 <ul>
			<c:forEach var="m" items="${mylists}">
				<li>
				   <input type="checkbox" id="check[]" name="check[]" value=${m.getMinfonum() }>
				   <a href="javascript:doopen('${m.getMfilename()}');">${m.getMtitle()}/${m.getMsname()}</a>
				   <hr>
				</li>
			</c:forEach>
		 </ul>
	   </div>
	   </form>
	</c:otherwise>
</c:choose>
  




