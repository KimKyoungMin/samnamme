<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>

<script type="text/javascript">
  function qnaEdit(qnum){
	  document.location.href="qnaEdit.user?qnum="+qnum;
  }

</script>

<h2>qna Write</h2>
  
  <form action="qnaDelete.user?qnum=${qnaDetail.qnum}" method="post" name="qnafm">
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
						<input type="button" value="목록" onclick="javascript:location.href='qna.user';" style="background-color: E1EDB9; width: 50px; height: 25px;">
                        <s:authentication property="name" var="loginUser"/>
                        <c:if test="${qnaDetail.userid==loginUser }">
                           <input type="button" value="수정" onclick="javascript:qnaEdit(${qnaDetail.qnum})" style="background-color: E1EDB9; width: 50px; height: 25px;">
						   <input type="submit" value="삭제" style="background-color: E1EDB9; width: 50px; height: 25px;">
                        </c:if>

					</div>
					</form>

