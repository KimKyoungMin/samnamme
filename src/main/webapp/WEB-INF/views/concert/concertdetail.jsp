<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	try {
		document.execCommand('BackgroundImageCache', false, true);
	} catch (e) {
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<title>Insert title here</title>
</head>
<body>
<s:authorize ifAnyGranted="ROLE_ADMIN">
			    <a href="concertdelete.admin?connum=${concertDetail.getConnum()}">게시물 삭제</a>
	      </s:authorize>
		<tr>
			<td colspan="2" align="center"
				style="color: 4A3D3D; font-size: 18pt;"><br> 
				${concertDetail.getContitle()} <br>
			<br>
		</tr>
		<tr>
			<td><img alt="" src="concertpic/${concertDetail.getConpic()}"
				width="220" height="210"></td>
			<td style="color: 4A3D3D">공연명 : ${concertDetail.getContitle()}<br>
			<br> 공연날자 : ${concertDetail.getCondate()}<br>
			<br> 공연시간 :${concertDetail.getStarttime()} ~${concertDetail.getEndtime() }<br>
			<br> 공연장소 : ${concertDetail.getConplace() }<br>
			<br>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center"
				style="color: 4A3D3D; font-size: 15pt;">${concertDetail.getConectinfo()}</td>
		</tr>
		<tr>
			<td colspan="2" align="left" style="color: 4A3D3D; font-size: 18pt;">-
				약 도</td>

		</tr>
		
		

	
</body>
</html>