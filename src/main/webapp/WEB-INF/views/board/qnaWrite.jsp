<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
 
   <h2>��������</h2>
			<form action="qnaWrite.user" method="post">
   <div id="notice-article-detail" class="article-detail margin-large" >						
						<dl class="article-detail-row">
							<dt class="article-detail-title">
								����
							</dt>
							<dd class="article-detail-data">
								<input type="text" size="10" name="qtitle" id="qtitle">
							</dd>
						</dl>	
						<dl class="article-detail-row half-row">
							<dt class="article-detail-title">
								�ۼ���
							
							</dt>
							<dd class="article-detail-data half-data" >
								..
							</dd>
						</dl>
						<dl class="article-detail-row half-row">
							<dt class="article-detail-title">
								��ȸ��
							</dt>
							<dd class="article-detail-data half-data">
							</dd>
						</dl>

						<div class="article-content" >
							<textarea id="qcontent" class="txtContent" name="qcontent" ></textarea>
						
						<br>
						<input type="submit" value="���" >
						<input type="reset" value="���" >
						
						</div>			
							
					</div>
			</form>


</body>
</html>