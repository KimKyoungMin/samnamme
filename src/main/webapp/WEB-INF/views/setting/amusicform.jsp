<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script type="text/javascript">
//글자수 제한 체크 
function len_chk(){  
  var frm = document.appnitro.metcinfo; 
    
  if(frm.value.length > 3800){  
       alert("글자수는 영문3800, 한글1900자로 제한됩니다.!");  
       frm.value = frm.value.substring(0,3800);  
       frm.focus();  
  } 
} 

function len_chkk(){  
	  var frm = document.appnitro.murl; 
	    
	  if(frm.value.length > 300){  
	       alert("글자수는 영문300, 한글150자로 제한됩니다.!");  
	       frm.value = frm.value.substring(0,300);
	       frm.focus();  
	  } 

	}
	
</script>

<div id="form_container">

	<form class="appnitro" enctype="multipart/form-data" method="post"
		action="" name=""appnitro"">
		<div class="form_description">
			<h2>음악정보 업로드 하는곳</h2>
			<p>음악정보를 업로드 하세요</p>
			
		</div >

			<label class="description" for="element_1">노래제목
			</label>
				<div>
					<input id="mtitle" name="mtitle" class="element text medium"
						type="text" maxlength="200" placeholder="input title please" required autofocus value="" />
				</div>
			<label class="description" for="element_2">가수이름
			</label>
				<div>
					<input id="msname" name="msname" class="element text medium"
						type="text" maxlength="100" placeholder="input singer name please" required autofocus value="" />
				</div>
			<label class="description" for="element_3">음악장르
			</label>
				<div>
					<input id="mgrade" name="mgrade" class="element text medium"
						type="text" maxlength="30" placeholder="input grade please" required autofocus value="" />
				</div>
			<label class="description" for="element_4">Etc 기타정보
			</label>
				<div>
					<textarea id="metcinfo" name="metcinfo"
						class="element textarea medium" onKeyup="len_chk()"
						placeholder="input Etc content please" required autofocus></textarea>
				</div>
			<label class="description" for="element_4">유투브 URL <a href="https://www.youtube.com/">경로</a>
			</label>
				<div>
					<textarea id="murl" name="murl"
						class="element textarea medium"  onKeyup="len_chkk()"
						placeholder="input Utub URL please" required autofocus></textarea>
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