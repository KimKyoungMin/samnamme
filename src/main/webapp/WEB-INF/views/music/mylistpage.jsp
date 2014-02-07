<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<s:authentication property="name" var="loginUser"/>

<h2> ${loginUser }���� My Player List</h2>
<br>
<div id="pushaudio" class="pushaudio">�Ƹ��ٿ��Ƹ��ٿ� ����� �ɺ��� �Ƹ��ٿ�</div>

<script type="text/javascript"> 
window.onload = playerstart;

//����Ʈ�� tag�� �ְ� mylists ��� ����Ʈ ��ü�� �ִٸ� �̰� �̿밡����(ó�� �ε��� ����)
function playerstart(){
	
	var mylists = '<c:out value="${mylists.size()}"/>';
	//alert("mylists ������ : "+mylists);
	htmlSrc = "";
	
	if(mylists > 1){
		//alert("����Ʈ�� �ֽ��ϴ�.");
		//htmlSrc �� �÷��̾ �����
		htmlSrc+="<object type='application/x-shockwave-flash' data='http://flash-mp3-player.net/medias/player_mp3_multi.swf' width='200' height='100'>";
		htmlSrc+="<param name='movie' value='http://flash-mp3-player.net/medias/player_mp3_multi.swf'/>";
		htmlSrc+="<param name='bgcolor' value='#ffffff'/>";
		
		htmlSrc+="<param name='FlashVars' value='mp3=upload/";
	for(var i=0; i< mylists; i++){
	 	temp = "hiddenfilename"+i;
		//alert(document.getElementById(temp).value);
		htmlSrc+=""+document.getElementById(temp).value+"";
		if((i+1) < mylists){
			//alert("temp ���� : "+ temp +"�̸� mylists �� ���� : "+mylists);
			htmlSrc+="|upload/";
		}
	}
	
	htmlSrc+="&amp;autoplay=1&amp;loop=1&amp;showvolume=1&amp;showloading=always&amp;showlist=0&amp;playlistalpha=0&amp;showplaylistnumbers=0'/>";
	htmlSrc+="</object>";
	alert(htmlSrc);
	}else{
		htmlSrc="<h3>���� ����Ʈ�� �����ϴ�.</h3>";
	}
	
	$('#pushaudio').html(htmlSrc);
	 
};

	//mylist ���� �������� ���ý� ���
	 /* function doopen(mfilename){
		//alert(mfilename);
		opener.document.getElementById("mfilename").value=mfilename;
		opener.document.getElementById("au").src = "upload/" + mfilename;
		
	}  */
	
	//checkbox ��ü ���� & ���� (������ �����ϸ� ����Ʈ���� �����Ǵ� ����)
	 var check = false;
	function CheckAll() {
		var chk = document.getElementsByName("check[]");
		if (check == false) {
			check = true;
			for (var i = 0; i < chk.length; i++) {
				chk[i].checked = true; //��� üũ
			}
		} else {
			check = false;
			for (var i = 0; i < chk.length; i++) {
				chk[i].checked = false; //��� ����
			}
		}
	} 
</script>

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
  




