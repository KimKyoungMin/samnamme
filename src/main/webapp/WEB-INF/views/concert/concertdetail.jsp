<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body >



<form action="" method="post" enctype="multipart/form-data">
  <table style="width:480; height:500">
      <tr>
         <td colspan ="2" align="center" style="color:#fff0f5; font-size:18pt;">
         ${concertDetail.getContitle()}</h1>
        <br><br>
      </tr>
      <tr>
         <td><img alt="" src="concertpic/${concertDetail.getConpic()}"></td>
         <td><input type="text" name="msname"></td>
      </tr>
      <tr>
         <td style="color:#fff0f5; font-size:15pt;">장르</td>
         <td><input type="text" name="mgrade"></td>
      </tr>
      <tr>
         <td style="color:#fff0f5; font-size:15pt;">Etc</td>
         <td><input type="text" name="metcinfo"></td>
      </tr>
      <tr>
         <td style="color:#fff0f5; font-size:15pt;">url경로</td>
         <td><input type="text" name="murl"></td>
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
			<p><A HREF='#' onclick="javascript:self.close();parent.opener.location.reload();">확인</A></p> 
</body>
</html>