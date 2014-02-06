<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>

<H1>공지사항</h1>
<s:authentication property="name" var="loginUser"/>
<!-- Ajax 함수 모음 -->
<script type="text/javascript">
//댓글 추가버튼 누를시 버튼 정보 제어에 대한 정보 겟 처리 --> 댓글 추가하기 함수 사용함
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
			replyadd(_bnum, _userid, _ccontent, __num,_replycountin, _replycountnum);
			$(':text').val('');
		});
	});
	
	//Ajax 리스트 가져오기1 (댓글 숫자가 늘어나지 않음 = 댓글 숫자를 하나 덜가져옴)
	//원글번호, 화면 태그가 가진 번호, 현재 리플 달아준 카운트 수, 현재 글 전체 리플 카운트 수 , 보여주는 댓글 숫자를 늘릴지의 여부
	function replygetList(boardNo, barnum, replycountin, replycountnum, incrasebool){
		var loginUser = '<c:out value="${loginUser}"/>';
		var replycount;
		//보여지는 댓글 숫자를 늘릴지 여부를 결정함
		if(parseInt(incrasebool)==1){
			replycount = parseInt(replycountin)+7;
		}else{
			replycount = parseInt(replycountin);
		}
		
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
				
				var newreplycount = data2[0].newreplyCount;
				$('#replycount'+barnum).html('현재 댓글수'+newreplycount);
				for (var i = 1; i < data2.length; i++) {
					//댓글 출력 부분
					htmlSrc += data2[i].username+ ':'+ data2[i].ccontent;
					htmlSrc += '<div class="main-container" style="text-align: left">'+ data2[i].cdate+ '';
					//조건에 따라 삭제 버튼키 추가
					 if(loginUser == data2[i].userid){
						 htmlSrc += "<a href='javascript:void()' onclick='replyDelete("+data2[i].cnum+","+ data2[i].bnum+","+barnum+","+replycount+","+replycountnum+")'>&nbsp;삭제2</a></div><br>";
						//원글번호, 화면 태그가 가진 번호, 현재 리플 달아준 카운트 수, 현재 글 전체 리플 카운트 수 , 보여주는 댓글 숫자를 늘릴지의 여부
					}else{
						htmlSrc+='</div><br>';
					} 
				}
				
				$('#simson'+ barnum).html(htmlSrc);
				//버튼 입력 내용중 하나 리플리 값 갱신용
				$('#bnumm'+ barnum).val(replycount);
				//댓글 더 보기 메뉴에 대한 정보를 확인
				htmlSrc2="";
				
				if(newreplycount > replycount){
					//댓글수가 증가하는 href문임
					htmlSrc2+="<a href='javascript:void()' onclick='replygetList("+ boardNo+","+barnum+","+replycount+","+data2.length+",1)'>댓글 더 보기</a>";
				}else{
					htmlSrc2='';
				}
				$('#replynum'+barnum).html(htmlSrc2);
			},
			error : function(data) {alert("Error 발생");}
		});
	};
	
	// Ajax 댓글 삭제시
	function replyDelete(replyNo, boardNo, barnum, replycountin, replycountnum){
		$.ajax({
			type : "post",
			url : "noticereplydelete.user",
			data : ({
				cnum : replyNo,
			}), //data를 갖고
			dataType : "json",
			success : function(data) {
				replygetList(boardNo, barnum, replycountin, replycountnum,0);
			},
			error : function(data) {alert("Error 발생");}
		});
	};
	
	//Ajax 댓글 추가하기
	function replyadd(bnum, userid, ccontent, barnum, replycountin, replycountnum){
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
				replygetList(bnum, barnum, replycountin, replycountnum,0);
			},
			error : function(data) {
				alert("Error 발생");
			}
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
				<li><a name="title${varnum }"><b>${f.getUserid()}</b><br>제목 :&nbsp;&nbsp;&nbsp;&nbsp; 	${f.getBtitle() }</a><br>
					
				</li>
				<div class="notice">
					${f.getBcontent() }
					<c:if test="${f.getBpicname()!=null && f.getBpicname()!='' }">
					<div class="boardimagebox">
					<img src="CSS/noticeboardpic/${f.getBpicname()}"  class="boardimagereal"><br>
					</div>
					
					</c:if>
					<div style="text-align: left">${f.getBdate() }</div><br>
				</div>
				
				
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
				<a href="javascript:void()" onclick="replygetList('${f.getBnum()}','${varnum }','7', '${f.getReplycount()}',1)" >댓글 더 보기</a>
			</c:if>
			</div>
		</div>
		<!-- noticeBoardReplyList -->
		
		<div class="morebutton">
					<s:authorize ifAnyGranted="ROLE_ADMIN"><p><br><br></p>
						<a href="noticeupdate.user?bnum=${f.getBnum() }" class="dynamiclabel">공지사항수정</a><br><p><br><br></p>
						<a href="noticedelete.user?bnum=${f.getBnum() }" class="dynamiclabel">공지사항삭제</a><br><p><br><br></p>
					</s:authorize>
					
				<h5 id ="replycount${varnum }" class="buttonmore">현재 댓글수 ${f.getReplycount() }</h5>
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
