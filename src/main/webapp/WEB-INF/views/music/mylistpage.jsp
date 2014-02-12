<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<s:authentication property="name" var="loginUser"/>

<h2> ${loginUser }님의 My Player List</h2>
<br>

<script type="text/javascript"> 

//onload event 처음 곡 리스트 셋팅, 곡 셋팅
	$(function() {
		var my_audio = document.getElementById('my_audio');
		my_audio.volume = 0.5;
		//리스트의 첫 값 설정
		var list_num = 1;
		var play_num = 1;
		
		//list, type 두가지가 플레이와 상관있음
		//list는 노래제목, type 은 노래타입임 type은 고정으로 쓰면 되고(크롬기준), list는 가져와서 넣어줘야 함
		var list = new Array();
		var type = new Array();
		var mname = new Array();
		//list get for function
		$("#mu_list source").each(function(i) {
			list_num = i + 1;
			list[list_num] = $(this).attr("src");
			type[list_num] = $(this).attr("type");
			mname[list_num] = $(this).attr("mname");
			$('#mu_list').remove();
		});
		
		document.getElementById('sos').src = list[1];
		document.getElementById('sos').type = type[1];
		
		$('#play_music').html(""+mname[1]);
		my_audio.play();
		
		
		//노래가 끝나는 이벤트 호출될때
		my_audio.addEventListener('ended', function() {
		
			var zz = play_num + 1;
			if (zz > list_num) {
				zz = 1;
			}
			
			document.getElementById('sos').src = list[zz];
			document.getElementById('sos').type = type[zz];
			$('#play_music').html(mname[zz]);
			my_audio.load();
			my_audio.play();
			play_num = zz;
			
		});
		
		//button event create (다음곡)
		document.getElementById('few').onclick = function() {
			  //alert('fewclick!');
			var zz = play_num + 1;
			if (zz > list_num) {
				zz = 1;
			}
			
			document.getElementById('sos').src = list[zz];
			document.getElementById('sos').type = type[zz];
			$('#play_music').html(mname[zz]);
			my_audio.load();
			my_audio.play();
			play_num = zz;
			};
		
			//button event create (이전곡)
		document.getElementById('rew').onclick = function() {
			  //alert('rewclick!');
			  
			var zz = play_num - 1;
			if (zz <= 0) {
				zz = list_num;
			}
			
			document.getElementById('sos').src = list[zz];
			document.getElementById('sos').type = type[zz];
			$('#play_music').html(mname[zz]);
			my_audio.load();
			my_audio.play();
			play_num = zz;
			};
			
		for(var i=0; i<list_num; i++){
			document.getElementById("musicchoice"+i).onclick = function(){
				var zz = parseInt($(this).attr("name"))+1;
				
				document.getElementById('sos').src = list[zz];
				document.getElementById('sos').type = type[zz];
				$('#play_music').html(mname[zz]);
				my_audio.load();
				my_audio.play();
				play_num = zz;
				};
			};
		/* document.getElementByID$(':button[id*=choiceMusic]').onclick = function(){
			alert("callok");
		}; */
	});
	
	//$(':button[id*=reply]').click(function() {
	//document.getElementById('rew').onclick = function() {
	 
	function CheckAll() {
		var check = false;
		var chk = document.getElementsByName("check[]");
		if (check == false) {
			check = true;
			for (var i = 0; i < chk.length; i++) {
				chk[i].checked = true; //모두 체크
			}
		} else {
			check = false;
			for (var i = 0; i < chk.length; i++) {
				chk[i].checked = false; //모두 해제
			}
		}
	} 	
</script>

<style>
</style>

<!-- HTML5 추가 구문 -->
<audio id='my_audio' preload='auto' controls loop>
<source id='sos' src='' type=''>
</audio><br>

<div id="play_controller2">
<table id="play_controller2"><tr>
<td>
<input type="image" src="CSS/images/media-rewind-outline.png" style="width:35px;height:35px;" name="rew" id="rew" value="이전곡">
</td>
<td>
<input type="image" src="CSS/images/media-fast-forward-outline.png" style="width:35px;height:35px;" name="few" id="few" value="다음곡">
</td>
<td colspan="5">
<div id="play_music" class="play_music"></div></td>
</tr></table>
 </div>
 <div id="mu_list">
 <c:forEach var="m" items="${mylists}" varStatus="arraycount">
	<source src="upload/${m.getMfilename()}" type="audio/mpeg" mname="${m.getMtitle()}/${m.getMsname()}" number="arraycount.index"></source>
	</c:forEach>
</div>

<!-- 기존 작성 구문 -->
<c:choose>
   <c:when test="${mylists.size()==0}">
   </c:when>
   <c:otherwise>
       <form action="musiclistDel.htm" method="get">
	   <div class="popup" id="popup" ><b>즐겨찾기 리스트</b>
		 <ul>
			<c:forEach var="m" items="${mylists}" varStatus="arraycount">
				<li>
				   <input type="checkbox" id="check[]" name="check[]" value=${m.getMinfonum() }>
				  	
				   <!-- 파일 이름을 받아내어 자바 스크립트 단에서 불러씀 -->
				   <!-- arraycount는 foreach 문과 함께 하는 index 값인데 붙여서 쓰면 id를 고유하게 해줄수있음 -->
				   <%-- <input type='hidden' id="hiddenfilename${arraycount.index }" value="${m.getMfilename()}"> --%>
				   <!-- 파일 리스트를 뿌려주고 이후에 해당 파일 클릭시 해당 파일부터 실행되도록 하기위함 -->
				   
				    <a href="#" id="musicchoice${arraycount.index }" name="${arraycount.index }" >${m.getMtitle()}/${m.getMsname()}</a>
				   <hr>
				</li>
				<!-- 리스트 증가값 저장 -->
			</c:forEach>
		 </ul>
		 <br>
		 <input type="checkbox" id ="checkall" name="checkall" onclick="javascript:CheckAll()"><input type="submit" class="delete button2" value="삭제">
	   </div>
	   </form>
	</c:otherwise>
</c:choose>
 