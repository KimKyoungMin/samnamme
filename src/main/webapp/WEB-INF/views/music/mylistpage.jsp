<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
		
		//button event create
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
	});
</script>

<!-- HTML5 추가 구문 -->
<audio id='my_audio' preload='auto' controls loop>
<source id='sos' src='' type=''>
</audio>
 <input type="button" name="rew" id="rew" value="이전곡">
 <input type="button" name="few" id="few" value="다음곡">
 
 <div id="mu_list">
 <c:forEach var="m" items="${mylists}" varStatus="arraycount">
	<source src="upload/${m.getMfilename()}" type="audio/mpeg" mname="${m.getMtitle()}/${m.getMsname()}" number="arraycount.index"></source>
	</c:forEach>
</div>
<div id="play_music"></div>



<!-- 기존 작성 구문 -->
<c:choose>
   <c:when test="${mylists.size()==0}">
   </c:when>
   <c:otherwise>
       <form action="musiclistDel.htm" method="get">
       
       <input type="checkbox" id ="checkall" name="checkall" onclick="javascript:CheckAll()"><input type="submit" class="delete button2" value="삭제">
       <br>
       
	   <div class="popup" id="popup" >
	   
		 <ul>
			<c:forEach var="m" items="${mylists}" varStatus="arraycount">
				<li>
				   <input type="checkbox" id="check[]" name="check[]" value=${m.getMinfonum() }>
				  	
				   <!-- 파일 이름을 받아내어 자바 스크립트 단에서 불러씀 -->
				   <!-- arraycount는 foreach 문과 함께 하는 index 값인데 붙여서 쓰면 id를 고유하게 해줄수있음 -->
				   <input type='hidden' id="hiddenfilename${arraycount.index }" value="${m.getMfilename()}">
				   <!-- 파일 리스트를 뿌려주고 이후에 해당 파일 클릭시 해당 파일부터 실행되도록 하기위함 -->
				   <a href="javascript:doopen('${m.getMfilename()}');">${m.getMtitle()}/${m.getMsname()}</a>
				   <hr>
				</li>
				<!-- 리스트 증가값 저장 -->
			</c:forEach>
		 </ul>
	   </div>
	   </form>
	</c:otherwise>
</c:choose>
 