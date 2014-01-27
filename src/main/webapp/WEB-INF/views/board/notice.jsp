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
								<tr>
									<td class="seq">1</td>
									<td class="title"><a href="noticedetail.user">제목</a></td>
									<td class="writer">글쓴이</td>
									<td class="regdate">날짜</td>
									<td class="hit">조회수</td>
								</tr>
								
								<tr>
									<td class="seq">2</td>
									<td class="title"><a href="#">송지혜짱</a></td>
									<td class="writer">송지혜</td>
									<td class="regdate">2013-05-05</td>
									<td class="hit">9999</td>
								</tr>
						
						</tbody>
						</table>
    				
<!-- </div> -->