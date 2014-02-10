<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
function len_chk(){  
  var frm = document.editfm.qcontent; 
    
  if(frm.value.length > 4000){  
       alert("글자수는 영문4000, 한글2000자로 제한됩니다.!");  
       frm.value = frm.value.substring(0,4000);  
       frm.focus();  
  } 
 
} 
</script>
 
   <h2>Q&A Edit</h2>
			<form action="qnaEdit.user" method="post" name="editfm">
   <div id="notice-article-detail" class="article-detail margin-large" >						
						<dl class="article-detail-row">
							<dt class="article-detail-title">
								제목
							</dt>
							<dd class="article-detail-data">
								<input type="text" size="10" name="qtitle" id="qtitle" value="${qnadto.qtitle }" required>
							</dd>
						</dl>	
						<dl class="article-detail-row half-row">
							<dt class="article-detail-title">
								작성자			
							</dt>
							<dd class="article-detail-data half-data" >
								${qnadto.userid }
							</dd>
						</dl>
						<dl class="article-detail-row half-row">
							<dt class="article-detail-title">
								조회수
							</dt>
							<dd class="article-detail-data half-data">
							</dd>
						</dl>

						<div class="article-content" >
							<textarea id="qcontent" class="txtContent" name="qcontent" onKeyup="len_chk()">${qnadto.qcontent }</textarea>
						
						<br>
							<div align="center" style="margin-top:5px;margin-bottom:5px;">
								<input type="hidden" name="qnum" value="${qnadto.qnum }">
								<input type="submit" value="수정" style="background-color: E1EDB9; width: 50px; height: 25px;">
								<input type="button" value="취소" onclick="javascript:history.back();" style="background-color: E1EDB9; width: 50px; height: 25px;">
							</div>
						</div>			
							
					</div>
			</form>
