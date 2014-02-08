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

<h2>qna Write</h2>

<!-- <div class="profileN blockN" align="center"> -->
  
  <form action="qnaDelete.user?qnum=${qnaDetail.qnum}" method="post">
  <div id="notice-article-detail" class="article-detail margin-large" >						
						<dl class="article-detail-row">
							<dt class="article-detail-title">
								제목
							</dt>
							<dd class="article-detail-data">
								${qnaDetail.qtitle}
							</dd>
						</dl>	
						<dl class="article-detail-row half-row">
							<dt class="article-detail-title">
								작성자
							</dt>
							<dd class="article-detail-data half-data" >
							   ${qnaDetail.userid}
							</dd>
						</dl>
						<dl class="article-detail-row half-row">
							<dt class="article-detail-title">
								조회수
							</dt>
							<dd class="article-detail-data half-data">
							${qnaDetail.qcount }
							</dd>
						</dl>
						
						
						<div class="article-content" >
							<textarea id="txtContent" class="txtContent" name="content" readonly="readonly" >${qnaDetail.qcontent}
							</textarea>
						</div>
					</div>
					<a href ="qnaReply.user?qnum=${qnaDetail.qnum}">댓글쓰기</a><br>
					<div align="center">
						<input type="button" value="이전" onclick="javascript:history.go(-1);" style="background-color: E1EDB9; width: 50px; height: 25px;">
						<input type="button" value="수정" style="background-color: E1EDB9; width: 50px; height: 25px;">
						<input type="submit" value="삭제" style="background-color: E1EDB9; width: 50px; height: 25px;">
					</div>
					</form>
				<%-- ?qnum=${qnaDetail.qnum} --%>

</body>
</html>