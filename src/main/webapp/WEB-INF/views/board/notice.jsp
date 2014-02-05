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
//댓글 추가버튼 누를시 행동 사항에 대한 정의 --> 댓글 추가하기 함수 사용함
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
			/* alert("here you ok"); */
			replyadd(_bnum, _userid, _ccontent, __num);
			$(':text').val('');
		});
	});
	
	//Ajax 댓글 추가하기
	function replyadd(bnum, userid, ccontent, barnum){
		/* alert("here replydelete start"); */
		$.ajax({
			type : "post",
			url : "noticereplyadd.user",
			data : ({
				bnum : bnum,
				userid : userid,
				ccontent : ccontent,
			}), //data를 갖고
			dataType : "json",
			success : function(data) {
				/* alert("replyadd OK delete");
				alert(bnum, barnum); */
				replygetList(bnum, barnum);
			},
			error : function(data) {
				alert("Error 발생");
			}
		});
	};
	
	//Ajax 리스트 가져오기 
	function replygetList(boardNo, barnum){
		/* alert("here i ok"); */
		var loginUser = '<c:out value="${loginUser}"/>';
		$.ajax({
			type : "post",
			url : "noticereplygetList.user",
			data : ({
				bnum : boardNo
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
	
	// Ajax 댓글 삭제시
	function replyDelete(replyNo, boardNo, barnum){
		/* var loginUser = '<c:out value="${loginUser}"/>'; */
		$.ajax({
			type : "post",
			url : "noticereplydelete.user",
			data : ({
				cnum : replyNo,
			}), //data를 갖고
			dataType : "json",
			success : function(data) {
				replygetList(boardNo, barnum);
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
				<li><a name="title${varnum }">${f.getUserid()}:${f.getBtitle() }</a><br>
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
				<h5 id ="replycount" class="buttonmore">현재 댓글수 ${f.getReplycount() }</h5>
				
			</ul>
			<div class="blockN">
		
		<input type="hidden" id="userid${varnum }" name="userid" value="${loginUser}"> 
		<input type="hidden" id="bnum${varnum }" name="bnum" value="${f.getBnum() }">
		<input type="text" id="ccontent${varnum }" name="ccontent" value="" class="element text medium">
		<input type="button" id= "reply${varnum }" name="${varnum }" value="댓글달기" class="element text small"><P></P><BR>
		<div id="simson${varnum }" >
		<!-- 댓글 작성 시작 -->
		<!-- 댓글 아이디 부여 -->
			<c:set var="replynum" value="0"></c:set>
			<!-- 댓글 작성중 7개가되면 끊기위한 임의의 통제 변수 부여 -->
			<c:set var="doneLoop" value="false"/> 
			<c:set var="statetrue" value="0"/>
			<!-- 댓글 for문 시작 -->
			<c:forEach var="c" items="${noticeBoardReplyList}">
			<!-- 댓글 아이디 증가 -->
			<c:set var="replynum" value="${replynum+1 }"></c:set>
				<c:if test="${not doneLoop}"> 
				<c:if test="${f.getBnum() == c.getBnum()}">
							${c.getUsername() } : ${c.getCcontent() }
						<div style="text-align: left">${c.getCdate() }
						<!-- 스테이트 추가 -->
						<c:set var="statetrue" value="${statetrue+1 }"></c:set>
							<!-- 본인이 적은글 삭제 할수 있게 해주는 기능 추가 -->
							<c:choose>
								<c:when test="${loginUser eq c.getUserid() }">
									<a href="javascript:void()" onclick="replyDelete('${c.getCnum()}', '${c.getBnum() }','${varnum }')">&nbsp;삭제</a>
								</c:when>
							</c:choose>
							</div>
						<br>
				</c:if>
				<c:if test="${statetrue == 7}"> 
					<c:set var="doneLoop" value="true"/> 
					<c:set var="statetrue" value="0"/>
				</c:if>
				</c:if>
			</c:forEach>
			</div>
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
