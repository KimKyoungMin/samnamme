<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<h2>공지사항 글쓰기</h2>
<div id="form_container">

<form class="appnitro" enctype="multipart/form-data" method="post" action="">
					<div class="form_description">
		<BR>	<p>메니저님 공지사항 글을 작성하려고 합니다 작성하고 서밋 버튼을 누르세요</p>
		</div>						
			
		<label class="description" for="element_1">글 제목 </label>
		<div>
			<input id="element_1" name="element_1" class="element text medium" type="text" maxlength="255" value=""/> 
		</div> 
		<label class="description" for="element_2">글 내용 </label>
		<div>
			<textarea id="element_2" name="element_2" class="element textarea medium"></textarea> 
		</div> 
		<label class="description" for="element_3">첨부사진 </label>
		<div>
			<input id="element_3" name="element_3" class="element file" type="file"/> 
		</div>  
			
			    <input type="hidden" name="form_id" value="783685" />
			    
				<input id="saveForm" class="button_text" type="submit" name="submit" value="Submit" />
		</form>	
		</div>
