<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>콘서트정보 수정하기</title>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"
	type="text/javascript"></script>

<script type="text/javascript" src="CSS/settingcalender/calendar.js"></script>
<script type="text/javascript"
	src="CSS/settingcalender/jquery.timePicker.js"></script>
<style type="text/css">
@import "CSS/settingcalender/timePicker.css";
</style>
<script type="text/javascript">
	function CallInsert(obj) {
		var data = obj.value;
		alert(data);
	}
	function test() {
		var firstpriceObj = document.getElementById("FIRSTPRICE").value;
		FIRSTPRICE = parseInt(firstpriceObj);
		BUSINESSPRICE = (FIRSTPRICE * 7);
		ECONOMIPRICE = (FIRSTPRICE * 5);

		var BUSINESSPRICEObj = document.getElementById("BUSINESSPRICE");
		var ECONOMIPRICEObj = document.getElementById("ECONOMIPRICE");
		BUSINESSPRICEObj.value = BUSINESSPRICE;
		ECONOMIPRICEObj.value = ECONOMIPRICE;
		/* document.form.BUSINESSPRICE.value=BUSINESSPRICE;
		document.form.FIRSTPRICE.value=FIRSTPRICE; */
	}
	function radioTest() {
		var a = document.getElementById("chk").value;
		var heheObj = document.getElementById("hehe");

		heheObj.value = a;
	}

	function radioTest1() {
		var a = document.getElementById("chk1").value;
		var heheObj = document.getElementById("hehe");

		heheObj.value = a;
	}
	function radioTest2() {
		var a = document.getElementById("chk2").value;
		var okObj = document.getElementById("ok");

		okObj.value = a;
	}

	function radioTest3() {
		var a = document.getElementById("chk3").value;
		var okObj = document.getElementById("ok");

		okObj.value = a;
	}

	$(function() {
		$("#startday, #endday").datepicker(
				{
					dateFormat : 'yy-mm-dd',
					prevText : '이전 달',
					nextText : '다음 달',
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					showMonthAfterYear : true,
					yearSuffix : '년'
				});
	});

	function selectEvent(selectObj) {
		$.get("getairlist.jsp", {
			name : selectObj.value
		}, function(data) {
			$("#selectnumber").html(data); //html -> innerHTML (태그와 태그사이 삽입)
		});

	}

	jQuery(function() {
		$("#starttime").timePicker();
		$("#endtime").timePicker();
	});
	
	//글자수 제한 체크 
	function len_chk(){
	  var frm = document.form_782108.conectinfo; 
	    
	  if(frm.value.length > 3800){  
	       alert("글자수는 영문3800, 한글1900자로 제한됩니다.!");  
	       frm.value = frm.value.substring(0,3800);  
	       frm.focus();  
	  } 
	} 
</script>
</head>
<body id="main_body">

	<div id="form_container">

		<form class="appnitro" id="form_782108" name="form_782108" enctype="multipart/form-data"
			method="post" action="">
			<table>
				<tr>
					<td>
						<div class="form_description">
							<h2 style="color: #333">공연정보
								등록하기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h2>
						</div>
				<tr>
					<td><label class="description" for="element_1">공연제목
					</label>
						<div>
							<input id="contitle" name="contitle" class="element text medium"
								type="text" maxlength="200" 
								placeholder="input Concert title please" required autofocus value="${concertDetail.getContitle()}" />
						</div>
						<input name="connum" type="hidden" value="${concertDetail.getConnum()}" />
						</td>
				</tr>
				<tr>
					<td><label class="description" for="element_6">공연장소
					</label>
						<div>
							<input id="conplace" name="conplace" class="element text medium"
								type="text" maxlength="100" 
								placeholder="input Concert floor please" required autofocus  value="${concertDetail.getConplace() }" />
						</div></td>
				</tr>

				<tr>
					<td><label class="description" for="element_7">가수명
					</label>
						<div>
							<input id="consinger" name="consinger"
								class="element text medium" type="text" maxlength="100" 
								placeholder="input Concert singer please" required autofocus
								value="${concertDetail.getConsinger()}" />
						</div></td>
				</tr>
				<tr>
					<td>공연시작일<br>
					<input type="text" id="startday" name="startday" placeholder="input Date please" required autofocus 
					value="${concertDetail.getCondate()}"
					> 공연시간 :<input
						type="text" id="starttime" name="starttime" size="10" 
						placeholder="Start time" required autofocus value="${concertDetail.getStarttime() }" 
						/> 공연종료시간<input
						type="text" id="endtime" name="endtime" size="10" 
						placeholder="endTime" required autofocus value="${concertDetail.getEndtime() }"/>
					</td>
				</tr>
				<tr>
					<td id="li_8"><label class="description" for="element_8">공연 분류 </label>
						<div>
							<input id="congrade" name="congrade" class="element text medium"
								type="text"  maxlength="100" 
								placeholder="input Concert congrade please" required autofocus value="${concertDetail.getCongrade() }"/>
						</div></td>
				</tr>
				<tr>
					<td id="li_9"><label class="description" for="element_9">공연 좌표(위도) </label>
						<div>
							<input id="conlon" name="conlon" class="element text medium"
								type="text" maxlength="11" 
								placeholder="conlon" required autofocus  value="${concertDetail.getConlon() }" />
						</div></td>
				</tr>
				<tr>
					<td id="li_10"><label class="description" for="element_10">공연좌표(경도)
					</label>
						<div>
							<input id="conlat" name="conlat" class="element text medium"
								type="text" maxlength="11" 
								placeholder="input Conlat title please" required autofocus value="${concertDetail.getConlat()}" />
						</div></td>
				</tr>
				<tr>
					<td id="li_11"><label class="description" for="element_11">설명 </label>
						<div>
							<textarea id="conectinfo" name="conectinfo"
							onKeyup="len_chk()"
								 placeholder="input content please" required autofocus
								class="element textarea medium">${concertDetail.getConectinfo()}</textarea>
						</div></td>
				</tr>
				<tr>
					<td id="li_12"><label class="description" for="element_12">공연 사진자료 </label>
						<div>
							<input id="files" name="files" class="element file" type="file"
							/>이전 파일명 : ${concertDetail.getConpic()}
							
						</div></td>
				</tr>

			</table>
			<div align="center">
			     <input id="saveForm" class="submit button3" type="submit" name="submit" value="입력완료" />
			     <input class="submit button3" type="button" value="Cancel" onclick="javascript:history.back();"/> 
			</div>
		</form>
	</div>
</body>
</html>