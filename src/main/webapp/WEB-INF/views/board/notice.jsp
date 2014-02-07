<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>

<h2>공지사항</h2>
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
	//화면 태그가 가진 번호, 원글번호, 현재 리플 달아준 카운트 수, 현재 글 전체 리플 카운트 수 , 보여주는 댓글 숫자를 늘릴지의 여부
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
				$('#replycount'+barnum).html(newreplycount);
				for (var i = 1; i < data2.length; i++) {
					//댓글 출력 부분
					htmlSrc +="<div id='replyUpdateForm"+barnum+"num"+i+"'>";
					htmlSrc += '<b style="color:#3C467D;">'+data2[i].username+'</b> :'+ data2[i].ccontent;
					 if(loginUser == data2[i].userid){
						htmlSrc +="<a href='javascript:void()' onclick='replyUpdateFormcall("+barnum+","+i+","+data2[i].bnum+","+data2[i].cnum+","+replycount+","+replycountnum+",&apos;"+data2[i].username+"&apos;)'><img alt='글 수정하기' src='CSS/noticeboardpic/Custom-Icon-Design-Mini-2-Marker.ico' style='width:20pt; height:10pt;' ></a>";
						htmlSrc += "<a href='javascript:void()' onclick='replyDelete("+data2[i].cnum+","+ data2[i].bnum+","+barnum+","+replycount+","+replycountnum+")'><img alt='글 삭제하기' src='CSS/noticeboardpic/100-coffee-icon.png' style='width:20pt; height:10pt;' ></a>";
						//원글번호, 화면 태그가 가진 번호, 현재 리플 달아준 카운트 수, 현재 글 전체 리플 카운트 수 , 보여주는 댓글 숫자를 늘릴지의 여부
						 //<a href="javascript:void()" onclick="replyUpdateFormcall(${varnum}, ${replynum }, ${c.getBnum() },${c.getCnum() },'7', '${f.getReplycount()}')">글 수정하기</a> 
						htmlSrc +="</div></div>"; 
					}else{
						htmlSrc+='</div></div>';
					} 
					htmlSrc += '<div class="main-container" style="text-align: left">'+ data2[i].cdate+ '<p><br></p>';
					//조건에 따라 삭제 버튼키 추가
					
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
	
	//댓글 수정 처리
	function replyUpdateLogic(Bnum, varnum, Cnum, replycountin, replycountnum){
		var concent=document.getElementById("modifyreply").value;
		
		 $.ajax({
			type : "post",
			url : "noticereplyupdate.user",
			data : ({
				Cnum : Cnum,
				concent: concent
			}), //data를 갖고
			dataType : "json",
			success : function(data) {
				//alert("updatelogic call ok");
				replygetList(varnum, Bnum, replycountin, replycountnum,0);				
			},
			error : function(data) {
				alert("Error 발생");
			}
		}); 
	};
	//댓글 수정하기 폼 작성
	//글번호(태그상 번호), 댓글번호(태그상 번호), 원글번호(DB상), 댓글번호(DB상), 댓글수, 전체 댓글수, 유저ID
	function replyUpdateFormcall(varnum, replynum , Bnum, Cnum, replycountin, replycountnum, username){
		alert("replyUpdateFormCall" + username);
		$.ajax({
			type : "post",
			url : "noticereplyget.user",
			data : ({
				Cnum : Cnum,
			}), //data를 갖고
			dataType : "json",
			success : function(data) {
				htmlSrc=""+username;
				htmlSrc+="<input type='text'  id='modifyreply' value='"+data.replycontent+"'>";
				// <a href="javascript:void()" onclick="replyUpdateFormcall(${varnum}, ${replynum }, ${c.getCnum() },${c.getCnum() },'7', '${f.getReplycount()}','')">글 수정하기</a> 
				htmlSrc+="<a href='javascript:void()' onclick='replyUpdateLogic("+varnum+","+Bnum+","+Cnum+","+replycountin+","+replycountnum+")'> 확인</a>";
				$('#replyUpdateForm'+varnum+'num'+replynum).html(htmlSrc);
			},
			error : function(data) {
				alert("Error 발생");
			}
		});
		//<input type="button" id= "reply${varnum }" name="${varnum }" value="댓글달기" class="element text small"><P></P><BR>
	};

</script>

<div class="noticeaddbutton">
	<s:authorize ifAnyGranted="ROLE_ADMIN">
		<a href="noticewrite.user" class="dynamiclabel_2">공지사항 등록</a>
	</s:authorize>
</div>
<!-- noticeBoardList -->
<c:set var="varnum" value="0"></c:set>

<c:forEach var="f" items="${noticeBoardList}">
<c:set var="varnum" value="${varnum+1 }"></c:set>
<input type="hidden" name="num" id="num" value="${varnum }">
	<div class="blockL"> <!-- 댓글 수 div -->
		<div class="blockM">  <!-- 작성글 div -->
			<ul>
				<li style="color:4A3D3D;">
				   <b style="color:#3C467D;">${f.getUserid()}</b> &nbsp;&nbsp;&nbsp; <b>${f.getBtitle() }</b><br>
				</li>
				<div class="notice">
					<table style="width: 670px;">
					   <tr>
					     <td>${f.getBcontent() }</td>
					   </tr>
					   <tr>
					     <td>
					       <c:if test="${f.getBpicname()!=null && f.getBpicname()!='' }">
					         <img src="CSS/noticeboardpic/${f.getBpicname()}"  class="boardimagereal"  style="width:670px;height:300;"><br>
					       </c:if>
					     </td>
					   </tr>
					</table>
					
					<div class="noticeDiv" style="text-align: left">${f.getBdate() }</div>
					<div class="noticeDiv">
						<s:authorize ifAnyGranted="ROLE_ADMIN"><p>
							<a href="noticeupdate.user?bnum=${f.getBnum() }" class="dynamiclabel">공지사항수정</a>&nbsp;&nbsp;
							<a href="noticedelete.user?bnum=${f.getBnum() }" class="dynamiclabel_1">공지사항삭제</a><br>
						</s:authorize>
		            </div><br>
					    현재 댓글 수 <span id ="replycount${varnum }" class="round">${f.getReplycount() }</span>
				</div>	
			</ul>
	    </div>
	    <div class="blockN">  <!-- 댓글 div -->		
		<input type="hidden" id="userid${varnum }" name="userid" value="${loginUser}"> 
		<input type="hidden" id="bnum${varnum }" name="bnum" value="${f.getBnum() }">
		<input type="hidden" id="bnumm${varnum }" name="bnumm" value="7">
		<input type="hidden" id="bnummm${varnum }" name="bnummm" value="${f.getReplycount()}">
		<input type="text" id="ccontent${varnum }" name="ccontent" value="" class="element text medium" style="width: 510px;">
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
			<div id="replyUpdateForm${varnum }num${replynum }">
				<c:if test="${not doneLoop}">
				<c:if test="${f.getBnum() == c.getBnum()}">
							<b style="color:#3C467D;">${c.getUsername() }</b>  ${c.getCcontent() }
							<c:choose>
								<c:when test="${loginUser eq c.getUserid() }">
									<a href="javascript:void()" onclick="replyUpdateFormcall(${varnum}, ${replynum }, ${c.getBnum() },${c.getCnum() },7, ${f.getReplycount()}, '${c.getUsername() }')"><img alt="글 수정하기" src="CSS/noticeboardpic/Custom-Icon-Design-Mini-2-Marker.ico" style="width:20pt; height:10pt;" ></a>
									<a href="javascript:void()" onclick="replyDelete('${c.getCnum()}', '${c.getBnum() }','${varnum }','7','${f.getReplycount()}')"><img alt="글 삭제하기" src="CSS/noticeboardpic/100-coffee-icon.png" style="width:20pt; height:10pt;" ></a>
									
								</c:when>
							</c:choose>
							
						<div style="text-align: left">${c.getCdate() }
						<!-- 스테이트 추가 -->
						<c:set var="statetrue" value="${statetrue+1 }"></c:set>
							<!-- 본인이 적은글 삭제 할수 있게 해주는 기능 추가 -->	
						</div>
						<br>
				</c:if>
				<c:if test="${statetrue == 7}"> 
					<c:set var="doneLoop" value="true"/> 
					<c:set var="statetrue" value="0"/>
				</c:if>
				</c:if>
			</div>
			</c:forEach>
			
		</div>
			
		
		<div id="replynum${varnum }">
			<c:if test="${f.getReplycount()>7 }">
				<a href="javascript:void()" onclick="replygetList('${f.getBnum()}','${varnum }','7', '${f.getReplycount()}',1)" >댓글 더 보기</a>
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
