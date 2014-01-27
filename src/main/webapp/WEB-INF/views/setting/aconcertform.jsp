<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>콘서트정보 등록하기</title>
<script type="text/javascript" src="CSS/settingcalender/calendar.js"></script>
</head>
<body id="main_body">

	<div id="form_container">

		<form id="form_782108" class="appnitro" enctype="multipart/form-data"
			method="post" action="">
			<div class="form_description">
				<h2 style="color: #333">공연정보 등록하기</h2>
			</div>
			<table>
			<tr>
				<td id="li_1"><label class="description" for="element_1">concertinfo
				</label>
					<div>
						<input id="element_1" name="element_1" class="element text medium"
							type="text" maxlength="200" value="" />
					</div></td></tr>
				<tr><td id="li_6"><label class="description" for="element_6">conplace
				</label>
					<div>
						<input id="element_6" name="element_6" class="element text medium"
							type="text" maxlength="255" value="" />
					</div></td></tr>
				<tr><td id="li_7"><label class="description" for="element_7">consinger
				</label>
					<div>
						<input id="element_7" name="element_7" class="element text medium"
							type="text" maxlength="255" value="" />
					</div></td></tr>
				<tr><td id="li_2"><label class="description" for="element_2">startdateTime
				</label> <span> <input id="element_2_1" name="element_2_1"
						class="element text" size="2" maxlength="2" value="" type="text">
						/ <label for="element_2_1">MM</label>
				</span> <span> <input id="element_2_2" name="element_2_2"
						class="element text" size="2" maxlength="2" value="" type="text">
						/ <label for="element_2_2">DD</label>
				</span> <span> <input id="element_2_3" name="element_2_3"
						class="element text" size="4" maxlength="4" value="" type="text">
						<label for="element_2_3">YYYY</label>
				</span> <span id="calendar_2"> <img id="cal_img_2"
						class="datepicker" src="CSS/settingcalender/calendar.gif" alt="Pick a date.">
				</span> <script type="text/javascript">
					Calendar.setup({
						inputField : "element_2_3",
						baseField : "element_2",
						displayArea : "calendar_2",
						button : "cal_img_2",
						ifFormat : "%B %e, %Y",
						onSelect : selectDate
					});
				</script>
				 <span> <input id="element_3_1" name="element_3_1"
						class="element text " size="2" type="text" maxlength="2" value="" />
						: <label>HH</label>
				</span> <span> <input id="element_3_2" name="element_3_2"
						class="element text " size="2" type="text" maxlength="2" value="" />
						: <label>MM</label>
				</span> <span> <input id="element_3_3" name="element_3_3"
						class="element text " size="2" type="text" maxlength="2" value="" />
						<label>SS</label>
				</span> <span> <select class="element select" style="width: 4em"
						id="element_3_4" name="element_3_4">
							<option value="AM">AM</option>
							<option value="PM">PM</option>
					</select> <label>AM/PM</label>
				</span></td></tr>
				<tr><td id="li_4"><label class="description" for="element_4">enddateTime
				</label> <span> <input id="element_4_1" name="element_4_1"
						class="element text" size="2" maxlength="2" value="" type="text">
						/ <label for="element_4_1">MM</label>
				</span> <span> <input id="element_4_2" name="element_4_2"
						class="element text" size="2" maxlength="2" value="" type="text">
						/ <label for="element_4_2">DD</label>
				</span> <span> <input id="element_4_3" name="element_4_3"
						class="element text" size="4" maxlength="4" value="" type="text">
						<label for="element_4_3">YYYY</label>
				</span> <span id="calendar_4"> <img id="cal_img_4"
						class="datepicker" src="CSS/settingcalender/calendar.gif" alt="Pick a date.">
				</span> <script type="text/javascript">
					Calendar.setup({
						inputField : "element_4_3",
						baseField : "element_4",
						displayArea : "calendar_4",
						button : "cal_img_4",
						ifFormat : "%B %e, %Y",
						onSelect : selectDate
					});
				</script><span> <input id="element_5_1" name="element_5_1"
						class="element text " size="2" type="text" maxlength="2" value="" />
						: <label>HH</label>
				</span> <span> <input id="element_5_2" name="element_5_2"
						class="element text " size="2" type="text" maxlength="2" value="" />
						: <label>MM</label>
				</span> <span> <input id="element_5_3" name="element_5_3"
						class="element text " size="2" type="text" maxlength="2" value="" />
						<label>SS</label>
				</span> <span> <select class="element select" style="width: 4em"
						id="element_5_4" name="element_5_4">
							<option value="AM">AM</option>
							<option value="PM">PM</option>
					</select> <label>AM/PM</label>
				</span></td></tr>
				
				<tr><td id="li_8"><label class="description" for="element_8">congrade
				</label>
					<div>
						<input id="element_8" name="element_8" class="element text medium"
							type="text" maxlength="255" value="" />
					</div></td></tr>
				<tr><td id="li_9"><label class="description" for="element_9">conlon
				</label>
					<div>
						<input id="element_9" name="element_9" class="element text medium"
							type="text" maxlength="255" value="" />
					</div></td></tr>
				<tr><td id="li_10"><label class="description" for="element_10">conlat
				</label>
					<div>
						<input id="element_10" name="element_10"
							class="element text medium" type="text" maxlength="255" value="" />
					</div></td></tr>
				<tr><td id="li_11"><label class="description" for="element_11">conectiinfo
				</label>
					<div>
						<textarea id="element_11" name="element_11"
							class="element textarea medium"></textarea>
					</div></td></tr>
				<tr><td id="li_12"><label class="description" for="element_12">conpic
				</label>
					<div>
						<input id="element_12" name="element_12" class="element file"
							type="file" />
					</div></td></tr>

				<tr><td class="buttons"><input type="hidden" name="form_id"
					value="782108" /> <input id="saveForm" class="button_text"
					type="submit" name="submit" value="Submit" /></td></tr>
			</table>
		</form>
	</div>
</body>
</html>