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

<h2>댓글 Write</h2>

<form action="qnaReply.user" method="post">
<div id="notice-article-detail" class="article-detail margin-large" >						
						<dl class="article-detail-row">
							<dt class="article-detail-title">
								제목
							</dt>
							<dd class="article-detail-data">
								 <input type="text" size="10" name="qtitle" id="qtitle" value="[re]:${qnaReply.qtitle}" required>
							</dd>
						</dl>	
						<dl class="article-detail-row half-row">
							<dt class="article-detail-title">
								작성자
							</dt>
							<dd class="article-detail-data half-data" >
							   ${qnaReply.userid}
							</dd>
						</dl>
						<dl class="article-detail-row half-row">
							<dt class="article-detail-title">
								조회수
							</dt>
							<dd class="article-detail-data half-data">
							${qnaReply.qcount }
							</dd>
						</dl>
						<div class="article-content" >
							<textarea id="txtContent" class="txtContent" name="qcontent" >[re]:${qnaReply.qcontent}</textarea>
						</div>
					</div>
					
					<br>
					<input type="hidden" name="qrenum" value="${qnaReply.qrenum }">
					<input type="hidden" name="qstep" value="${qnaReply.qstep }">
					<input type="hidden" name="qdepth" value="${qnaReply.qdepth }">
						<div align="center">
							<input type="submit" value="등록" style="background-color: E1EDB9; width: 50px; height: 25px;">
							<input type="reset" value="취소" onclick="javascript:history.go(-1);" style="background-color: E1EDB9; width: 50px; height: 25px;">
						</div>
		</form>


</body>
</html>