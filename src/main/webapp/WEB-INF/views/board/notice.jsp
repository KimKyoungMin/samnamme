<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<!-- Ajax 추가 소스 아직 안되는 상태 시작-->
<h2>공지사항</h2>
<s:authentication property="name" var="loginUser"/>

<!-- Ajax 댓글 추가시 진행 건 -->
<script type="text/javascript">
$(document).ready(function(){
$(':button[id*=reply]').click(function(){
	//id 값 끌고 오기
	var _id = $(this).attr('id');
    var __num = $(this).attr('name');
    
    //변수명 설정(ID명칭과 동일하게 설정함)
    var __bnum = "bnum" + __num;
    var __userid = "userid" + __num;
    var __ccontent = "ccontent" + __num;
	
    //각 ID가 가진 value 값을 가져옴
    var _bnum = document.getElementById(__bnum).value;
	var _userid = document.getElementById(__userid).value;
	var _ccontent = document.getElementById(__ccontent).value;
		$.ajax({
			type : "post",
			url : "noticereply.user",
			data : ({bnum:_bnum, userid:_userid, ccontent:_ccontent, replynum:__num}),   //data를 갖고
			dataType : "json",
			/* contentType: "application/x-www-form-urlencoded; charset=UTF-8",  */
			success : function(data) {
				
				$.each(data,function(){
					$('#simson'+data.replynum).append(
							data.username2);
				});
				
					/* $.each(data,function(){
						$('#simson'+data.replynum).html(
								escape(data.username2),"UTF-8");
					}); */
			},
			
			error : function(data) {
				alert("Error 발생");
			}	
		});
	});
});
</script>


<div align="right">
	<s:authorize ifAnyGranted="ROLE_ADMIN">
		<a href="noticewrite.user">공지사항 등록</a>
	</s:authorize>

</div>
<!-- noticeBoardList -->
<c:set var="varnum" value="0"></c:set>

<c:forEach var="f" items="${noticeBoardList}">
<c:set var="varnum" value="${varnum+1 }"></c:set>
<input type="hidden" name="num" id="num" value="${varnum }">
	<div class="blockL">
		<div class="blockM">
			<ul>
				<li>${f.getUserid()}:${f.getBtitle() }<br>
					<div style="text-align: left">${f.getBdate() }</div>
				</li>
				<div class="notice">
					${f.getBcontent() }<br>
					<s:authorize ifAnyGranted="ROLE_ADMIN">
						<a href="noticeupdate.user?bnum=${f.getBnum() }">글 수정하기</a> ||
				<a href="noticedelete.user?bnum=${f.getBnum() }">글 삭제하기</a>
					</s:authorize>
					<c:if test="${f.getBpicname()!=null && f.getBpicname()!='' }">
					<img src="CSS/noticeboardpic/${f.getBpicname()}" width="500px"
						height="300px">
						</c:if>
				</div>
			</ul>
		</div>
		<!-- noticeBoardReplyList -->
		
		<div class="blockN">
		
			<c:forEach var="c" items="${noticeBoardReplyList}">
				<c:if test="${f.getBnum() == c.getBnum()}">
							${c.getUsername() } : ${c.getCcontent() } <div
						style="text-align: left">${c.getCdate() }</div>
					<br>
				</c:if>
			</c:forEach>
			<div id="simson${varnum }"></div>
				<input type="hidden" id="userid${varnum }" name="userid" value="${loginUser}"> 
				<input type="hidden" id="bnum${varnum }" name="bnum" value="${f.getBnum() }">
				<input type="text" id="ccontent${varnum }" name="ccontent" value="" class="element text medium">
				<input type="button" id= "reply${varnum }" name="${varnum }" value="댓글달기" class="element text small">
		</div>
	</div>
</c:forEach>
<div class="blockM">
	<form method="get" action="">
		<input type="hidden" name="lastnum"
			value="${lastNumber.getLastnum() }"> <input type="submit"
			name="" value="공지사항 더 확인하기">
		<!-- <input type="submit" name="" value="공지사항 더 확인하기" onclick="btnMore"> -->
	</form>
</div>
