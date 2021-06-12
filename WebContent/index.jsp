<!doctype html>
<%@ page pageEncoding="utf-8" %>
<%@ include file="./inc/header.jsp" %>
  	<!-- breadcrumb start -->
  	<nav class="navbar navbar-expand navbar-light bg-light">
      <a class="navbar-brand" href="/test/index.jsp">PUBLIC SPORTS FACILITIES</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample02" aria-controls="navbarsExample02" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarsExample02">
        <ul class="navbar-nav mr-auto">
       
          <li class="nav-item">
            <a class="nav-link" href="#">Map</a>
          </li>
        </ul>
       
      </div>
    </nav>
  	<!-- breadcrumb end -->





<!-- container start -->
<div class="container">
	<!-- col start -->
	<div class="row">
		<div class="col-md-12">
			<h5>Find the best public sports facilities near by you</h5>
		</div>
	</div>
	<!-- col end -->
	<div class="row">
		<div class="col-md-12">
			<div id="map" style="width: 100%; height: 600px;"></div>
		</div>
	</div>

</div>
<!-- container end -->
<script src="../js/jquery-3.6.0.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=226c8fcd0301bbaab162a7f83afe082b"></script>

<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(36.59518931, 127.2843763), // 지도의 중심좌표
		level : 13
	// 지도의 확대 레벨  
	};
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	function Initialization(_map) {
		map = _map;
	}

	$.ajax({
		url : 'project/korea_map/final_korea_shape.json',
		type : 'GET',
		dataType : 'json',
		error : function() {
			alert('error!')
		},
		success : function(json) {
			console.log(json);
			var data = json.features;
			var name = ''; //행정구 명
			var code = '';
			$.each(data, function(index, val) {
				name = val.properties.loc_nm;
				code = val.properties.loc_cd;
				if (val.geometry.type == "MultiPolygon") {
					displayArea(name, code, val.geometry.coordinates, true);

				} else {
					displayArea(name, code, val.geometry.coordinates, false);

				}
			} );
		}
	});

	function makePolygon(coordinates) {
		var polygonPath = [];

		$.each(coordinates[0], function(index, coordinate) {
			polygonPath
					.push(new kakao.maps.LatLng(coordinate[1], coordinate[0]));
		});

		return new kakao.maps.Polygon({
			path : polygonPath,
			strokeWeight : 1,
			strokeColor : '#004c80',
			strokeOpacity : 0.8,
			strokeStyle : 'longdash',
			fillColor : '#'
					+ Math.floor(Math.random() * 16777215).toString(16)
							.padStart(6, '0'),
			fillOpacity : 0.2
		});
	}

	function makeMultiPolygon(coordinates) {
		var polygonPath = [];

		$.each(coordinates, function(index, val2) {
			var coordinates2 = [];

			$.each(val2[0], function(index2, coordinate) {
				coordinates2.push(new kakao.maps.LatLng(coordinate[1],
						coordinate[0]));
			});

			polygonPath.push(coordinates2);
		});

		return new kakao.maps.Polygon({
			path : polygonPath,
			strokeWeight : 1,
			strokeColor : '#004c80',
			strokeOpacity : 0.8,
			strokeStyle : 'longdash',
			fillColor : '#'
					+ Math.floor(Math.random() * 16777215).toString(16)
							.padStart(6, '0'),
			fillOpacity : 0.2
		});
	}

	// params : 행정구 명, 도로명 코드, 좌표, 멀티폴리곤 유무
	function displayArea(name, code, coordinates, multi) {
		var polygon;
		if (multi) {
			polygon = makeMultiPolygon(coordinates);
			polygon.setMap(map);
		} else {
			polygon = makePolygon(coordinates);
			polygon.setMap(map);
		}

		// 다각형에 마우스오버 이벤트가 발생했을 때 변경할 채우기 옵션입니다
		var mouseoverOption = {
			fillColor : '#EFFFED', // 채우기 색깔입니다
			fillOpacity : 0.8
		// 채우기 불투명도 입니다        
		};

		// 다각형에 마우스아웃 이벤트가 발생했을 때 변경할 채우기 옵션입니다
		var mouseoutOption = {
			fillColor : '#'
					+ Math.floor(Math.random() * 16777215).toString(16)
							.padStart(6, '0'), // 채우기 색깔입니다 
			fillOpacity : 0.7
		// 채우기 불투명도 입니다        
		};

		// 다각형에 마우스오버 이벤트를 등록합니다
		kakao.maps.event.addListener(polygon, 'mouseover', function() {

			// 다각형의 채우기 옵션을 변경합니다
			polygon.setOptions(mouseoverOption);

		});

		//다각형엥 마우스아웃 이벤트를 등록합니다.
		kakao.maps.event.addListener(polygon, 'mouseout', function() {

			// 다각형의 채우기 옵션을 변경합니다
			polygon.setOptions(mouseoutOption);

		});

		kakao.maps.event.addListener(polygon, 'click', function() {

			// 다각형의 채우기 옵션을 변경합니다
			polygon.setOptions(mouseoutOption);
		});

		// 다각형에 클릭 이벤트를 등록합니다
		var downCount = 0;
		kakao.maps.event.addListener(polygon, 'click', function() {
		location.href = "../../test/search/list.jsp?localcode="+code+"&localname="+name;
		
		});
	}
</script>

<%@ include file="./inc/footer.jsp"%>