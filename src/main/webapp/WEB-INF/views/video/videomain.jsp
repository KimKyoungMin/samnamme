<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 





<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${playvideo==null }">

<embed src="//www.youtube.com/v/CJ_J7E67Xoc?hl=ko_KR&amp;version=3&amp;rel=0"
 type="application/x-shockwave-flash" width="600" height="400"
  allowscriptaccess="always" allowfullscreen="true"></embed>

</c:if>
${playvideo }




</body>
</html>