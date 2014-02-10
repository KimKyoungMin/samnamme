<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="co.kr.samman.dto.concert"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko" xmlns:v="urn:schemas-microsoft-com:vml">

<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>샘플코드</title>
        <!-- concertDetail.getConlon(), concertDetail.getConlat() -->
        
</head>
<body>

<script type="text/javascript" src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&key=c8162d374f224e4ca5c127a8e4dbee4b"></script>
<div id = "naverMap" style="border:3px solid #959595; width:450px; height:250px; margin:5px; display:block;"></div>
<script type="text/javascript">
//Mybatis --> JSTL --> JavaScript 변수 선언해주기
var conlon = '<c:out value="${concertDetail.getConlon()}"/>';
var conlat = '<c:out value="${concertDetail.getConlat()}"/>';
var contitle = '<c:out value="${concertDetail.getContitle()}"/>';

var oPoint = new nhn.api.map.LatLng(conlon, conlat);
nhn.api.map.setDefaultPoint('LatLng');
oMap = new nhn.api.map.Map('naverMap', {
    center : oPoint,
    level : 10, // 줌 초기 값 10.
    enableWheelZoom : false,
    enableDragPan : false,
    enableDblClickZoom : false,
    mapMode : 0,
    activateTrafficMap : false,
    activateBicycleMap : false,
    activateRealtyMap : true,
    minMaxLevel : [ 1, 14 ],
    size : new nhn.api.map.Size(450, 250)
});

var oSize = new nhn.api.map.Size(28, 37);
var oOffset = new nhn.api.map.Size(14, 37);
var oIcon = new nhn.api.map.Icon('http://static.naver.com/maps2/icons/pin_spot2.png', oSize, oOffset);

// 마커 찍기
var oMarker1 = new nhn.api.map.Marker(oIcon, { title : contitle });  //마커 생성
oMarker1.setPoint(oPoint); //마커 표시할 좌표 선택
oMap.addOverlay(oMarker1); //마커를 지도위에 표현

//라벨 넣기
var oLabel1 = new nhn.api.map.MarkerLabel(); // - 마커 라벨 선언.
oMap.addOverlay(oLabel1); // - 마커 라벨 지도에 추가. 기본은 라벨이 보이지 않는 상태로 추가됨.
oLabel1.setVisible(true, oMarker1); // 마커 라벨 보이기
        </script>
</body>
</html>