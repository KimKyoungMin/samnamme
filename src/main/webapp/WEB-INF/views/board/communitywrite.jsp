<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<h2>새글 쓰기</h2>
<script type="text/javascript">
function len_chk(){  
	
	  var frm = document.communityFrm.bcontent; 
	
	  if(frm.value.length > 3700){  
	       alert("글자수는 영문4000, 한글2000자로 제한됩니다.!");
	       frm.value = frm.value.substring(0,3700);  
	       frm.focus();  
	  } 
	} 
</script>
<div id="form_container">

<form class="appnitro" name ="communityFrm" enctype="multipart/form-data" method="post" action="">
					<div class="form_description">
		<BR>	<p>새글을 작성하고 싶군요? 마음대로 적어보세요</p>
		</div>						
			<input type="hidden" name="userid" value="${userid }">
		<label class="description" for="btitle">게시하고픈 글 제목 </label>
		<div>
			<input  name="btitle" class="element text medium" type="text" maxlength="50" 
			placeholder="input title please" required autofocus value=""/> 
		</div> 
		<label class="description" for="bcontent">내용 </label>
		<div>
			<textarea name="bcontent" class="element textarea medium" placeholder="input contente please" required autofocus
			  onKeyup="len_chk()"></textarea> 
		</div> 
		<label class="description" for="filespic">첨부하고싶은 사진(1장만, 10MBity 이하) </label>
		<div>
			<input name="filespic" class="element file" type="file"/> 
		</div>  
			    <!-- <input type="hidden" name="form_id" value="783685" />  -->
				<div align="center">
				  <input id="saveForm" class="submit button3" type="submit" name="submit" value="Write" />
				  <input type="button" class="submit button3" value="Cancle" onclick="javascript:history.go(-1);">
				</div>
		</form>	
		</div>