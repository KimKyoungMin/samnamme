<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<h2>새글 쓰기</h2>
<div id="form_container">

<form class="appnitro" enctype="multipart/form-data" method="post" action="">
					<div class="form_description">
		<BR>	<p>새글을 작성하고 싶군요? 마음대로 적어보세요</p>
		</div>						
			
		<label class="description" for="btitle">게시하고픈 글 제목 </label>
		<div>
			<input  name="btitle" class="element text medium" type="text" maxlength="255" value=""/> 
		</div> 
		<label class="description" for="bcontent">내용 </label>
		<div>
			<textarea name="bcontent" class="element textarea medium"></textarea> 
		</div> 
		<label class="description" for="filespic">첨부하고싶은 사진(1장만, 10MBity 이하) </label>
		<div>
			<input name="filespic" class="element file" type="file"/> 
		</div>  
			    <!-- <input type="hidden" name="form_id" value="783685" />  -->
				<input id="saveForm" class="button_text" type="submit" name="submit" value="새글 올리기" />
				<input type="button" value="돌아가기" onclick="location.href='community.user'">
		</form>	
		</div>