<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<h2>공지사항 글쓰기</h2>
<div id="form_container">

<form class="appnitro" enctype="multipart/form-data" method="post" action="">
					<div class="form_description">
		<BR>	<p>메니저님 공지사항 글을 수정하려고 합니다 작성하고 공지사항 수정하기 버튼을 눌러주시면 됩니다.</p>
		</div>						
		<input type="hidden" value="${userid }">
		<label class="description" for="btitle">글 제목 </label>
		<div>
		<input name="bnum" type="hidden" value=${board.bnum }>
			<input  name="btitle" class="element text medium" type="text" maxlength="255" value="${board.getBtitle() }"/> 
		</div> 
		<label class="description" for="bcontent">글 내용 </label>
		<div>
			<textarea name="bcontent" class="element textarea medium">${board.getBcontent() }</textarea> 
		</div> 
		<label class="description" for="filespic">첨부사진 </label>
		<div>
			<input name="filespic" class="element file" type="file"/> 이전 파일명 : ${board.getBpicname()}
		</div>  
			    <!-- <input type="hidden" name="form_id" value="783685" />  -->
				<input id="saveForm" class="button_text" type="submit" name="submit" value="수정하기" />
				<input type="button" value="돌아가기" onclick="location.href='community.user'">
		</form>	
		</div>