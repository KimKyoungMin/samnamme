<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript">
<script type="text/javascript">
window.opener.location.reload();
window.close();

</SCRIPT>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
			<h2> 콘서트 디테일</h2>
			${concertDetail.getContitle() }
			<p><A HREF=>자식창 닫기</A></p> 
</body>
</html>