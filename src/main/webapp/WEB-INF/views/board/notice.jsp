<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 


<h2> Notice board </h2>
<div align="right">
<a href="noticewrite.user">글쓰기</a>
</div>

<!-- <div class="profileN blockN" align="center"> -->
   
    <!--   <table border="1" style="width:200px; padding:5px;">
          <tr>
             <td>No1</td>
             <td>김정훈</td>     
             <td>2014-01-01</td>     
          </tr>
          
          <tr>
             <td>1</td>
             <td>1</td>
             <td>1</td>
          </tr>
          <tr>
             <td colspan="3">내용</td>
          <tr>
             <td align="left"><img src="" width="300px" height="300px"></td>
             <td colspan="2">2</td>
          </tr>
          
          <tr>
             <td>3</td>
             <td>3</td>
             <td><input type="text" name="re"></td>
          </tr>  
             
      </table> -->
      			<table class="article-list margin-small">
      					<thead>
							<tr>
								<th class="seq">번호</th>
								<th class="title">제목</th>
								<th class="writer">작성자</th>
								<th class="regdate">작성일</th>
								<th class="hit">조회수</th>
							</tr>
						</thead>
						</table>
						
						<table class="article-list margin-small">
						<tbody>
							<!-- 	<tr>
									<td class="seq">1</td>
									<td class="title"><a href="noticedetail.user">제목</a></td>
									<td class="writer">글쓴이</td>
									<td class="regdate">날짜</td>
									<td class="hit">조회수</td>
								</tr> -->
								
						<c:forEach items="${list}"  var="n">
								<tr>
									<td class="seq">${n.seq}</td>
									<td class="title"><a href="noticeDetail.htm?seq=${n.seq}">${n.title}</a></td>
									<td class="writer">${n.writer}</td>
									<td class="regdate">${n.regdate}</td>
									<td class="hit">${n.hit}</td>
								</tr>
							</c:forEach>
						
						</tbody>
						</table>
    				
<!-- </div> -->