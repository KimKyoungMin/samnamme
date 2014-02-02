<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>

<!-- Ajax 추가 소스 아직 안되는 상태 시작-->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<h2>공지사항</h2>
<script type="text/javascript">

$("#btnMore").click(function(){  
	
    var url="noticemore.user";  
    var params="lastnum="+'<c:out value="${lastNumber.getLastnum() }"/>';  
  
    $.ajax({      
        type:"GET",  
        url:url,      
        data:params,      
        success:function(args){   
            $("#result").html(args);
        },   
        beforeSend:showRequest,  
        error:function(e){  
            alert(e.responseText);  
        }  
    });  
      
});
</script>
<!-- Ajax 추가 소스 아직 안되는 상태 끝-->
<div align="right">
<s:authorize ifAnyGranted="ROLE_ADMIN">
			    <a href="noticewrite.user">공지사항 등록</a>
	      </s:authorize>
	
</div>
<!-- noticeBoardList -->
<c:forEach var="f" items="${noticeBoardList}">
<div class="blockL">
	<div class="blockM">
		<ul>
			<li>${f.getUserid()}: ${f.getBtitle() }<br>
				<div style="text-align: left">${f.getBdate() }</div>
			</li>
			<div class="notice">
				${f.getBcontent() }<br>
				<s:authorize ifAnyGranted="ROLE_ADMIN">
			    <a href="noticeupdate.user?bnum=${f.getBnum() }">글 수정하기</a> ||
				<a href="noticedelete.user?bnum=${f.getBnum() }">글 삭제하기</a>
	      </s:authorize>
				
				 <img
					src="CSS/noticeboardpic/${f.getBpicname()}" width="500px"
					height="300px">
			</div>
		</ul>
	</div>
	<!-- noticeBoardReplyList -->
	<div class="blockN">
	<c:forEach var="c" items="${noticeBoardReplyList}">
		<c:if test="${f.getBnum() == c.getBnum()}">
			${c.getUsername() } : ${c.getCcontent() } <div style="text-align: left">${c.getCdate() }</div><br>
			</c:if>
	</c:forEach>
	</div>
	</div>
</c:forEach>
<div class="blockM">
<form method="get" action="">
<input type="hidden" name="lastnum" value="${lastNumber.getLastnum() }">
<input type="submit" name="" value="공지사항 더 확인하기">
<!-- <input type="submit" name="" value="공지사항 더 확인하기" onclick="btnMore"> -->
</form>
</div>
