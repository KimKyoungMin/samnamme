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
			var __bnumm = "bnumm"+__num;
			var __bnummm = "bnummm"+__num;
			//각 ID가 가진 value 값을 가져옴
			var _bnum = document.getElementById(__bnum).value;
			var _userid = document.getElementById(__userid).value;
			var _ccontent = document.getElementById(__ccontent).value;
			var _replycountin =  document.getElementById(__bnumm).value;
			var _replycountnum =  document.getElementById(__bnummm).value;
			/* alert("here you ok"); */
			replyadd(_bnum, _userid, _ccontent, __num,_replycountin, _replycountnum);
			$(':text').val('');
		});
	});
	
	//Ajax 댓글 추가하기
	function replyadd(bnum, userid, ccontent, barnum, replycountin, replycountnum){
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
				replygetList(bnum, barnum, replycountin, replycountnum);
			},
			error : function(data) {
				alert("Error 발생");
			}
		});
	};
	
	//Ajax 리스트 가져오기 (댓글 숫자가 늘어나지 않음)
	function replygetList(boardNo, barnum, replycountin, replycountnum){
		/* alert("here replygetList2 ok");
		alert(boardNo, barnum, replycount); */
		var loginUser = '<c:out value="${loginUser}"/>';
		var replycount = parseInt(replycountin);
		/* alert(replycount); */
		$.ajax({
			type : "post",
			url : "noticereplygetList.user",
			data : ({
				bnum : boardNo,
				replycount : replycount
			}), //data를 갖고
			dataType : "json",
			success : function(data2) {
				htmlSrc = "";
				/* alert(replycountnum);
				alert(replycountin); */
				
				var newreplycount = data2[0].newreplyCount;
				$('#replycount'+barnum).html('현재 댓글수'+newreplycount);
				for (var i = 1; i < data2.length; i++) {
					//댓글 출력 부분
					htmlSrc += data2[i].username+ ':'+ data2[i].ccontent;
					htmlSrc += '<div class="main-container" style="text-align: left">'+ data2[i].cdate+ '';
					//조건에 따라 삭제 버튼키 추가
					 if(loginUser == data2[i].userid){
						 htmlSrc += "<a href='javascript:void()' onclick='replyDelete("+data2[i].cnum+","+ data2[i].bnum+","+barnum+","+replycountin+","+replycountnum+")'>&nbsp;삭제2</a></div><br>";
					}else{
						htmlSrc+='</div><br>';
					} 
				}
				/* alert("^^"); */
				
				$('#simson'+ barnum).html(htmlSrc);
				//버튼 입력 내용중 하나 리플리 값 갱신용
				$('#bnumm'+ barnum).val(replycountin);
				/* alert("OK"); */
				//alert(replycountnum); //총 보유 댓글수
				//alert(replycount); //현재 보여지는 댓글수
				
				//댓글 더 보기 메뉴에 대한 정보를 확인
				htmlSrc2="";
				alert("리플 갯수"+replycountnum+"새로 받아온 리플 갯수"+newreplycount+"뭔가 비교하는 변수명"+replycount);
				if(newreplycount > replycount){
					htmlSrc2+="<a href='javascript:void()' onclick='replygetList2("+ boardNo+","+barnum+","+replycount+","+data2.length+")'>댓글 더 보기</a>";
					/* <a href="javascript:void()" onclick="replygetList2('${f.getBnum()}','${varnum }',7)" >댓글 더 보기</a>*/ 
					/* htmlSrc += "<a href='javascript:void()' onclick='replyDelete("+data2[i].cnum+","+ data2[i].bnum+","+barnum+")'>&nbsp;삭제</a></div><br>"; */
				}else{
					htmlSrc2='';
				}
				/* alert(htmlSrc2); */
				$('#replynum'+barnum).html(htmlSrc2);
				
			},
			error : function(data) {alert("Error 발생");}
		});
	};
	
	//Ajax 리스트 가져오기2  원글번호, 화면 태그가 가진 번호, 현재 리플 달아준 카운트 수, 현재 글 전체 리플 카운트 수 
	function replygetList2(boardNo, barnum, replycountin, replycountnum){
		/* alert("here replygetList2 ok");
		alert(boardNo, barnum, replycount); */
		var loginUser = '<c:out value="${loginUser}"/>';
		var replycount = parseInt(replycountin)+7;
		/* alert(replycount); */
		$.ajax({
			type : "post",
			url : "noticereplygetList.user",
			data : ({
				bnum : boardNo,
				replycount : replycount
			}), //data를 갖고
			dataType : "json",	
			success : function(data2) {
				var newreplycount = data2[0].newreplyCount;
				$('#replycount'+barnum).html('현재 댓글수'+newreplycount);
				htmlSrc = "";
				for (var i = 1; i < data2.length; i++) {
					//댓글 출력 부분
					htmlSrc += data2[i].username+ ':'+ data2[i].ccontent;
					htmlSrc += '<div class="main-container" style="text-align: left">'+ data2[i].cdate+ '';
					//조건에 따라 삭제 버튼키 추가
					 if(loginUser == data2[i].userid){
						 htmlSrc += "<a href='javascript:void()' onclick='replyDelete("+data2[i].cnum+","+ data2[i].bnum+","+barnum+","+replycount+","+replycountnum+")'>&nbsp;삭제3</a></div><br>";
					}else{
						htmlSrc+='</div><br>';
					} 
				}
			/* 	alert("^^"); */
				$('#simson'+ barnum).html(htmlSrc);
				//버튼 입력 내용중 하나 리플리 값 갱신용
				$('#bnumm'+ barnum).val(replycount);
				//alert(replycountnum); //총 보유 댓글수
				//alert(replycount); //현재 보여지는 댓글수
				/* alert("OK"); */
				htmlSrc2="";
				alert(replycountnum, newreplycount, replycount);
				if(newreplycount > replycount){
					htmlSrc2+="<a href='javascript:void()' onclick='replygetList2("+ boardNo+","+barnum+","+replycount+","+data2.length+")'>댓글 더 보기</a>";
					/* <a href="javascript:void()" onclick="replygetList2('${f.getBnum()}','${varnum }',7)" >댓글 더 보기</a>*/ 
					/* htmlSrc += "<a href='javascript:void()' onclick='replyDelete("+data2[i].cnum+","+ data2[i].bnum+","+barnum+")'>&nbsp;삭제</a></div><br>"; */
				}else{
					htmlSrc2='';
				}
				/* alert(htmlSrc2); */
				$('#replynum'+barnum).html(htmlSrc2);
				
			},
			error : function(data) {alert("Error 발생");}
		});
	};
	
	// Ajax 댓글 삭제시
	function replyDelete(replyNo, boardNo, barnum, replycountin, replycountnum){
		/* var loginUser = '<c:out value="${loginUser}"/>'; */
		$.ajax({
			type : "post",
			url : "noticereplydelete.user",
			data : ({
				cnum : replyNo,
			}), //data를 갖고
			dataType : "json",
			success : function(data) {
				replygetList(boardNo, barnum, replycountin, replycountnum);
			},
			error : function(data) {alert("Error 발생");}
		});
	};
	
	//Ajax 댓글 더 보여주기
	/* function replyMoreView(boradNo, barnum, replycount){
		alert("replyMoreView call ok");
		replygetList2(boardNo,barnum,replycount);
		alert("replyMoreView end ok");
	}; */
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
				<h5 id ="replycount${varnum }" class="buttonmore">현재 댓글수 ${f.getReplycount() }</h5>
				
			</ul>
			<div class="blockN">
		
		<input type="hidden" id="userid${varnum }" name="userid" value="${loginUser}"> 
		<input type="hidden" id="bnum${varnum }" name="bnum" value="${f.getBnum() }">
		<input type="hidden" id="bnumm${varnum }" name="bnumm" value="7">
		<input type="hidden" id="bnummm${varnum }" name="bnummm" value="${f.getReplycount()}">
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
									<a href="javascript:void()" onclick="replyDelete('${c.getCnum()}', '${c.getBnum() }','${varnum }','7','${f.getReplycount()}')">&nbsp;삭제</a>
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
		<div id="replynum${varnum }">
			<c:if test="${f.getReplycount()>7 }">
				<a href="javascript:void()" onclick="replygetList2('${f.getBnum()}','${varnum }','7', '${f.getReplycount()}')" >댓글 더 보기</a>
			</c:if>
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
