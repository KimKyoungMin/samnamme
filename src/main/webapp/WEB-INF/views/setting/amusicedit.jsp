<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<div id="form_container">

	<form class="appnitro" enctype="multipart/form-data" method="post"
		action="">
		<div class="form_description">
			<h2>음악정보 수정</h2>		
		</div >

			<label class="description" for="element_1">노래제목
			</label>
				<div>
					<input id="mtitle" name="mtitle" class="element text medium"
						type="text" maxlength="255" value="${md.mtitle }" />
				</div>
			<label class="description" for="element_2">가수이름
			</label>
				<div>
					<input id="msname" name="msname" class="element text medium"
						type="text" maxlength="255" value="${md.msname }" />
				</div>
			<label class="description" for="element_3">음악장르
			</label>
				<div>
					<input id="mgrade" name="mgrade" class="element text medium"
						type="text" maxlength="255" value="${md.mgrade }" />
				</div>
			<label class="description" for="element_4">Etc 기타정보
			</label>
				<div>
					<textarea id="metcinfo" name="metcinfo"
						class="element textarea medium">${md.metcinfo }</textarea>
				</div>
			<label class="description" for="element_4">유투브 URL 경로
			</label>
				<div>
					<textarea id="murl" name="murl"
						class="element textarea medium">${md.murl }</textarea>
				</div>
			<label class="description" for="element_5">음악정보 사진
					a File </label>
				<div>
					<input id="files[0]" name="files[0]" class="element file"
						type="file" />-> ${md.mpicname }		
				</div>
			<label class="description" for="element_6">MusicFile
					a File </label>
				<div>
					<input id="files[1]" name="files[1]" class="element file"
						type="file" />-> ${md.mfilename }
				</div>
			<input type="hidden" name="aid" value="ADMIN">
			<input id="saveForm" class="button_text" type="submit" name="submit" value="Submit" />
			<input id="cancle" class="button_text" type="button" name="cancle" value="Cancle" 
			       onclick="javascript:history.go(-1)"/>
	</form>
	
</div>