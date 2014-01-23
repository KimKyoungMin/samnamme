<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<form action="amusicform.htm" method="post">
   <table>
      <tr>
         <td>노래제목</td>
         <td><input type="text" name="mtitle"></td>
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
         <td>url경로</td>
         <td><input type="text" name="murl"></td>
      </tr>
      <tr>
         <td>Img</td>
         <td><input type="file" name="files[0]"></td>
      </tr>
   
   
   </table>










</form>