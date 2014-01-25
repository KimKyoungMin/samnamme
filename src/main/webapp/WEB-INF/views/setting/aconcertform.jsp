<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<img id="top" src="top.png" alt="">
	
	
		<form action="aconcertform.htm" enctype="multipart/form-data" method="post" >
					<div class="form_description">
			<h2>공연정보 업데이트 하기</h2>
			<p>여기에 공연정보 내용을 작성해 주세요</p>
		</div>						
			<ul>
					<li id="li_1" >
		<label class="description" for="element_1">공연 제목 
			<input id="element_1" name="element_1" class="element text medium" type="text" maxlength="100" value=""/> 
		 </label>
		</li>		<li id="li_2" >
		<label class="description" for="element_2">공연 시작 일자 및 시간
		<span>
			<input id="element_2_1" name="element_2_1" class="element text" size="2" maxlength="2" value="" type="text"> /
			<label for="element_2_1">MM</label>
		</span>
		<span>
			<input id="element_2_2" name="element_2_2" class="element text" size="2" maxlength="2" value="" type="text"> /
			<label for="element_2_2">DD</label>
		</span>
		<span>
	 		<input id="element_2_3" name="element_2_3" class="element text" size="4" maxlength="4" value="" type="text">
			<label for="element_2_3">YYYY</label>
		</span>
	
		<span id="calendar_2">
			<img id="cal_img_2" class="datepicker" src="calendar.gif" alt="Pick a date.">	
		</span>
		<script type="text/javascript">
			Calendar.setup({
			inputField	 : "element_2_3",
			baseField    : "element_2",
			displayArea  : "calendar_2",
			button		 : "cal_img_2",
			ifFormat	 : "%B %e, %Y",
			onSelect	 : selectDate
			});
		</script>
		  </label>
		</li>		<li id="li_3" >
		<label class="description" for="element_3">공연 끝 시간 
		<span>
			<input id="element_3_1" name="element_3_1" class="element text" size="2" maxlength="2" value="" type="text"> /
			<label for="element_3_1">MM</label>
		</span>
		<span>
			<input id="element_3_2" name="element_3_2" class="element text" size="2" maxlength="2" value="" type="text"> /
			<label for="element_3_2">DD</label>
		</span>
		<span>
	 		<input id="element_3_3" name="element_3_3" class="element text" size="4" maxlength="4" value="" type="text">
			<label for="element_3_3">YYYY</label>
		</span>
	
		<span id="calendar_3">
			<img id="cal_img_3" class="datepicker" src="calendar.gif" alt="Pick a date.">	
		</span>
		<script type="text/javascript">
			Calendar.setup({
			inputField	 : "element_3_3",
			baseField    : "element_3",
			displayArea  : "calendar_3",
			button		 : "cal_img_3",
			ifFormat	 : "%B %e, %Y",
			onSelect	 : selectDate
			});
		</script>
		 </label>
		</li>		<li id="li_4" >
		<label class="description" for="element_4">행사장소 
			<input id="element_4" name="element_4" class="element text medium" type="text" maxlength="255" value=""/> 
		</label>
		</li>		<li id="li_5" >
		<label class="description" for="element_5">가수 
		
			<input id="element_5" name="element_5" class="element text medium" type="text" maxlength="255" value=""/> 
		</label>
		</li>		<li id="li_6" >
		<label class="description" for="element_6">장르 
		
			<input id="element_6" name="element_6" class="element text medium" type="text" maxlength="255" value=""/> 
		  </label>
		</li>		<li id="li_7" >
		<label class="description" for="element_7">설명 
		
			<input id="element_7" name="element_7" class="element text medium" type="text" maxlength="255" value=""/> 
		</label>
		</li>		<li id="li_8" >
		<label class="description" for="element_8">위도좌표 
		
			<input id="element_8" name="element_8" class="element text medium" type="text" maxlength="255" value=""/> 
		</label>
		</li>		<li id="li_9" >
		<label class="description" for="element_9">경도좌표
		
			<input id="element_9" name="element_9" class="element text medium" type="text" maxlength="255" value=""/> 
		</label>
		</li>		<li id="li_10" >
		<label class="description" for="element_10">설명 그림 파일 
		
			<input id="element_10" name="element_10" class="element file" type="file"/> 
		  </label>
		</li>
			
					<li class="buttons">
			    <input type="hidden" name="form_id" value="781580" />
			    
				<input id="saveForm" class="button_text" type="submit" name="submit" value="Submit" />
		</li>
			</ul>
		</form>	
</body>
</html>