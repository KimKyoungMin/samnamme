<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<h2>공지사항 글쓰기</h2>
<script type="text/javascript">
function len_chk(){  
	
	  var frm = document.noticeFrm.bcontent; 
	
	  if(frm.value.length > 3700){  
	       alert("글자수는 영문4000, 한글2000자로 제한됩니다.!");
	       frm.value = frm.value.substring(0,3700);  
	       frm.focus();  
	  } 
	} 
</script>
<div id="form_container">

<form class="appnitro" name ="noticeFrm" enctype="multipart/form-data" method="post" action="noticewrite.user">
					<div class="form_description">
		<BR>	<p>메니저님 공지사항 글을 작성하려고 합니다 작성하고 공지사항 올리기 버튼을 누르세요</p>
		</div>						
			
		<label class="description" for="btitle">글 제목 </label>
		<div>
			<input  name="btitle" class="element text medium" type="text" maxlength="50" 
			placeholder="input title please" required autofocus value=""/> 
		</div> 
		<label class="description" for="bcontent" >글 내용 </label>
		<div>
			<textarea name="bcontent" id="bcontent" class="element textarea medium" placeholder="input contente please" required autofocus
			  onKeyup="len_chk()"></textarea> 
		</div> 
		<label class="description" for="filespic">첨부사진 </label>
		<div>
			<input name="filespic" class="element file" type="file"/> 
		</div>  
			    <!-- <input type="hidden" name="form_id" value="783685" />  -->
				<div align="center">
				  <input id="saveForm" class="submit button3" type="submit" name="submit" value="Write" />
				  <input type="button" value="Cancle" onclick="javascript:history.go(-1);">
				</div>
		</form>	
		</div>