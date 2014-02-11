<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<s:authentication property="name" var="loginUser"/>

<h2> ${loginUser }���� My Player List</h2>
<br>

<script type="text/javascript"> 

//onload event ó�� �� ����Ʈ ����, �� ����
	$(function() {
		var my_audio = document.getElementById('my_audio');
		my_audio.volume = 0.5;
		//����Ʈ�� ù �� ����
		var list_num = 1;
		var play_num = 1;
		
		//list, type �ΰ����� �÷��̿� �������
		//list�� �뷡����, type �� �뷡Ÿ���� type�� �������� ���� �ǰ�(ũ�ұ���), list�� �����ͼ� �־���� ��
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
		
		
		//�뷡�� ������ �̺�Ʈ ȣ��ɶ�
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

<!-- HTML5 �߰� ���� -->
<audio id='my_audio' preload='auto' controls loop>
<source id='sos' src='' type=''>
</audio><br>
<!-- <div id="play_music"></div> -->
<input type="text" id="play_music" placeholder="��� ��ٷ� �ּ���..loading.." readonly>
<input type="image" src="CSS/images/media-rewind-outline.png" style="width:35px;height:35px;" name="rew" id="rew" value="������">
<input type="image" src="CSS/images/media-fast-forward-outline.png" style="width:35px;height:35px;" name="few" id="few" value="������">
 
 <div id="mu_list">
 <c:forEach var="m" items="${mylists}" varStatus="arraycount">
	<source src="upload/${m.getMfilename()}" type="audio/mpeg" mname="${m.getMtitle()}/${m.getMsname()}" number="arraycount.index"></source>
	</c:forEach>
</div>




<!-- ���� �ۼ� ���� -->
<c:choose>
   <c:when test="${mylists.size()==0}">
   </c:when>
   <c:otherwise>
       <form action="musiclistDel.htm" method="get">
       
       <input type="checkbox" id ="checkall" name="checkall" onclick="javascript:CheckAll()"><input type="submit" class="delete button2" value="����">
       <br>
       
	   <div class="popup" id="popup" >
	   
		 <ul>
			<c:forEach var="m" items="${mylists}" varStatus="arraycount">
				<li>
				   <input type="checkbox" id="check[]" name="check[]" value=${m.getMinfonum() }>
				  	
				   <!-- ���� �̸��� �޾Ƴ��� �ڹ� ��ũ��Ʈ �ܿ��� �ҷ��� -->
				   <!-- arraycount�� foreach ���� �Բ� �ϴ� index ���ε� �ٿ��� ���� id�� �����ϰ� ���ټ����� -->
				   <input type='hidden' id="hiddenfilename${arraycount.index }" value="${m.getMfilename()}">
				   <!-- ���� ����Ʈ�� �ѷ��ְ� ���Ŀ� �ش� ���� Ŭ���� �ش� ���Ϻ��� ����ǵ��� �ϱ����� -->
				   <a href="javascript:doopen('${m.getMfilename()}');">${m.getMtitle()}/${m.getMsname()}</a>
				   <hr>
				</li>
				<!-- ����Ʈ ������ ���� -->
			</c:forEach>
		 </ul>
	   </div>
	   </form>
	</c:otherwise>
</c:choose>
 