<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<!-- Ajax 추가 소스 아직 안되는 상태 시작-->
<H1>공지사항</h1>
<s:authentication property="name" var="loginUser"/>

<!-- Ajax 함수 모음 -->
<script type="text/javascript">
	$(document).ready(function() {
		//현재 로그인 중인 아이디 가져오기 전역 변수로 지정함
		var loginUser = '<c:out value="${loginUser}"/>';
		
		// Ajax 댓글 추가시 진행
		$(':button[id*=reply]').click(function() {
			//id 값 끌고 오기위한 번호 체크 올때마다 틀림
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
				data : ({
					bnum : _bnum,
					userid : _userid,
					ccontent : _ccontent,
					replynum : __num
				}), //data를 갖고
				dataType : "json",
				success : function(data) {
					htmlSrc = "";
					for (var i = 0; i < data.length; i++) {
						htmlSrc += data[i].username+ ":"+ data[i].ccontent;
						htmlSrc += "<div style='text-align: left'>"+ data[i].cdate+ "";
						 if(loginUser == data[i].userid){
							 htmlSrc += "<a href='javascript:void()' onclick='replyDelete("+data[i].cnum+","+ data[i].bnum+","+__num+")'>&nbsp;삭제</a></div><br>";
						}else{
							htmlSrc+='</div><br>';
						} 
					}
					$('#simson'+ __num).html(htmlSrc);
					$(':text').val('');
				},
				error : function(data) {
					alert("Error 발생");
				}
			});
		});
	});
	
	// Ajax 댓글 삭제시 진행 -->
	function replyDelete(replyNo, boardNo, barnum){
		var loginUser = '<c:out value="${loginUser}"/>';
		$.ajax({
			type : "post",
			url : "noticereplydelete.user",
			data : ({
				cnum : replyNo,
				bnum : boardNo,
			}), //data를 갖고
			dataType : "json",
			success : function(data2) {
				htmlSrc = "";
				for (var i = 0; i < data2.length; i++) {
					//댓글 출력 부분
					htmlSrc += data2[i].username+ ':'+ data2[i].ccontent;
					htmlSrc += '<div style="text-align: left">'+ data2[i].cdate+ '';
					//조건에 따라 삭제 버튼키 추가
					 if(loginUser == data2[i].userid){
						 htmlSrc += "<a href='javascript:void()' onclick='replyDelete("+data2[i].cnum+","+ data2[i].bnum+","+barnum+")'>&nbsp;삭제</a></div><br>";
					}else{
						htmlSrc+='</div><br>';
					} 
				}
				$('#simson'+ barnum).html(htmlSrc);
			},
			error : function(data) {alert("Error 발생");}
		});
	};
</script>

<div align="right">
	<s:authorize ifAnyGranted="ROLE_ADMIN">
		<a href="noticewrite.user" class="dynamiclabel">공지사항 등록</a>
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
					${f.getBcontent() }
					<c:if test="${f.getBpicname()!=null && f.getBpicname()!='' }">
					<div class="boardimagebox">
					<img src="CSS/noticeboardpic/${f.getBpicname()}"  class="boardimagereal"><br>
					
					</div>
					
					</c:if>
					
				</div>
				<div class="morebutton">
					<s:authorize ifAnyGranted="ROLE_ADMIN">
						<a href="noticeupdate.user?bnum=${f.getBnum() }" class="dynamiclabel">공지사항수정</a>
						<a href="noticedelete.user?bnum=${f.getBnum() }" class="dynamiclabel">공지사항삭제</a>
					</s:authorize>
					</div>
				<h5 class="buttonmore">현재 댓글수 3</h5>
			</ul>
			<div class="blockN">
		
		<div id="simson${varnum }" >
		<c:set var="replynum" value="0"></c:set>
			<c:forEach var="c" items="${noticeBoardReplyList}">
			<c:set var="replynum" value="${replynum+1 }"></c:set>
				<c:if test="${f.getBnum() == c.getBnum()}">
							${c.getUsername() } : ${c.getCcontent() }
						<div style="text-align: left">${c.getCdate() }
							<!-- 본인이 적은글 삭제 할수 있게 해주는 기능 추가 -->
							<c:choose>
								<c:when test="${loginUser eq c.getUserid() }">
									<a href="javascript:void()" onclick="replyDelete('${c.getCnum()}', '${c.getBnum() }','${varnum }')">&nbsp;삭제</a>
								</c:when>
							</c:choose>
							</div>
						<br>
				</c:if>
			</c:forEach>
			</div>
			<input type="hidden" id="userid${varnum }" name="userid" value="${loginUser}"> 
			<input type="hidden" id="bnum${varnum }" name="bnum" value="${f.getBnum() }">
			<input type="text" id="ccontent${varnum }" name="ccontent" value="" class="element text medium">
			<input type="button" id= "reply${varnum }" name="${varnum }" value="댓글달기" class="element text small">
		</div>
		</div>
		<!-- noticeBoardReplyList -->
		
		
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
