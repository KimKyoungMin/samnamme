<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<div id="form_container">

	<form class="appnitro" enctype="multipart/form-data" method="post"
		action="">
		<div class="form_description">
			<h2>음악정보 업로드 하는곳</h2>
			<p>음악정보를 업로드 하세요</p>
			
		</div >

			<label class="description" for="element_1">노래제목
			</label>
				<div>
					<input id="mtitle" name="mtitle" class="element text medium"
						type="text" maxlength="255" value="" />
				</div>
			<label class="description" for="element_2">가수이름
			</label>
				<div>
					<input id="msname" name="msname" class="element text medium"
						type="text" maxlength="255" value="" />
				</div>
			<label class="description" for="element_3">음악장르
			</label>
				<div>
					<input id="mgrade" name="mgrade" class="element text medium"
						type="text" maxlength="255" value="" />
				</div>
			<label class="description" for="element_4">Etc 기타정보
			</label>
				<div>
					<textarea id="metcinfo" name="metcinfo"
						class="element textarea medium"></textarea>
				</div>
			<label class="description" for="element_4">유투브 URL <a href="https://www.youtube.com/">경로</a>
			</label>
				<div>
					<textarea id="murl" name="murl"
						class="element textarea medium"></textarea>
				</div>
			<label class="description" for="element_5">음악정보 사진
					a File </label>
				<div>
					<input id="files[0]" name="files[0]" class="element file"
						type="file" />
				</div>
			<label class="description" for="element_6">MusicFile
					a File </label>
				<div>
					<input id="files[1]" name="files[1]" class="element file"
						type="file" />
				</div>
			<input type="hidden" name="aid" value="ADMIN">
			<input id="saveForm" class="button_text" type="submit" name="submit" value="Submit" />
	</form>
	
</div>