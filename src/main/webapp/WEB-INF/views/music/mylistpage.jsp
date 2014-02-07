<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<s:authentication property="name" var="loginUser"/>

<h2> ${loginUser }님의 My Player List</h2>
<br>
<div id="pushaudio" class="pushaudio">아름다워아름다워 사람이 꽃보다 아름다워</div>

<script type="text/javascript"> 
window.onload = playerstart;

//리스트가 tag에 있고 mylists 라는 리스트 객체가 있다면 이걸 이용가능함(처음 로드이 사용됨)
function playerstart(){
	
	var mylists = '<c:out value="${mylists.size()}"/>';
	//alert("mylists 갯수는 : "+mylists);
	htmlSrc = "";
	
	if(mylists > 1){
		//alert("리스트가 있습니다.");
		//htmlSrc 에 플레이어를 등록함
		htmlSrc+="<object type='application/x-shockwave-flash' data='http://flash-mp3-player.net/medias/player_mp3_multi.swf' width='200' height='100'>";
		htmlSrc+="<param name='movie' value='http://flash-mp3-player.net/medias/player_mp3_multi.swf'/>";
		htmlSrc+="<param name='bgcolor' value='#ffffff'/>";
		
		htmlSrc+="<param name='FlashVars' value='mp3=upload/";
	for(var i=0; i< mylists; i++){
	 	temp = "hiddenfilename"+i;
		//alert(document.getElementById(temp).value);
		htmlSrc+=""+document.getElementById(temp).value+"";
		if((i+1) < mylists){
			//alert("temp 값음 : "+ temp +"이며 mylists 의 값은 : "+mylists);
			htmlSrc+="|upload/";
		}
	}
	
	htmlSrc+="&amp;autoplay=1&amp;loop=1&amp;showvolume=1&amp;showloading=always&amp;showlist=0&amp;playlistalpha=0&amp;showplaylistnumbers=0'/>";
	htmlSrc+="</object>";
	alert(htmlSrc);
	}else{
		htmlSrc="<h3>음악 리스트가 없습니다.</h3>";
	}
	
	$('#pushaudio').html(htmlSrc);
	 
};

	//mylist 에서 음악파일 선택시 재생
	 /* function doopen(mfilename){
		//alert(mfilename);
		opener.document.getElementById("mfilename").value=mfilename;
		opener.document.getElementById("au").src = "upload/" + mfilename;
		
	}  */
	
	//checkbox 전체 선택 & 해제 (선택후 적용하면 리스트에서 삭제되는 형태)
	 var check = false;
	function CheckAll() {
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
  




