<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="co.kr.samman.dto.concert"%>
<%
	request.setCharacterEncoding("utf-8");
	//카렌더 초기값 설정 변수
	Calendar cal = Calendar.getInstance();
	int nowYear = cal.get(Calendar.YEAR);
	int nowMonth = cal.get(Calendar.MONTH) + 1; // +1
	int nowDay = cal.get(Calendar.DAY_OF_MONTH);
	///////////////////1모듈, 현재 시스템에서 파라미터 가져오고
	//   파라미터 있으면 넣어주고 없으면 시스템에 있는 연월일을 넣어줌
	String strYear = request.getParameter("year");
	String strMonth = request.getParameter("month");
	
	int year = nowYear; // 현재의 년을 받아옴.
	int month = nowMonth; // 현재의 월을 받아옴.
	int scopeday; // 날자를 셋팅하기 위한 변수
	
	if (strYear != null) {
		year = Integer.parseInt(strYear);
	}

	if (strMonth != null) {
		month = Integer.parseInt(strMonth);
	}
	///////////////////1모듈, 현재 시스템에서 파라미터 가져오고
	//모듈1.2 카렌더로 연, 월 셋팅시 첫날, 마지막날, 요일을 가져옴
	cal.set(year, month - 1, 1);
	int startDay = 1;
	//마지막 날자와, 시작날자, 해당 월에 시작되는 요일 셋팅
	int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	int week = cal.get(Calendar.DAY_OF_WEEK);
	///////////////////
	//칸크기 셋팅
	int boxweight = 120;
	int boxheight = 100;
	//List<concert> list = new List<concert>();
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	//연월 셋팅 함수
	function window_onload() {
		var starti = 2014;
		for (var i = starti; i <= starti+1; i++) {
			var op = new Option(i + "년", i);
			syear.options[i - starti] = op;
			if (i ==
<%=year%>
	) {
				syear.options[i - starti].selected = "selected";
			}
		}
		for (i = 1; i <= 12; i++) {
			var op = new Option(i + "월", i);
			smonth.options[i - 1] = op;
			if (i ==
<%=month%>
	) {
				smonth.options[i - 1].selected = "selected";
			}
		}
	}
	//월 바뀔시 진행 함수
	function month_onchange() {
		var month = smonth.value;
		var year = syear.value;
		var addr = "concertmain.htm?year=" + year + "&month=" + month;
		// alert(addr);
		//addr 이 가지는 주소값으로  페이지를 이동시킨다.       
		location.href = addr;

	}
	//연 바꿀시 진행 함수
	function year_onchange() {
		var year = syear.value;
		var month = smonth.value;
		var addr = "concertmain.htm?year=" + year + "&month=" + month;

		location.href = addr;

	}
</script>
<title>Insert title here</title>
</head>
<body onload="window_onload()">
	<!-- 연, 월 셋팅 -->
	
	<div id="calalign" align="center">
		<table   cellspacing="1" cellpadding="2" bgcolor="#e6f6e6">
		<tr>
			<td width="<%=boxweight * 7 +6%>" colspan="7"
				style="color: blue; border: solid 1px green;"><b>&nbsp; <select
					id="syear" onchange="year_onchange()">
						<option></option>
				</select></b> <b>&nbsp; <select id="smonth" onchange="month_onchange()">
						<option></option>
				</select></b></td>
	</table>
	<!-- 요일 셋팅 -->
	<table   cellspacing="1" cellpadding="2" bgcolor="#cccccc">
		<tr align="left" valign="top">
			<td bgcolor="#e6e4e6" width="<%=boxweight%>" height="<%=boxheight%>"
				style="color: red;">일</td>
			<td bgcolor="#e6e4e6" width="<%=boxweight%>" height="<%=boxheight%>">월</td>
			<td bgcolor="#e6e4e6" width="<%=boxweight%>" height="<%=boxheight%>">화</td>
			<td bgcolor="#e6e4e6" width="<%=boxweight%>" height="<%=boxheight%>">수</td>
			<td bgcolor="#e6e4e6" width="<%=boxweight%>" height="<%=boxheight%>">목</td>
			<td bgcolor="#e6e4e6" width="<%=boxweight%>" height="<%=boxheight%>">금</td>
			<td bgcolor="#e6e4e6" width="<%=boxweight%>" height="<%=boxheight%>"
				style="color: black;">토</td>

		</tr>
		<%
			int newLine = 0;
		%><tr align='left' valign='top'>
			<%
				//날자 셋팅
				for (scopeday = 1; scopeday < week; scopeday++) {
					out.print("<td width=" + boxweight + " height=" + boxheight
							+ " bgcolor='#ffffff'>&nbsp;</td>");
					newLine++;
				}

				for (scopeday = startDay; scopeday <= endDay; scopeday++) {
					//요일별 날자 fontcolor 지정
					String fontColor = (newLine == 0) ? "red"
							: (newLine == 6) ? "blue" : "black";
					
					//today = 배경색 지정, 나머지는 흰색으로 지정
					String bgColor = (nowYear == year) && (nowMonth == month)
							&& (nowDay == scopeday) ? " #e6e4e6" : "#ffffff";
					
					//결정된 내용 화면에 뿌려주기
					%>
					<td width="<%=boxweight %>" height="<%=boxheight %>"
				bgcolor="<%=bgColor %>"><font Color="<%=fontColor %>">
				 <%=scopeday %><br>
				 
				 <!-- db에서 가져온 공연정보 비교 및 화면에 뿌려주기 -->
				 <c:set value="<%=scopeday%>" var="scopeday" />
				 <c:set value="<%=month%>" var="cmonth" />
				 <c:set value="<%=year%>" var="cyear" />
				 
				  <c:forEach var="f" items="${concertlist}">
						<c:if test="${f.getConyear()==cyear}">
							<c:if test="${f.getConmonth() == cmonth }">
								<c:if test="${f.getConday()==scopeday}">
									<a href="concertdetail.htm?connum=${f.getConnum()}" style="color: #CC0000"
									>${f.getContitle()}</a>
								</c:if>
							</c:if>
						</c:if>
					</c:forEach>
					
			</font></td>
			<%newLine++;
					
					if (newLine == 7 && scopeday != endDay) {
						out.print("</tr><tr  align='left' valign='top'>");
						newLine = 0;
					}
				}
				while (newLine > 0 && newLine < 7) {
					out.print("<td width=" + boxweight + " height=" + boxheight
							+ " bgcolor='#ffffff'>&nbsp;</td>");
					newLine++;
				}
				out.print("</tr>");
			%>
		
	</table>
	</div>
	
	
	<a href="concertdetail.jsp"> 디테일 딴</a>
</body>
</html>