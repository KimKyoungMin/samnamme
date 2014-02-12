<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 
   <h2>Q&A Write</h2>
			<form action="qnaWrite.user" method="post">
   <div id="notice-article-detail" class="article-detail margin-large" >						
						<dl class="article-detail-row">
							<dt class="article-detail-title">
								제목
							</dt>
							<dd class="article-detail-data">
								<input type="text" size="10" name="qtitle" id="qtitle" required>
							</dd>
						</dl>	
						<dl class="article-detail-row half-row">
							<dt class="article-detail-title">
								작성자
							
							</dt>
							<dd class="article-detail-data half-data" >
								${userid }
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
							<textarea id="qcontent" class="txtContent" name="qcontent" ></textarea>
						
						<br>
							<div align="center" style="margin-top:5px;margin-bottom:5px;">
								<input type="submit" value="등록" style="color:#fff;background-color: #28A8A8; width: 50px; height: 25px;">
								<input type="button" value="취소" onclick="javascript:history.back();" style="color:#fff;background-color: #28A8A8; width: 50px; height: 25px;">
							</div>
						</div>			
							
					</div>
			</form>
