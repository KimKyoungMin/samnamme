<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
			<h2> 콘서트 디테일</h2>
			${concertDetail.getContitle() }


<form action="" method="post" enctype="multipart/form-data">
   <table>
      <tr>
         <td>노래제목</td>
         <td><input type="text" name="mtitle" id="mtitle"></td>
      </tr>
      <tr>
         <td>가수</td>
         <td><input type="text" name="msname"></td>
      </tr>
      <tr>
         <td>장르</td>
         <td><input type="text" name="mgrade"></td>
      </tr>
      <tr>
         <td>Etc</td>
         <td><input type="text" name="metcinfo"></td>
      </tr>
      <tr>
         <td>url경로</td>
         <td><input type="text" name="murl"></td>
      </tr>
      <tr>
         <td>Img</td>
         <td><input type="file" name="files[0]"></td>
      </tr>
      <tr>
         <td>MusicFile</td>
         <td><input type="file" name="files[1]"></td>
      </tr>
      <tr>
         <td colspan="2" align="center">
             <input type="hidden" name="aid" value="ADMIN">
             <input type="submit" value="OK">  
         </td>
      </tr>
   
   </table>



</form>		
			<!-- 창 닫으면서 부모창 리플래시 -->
			<p><A HREF='#' onclick="javascript:self.close();parent.opener.location.reload();">창 닫고 호출창 리플래시 하기</A></p> 
</body>
</html>