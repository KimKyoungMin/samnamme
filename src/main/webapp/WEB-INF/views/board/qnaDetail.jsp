<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

qnadetail�Խ���

<!-- <div class="profileN blockN" align="center"> -->
  
  
  <div id="notice-article-detail" class="article-detail margin-large" >						
						<dl class="article-detail-row">
							<dt class="article-detail-title">
								����
							</dt>
							<dd class="article-detail-data">
								${qnaDetail.qtitle}
							</dd>
						</dl>	
						<dl class="article-detail-row half-row">
							<dt class="article-detail-title">
								�ۼ���
							</dt>
							<dd class="article-detail-data half-data" >
							   ${qnaDetail.userid}
							</dd>
						</dl>
						<dl class="article-detail-row half-row">
							<dt class="article-detail-title">
								��ȸ��
							</dt>
							<dd class="article-detail-data half-data">
							${qnaDetail.depth }
							</dd>
						</dl>
						
						
						<div class="article-content" >
							<textarea id="txtContent" class="txtContent" name="content" readonly="readonly" >${qnaDetail.qcontent}
							</textarea>
						</div>
					</div>


</body>
</html>