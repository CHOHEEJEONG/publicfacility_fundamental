<!doctype html>
<%@ page pageEncoding="utf-8" %>
    <%@ include file="../inc/header.jsp" %>

        <!-- breadcrumb start -->
        <div class="jumbotron jumbotron-fluid" style="padding: 30px">
            <div class="container">
                <h1 class="display-4 font-italic " id="bold">Where is Public
                    Sports Facility?</h1>
            </div>
        </div>
        <!-- breadcrumb end -->


        <head>
            <script src="../js/jquery-3.6.0.js"></script>
            <script type="text/javascript"
                src="//dapi.kakao.com/v2/maps/sdk.js?appkey=226c8fcd0301bbaab162a7f83afe082b"></script>
            <meta charset="utf-8">

            <style>
                #mapwrap {
                    position: relative;
                    overflow: hidden;
                }

                .category,
                .category * {
                    margin: 0;
                    padding: 0;
                    color: #000;
                }

                .category {
                    position: absolute;
                    overflow: hidden;
                    top: 10px;
                    left: 10px;
                    width: 310px;
                    height: 100px;
                    z-index: 10;
                    border: 1px solid black;
                    font-family: 'Malgun Gothic', '맑은 고딕', sans-serif;
                    font-size: 12px;
                    text-align: center;
                    background-color: #fff;
                }

                .category .menu_selected {
                    background: #FF5F4A;
                    color: #fff;
                    border-left: 1px solid #915B2F;
                    border-right: 1px solid #915B2F;
                    margin: 0 -1px;
                }

                .category li {
                    list-style: none;
                    float: left;
                    width: 50px;
                    height: 45px;
                    padding-top: 5px;
                    cursor: pointer;
                }

                .category .ico_comm {
                    display: block;
                    margin: 0 auto 2px;
                }

                .category .ico_all {
                    width: 22px;
                    height: 26px;
                    background: url('../project/mark/css_sprites_resize.png') -10px -10px;
                }

                .category .ico_badmin {
                    width: 22px;
                    height: 26px;
                    background: url('../project/mark/css_sprites_resize.png') -52px -10px;
                }

                .category .ico_baseball {
                    width: 22px;
                    height: 26px;
                    background: url('../project/mark/css_sprites_resize.png') -94px -10px;
                }

                .category .ico_basket {
                    width: 22px;
                    height: 26px;
                    background: url('../project/mark/css_sprites_resize.png') -10px -56px;
                }

                .category .ico_camping {
                    width: 22px;
                    height: 26px;
                    background: url('../project/mark/css_sprites_resize.png') -52px -56px;
                }

                .category .ico_football {
                    width: 22px;
                    height: 26px;
                    background: url('../project/mark/css_sprites_resize.png') -94px -56px;
                }

                .category .ico_footsal {
                    width: 22px;
                    height: 26px;
                    background: url('../project/mark/css_sprites_resize.png') -136px -10px;
                }

                .category .ico_golf {
                    width: 22px;
                    height: 26px;
                    background: url('../project/mark/css_sprites_resize.png') -136px -56px;
                }

                .category .ico_gym {
                    width: 22px;
                    height: 26px;
                    background: url('../project/mark/css_sprites_resize.png') -10px -102px;
                }

                .category .ico_multiUse {
                    width: 22px;
                    height: 26px;
                    background: url('../project/mark/css_sprites_resize.png') -52px -102px;
                }

                .category .ico_soccer {
                    width: 22px;
                    height: 26px;
                    background: url('../project/mark/css_sprites_resize.png') -94px -102px;
                }

                .category .ico_tennis {
                    width: 22px;
                    height: 26px;
                    background: url('../project/mark/css_sprites_resize.png') -136px -102px;
                }
                
            </style>
        </head>

        <body>
            <!-- container start -->
            <!-- 지도와 리스트 정보가 표시될 col start -->
            <div class="container" >
                <div class="row" style="font-size : 20px ; width : 90%">
                    <div class="col" id="addr" style="font-weight : bold; font-size : 25px ; width : 50%"></div>	<!-- 검색할 시/도 공공시설 -->
                    	<!--검색결과 총 건수  -->
                    <div class="col" id="count" style="text-align : right"></div>
                    <div id="filterNone" >&nbsp중 결과 없음</div>
                    <div id="filterCount" ></div>
                </div>
            </div>
            <!-- 지도와 리스트 정보가 표시될 col end -->


            <div class="container px-lg-5 mx-auto" style="margin : 10px 0px">
                <div class="row mx-lg-n5" style="width : 100% ; height : 650px">
                    <!-- 지도가 표시될 div start-->
                    <div id="map" class="col py-3 px-lg-5 border bg-light"  >
                        <div id="mapwrap" >
                            <div style="width: 100%; height: 600px"></div>
                            <!-- 지도 위에 표시될 마커 카테고리 -->
                            <div class="category" id="sel">
                                <ul>
                                    <li id="allMenu" onclick="changeMarker('all');map.setLevel(10);"><span
                                            class="ico_comm ico_all"></span> 전체
                                    <li id="golfMenu" onclick="changeMarker('golf');map.setLevel(10);"><span
                                            class="ico_comm ico_golf"></span> 골프
                                    <li id="basketMenu" onclick="changeMarker('basket');map.setLevel(10);"><span
                                            class="ico_comm ico_basket"></span> 농구
                                    <li id="multiUseMenu" onclick="changeMarker('multiUse');map.setLevel(10);"><span
                                            class="ico_comm ico_multiUse"></span> 경기장
                                    <li id="badminMenu" onclick="changeMarker('badmin');map.setLevel(10);"><span
                                            class="ico_comm ico_badmin"></span> 배드맨턴
                                    <li id="baseballMenu" onclick="changeMarker('baseball');map.setLevel(10);"><span
                                            class="ico_comm ico_baseball"></span> 야구
                                    <li id="footballMenu" onclick="changeMarker('football');map.setLevel(10);"><span
                                            class="ico_comm ico_football"></span> 족구
                                    <li id="gymMenu" onclick="changeMarker('gym');map.setLevel(10);"><span
                                            class="ico_comm ico_gym"></span> 체육관
                                    <li id="soccerMenu" onclick="changeMarker('soccer');map.setLevel(10);"><span
                                            class="ico_comm ico_soccer"></span> 축구
                                    <li id="campingMenu" onclick="changeMarker('camping');map.setLevel(10);"><span
                                            class="ico_comm ico_camping"></span> 캠핑
                                    <li id="tennisMenu" onclick="changeMarker('tennis');map.setLevel(10);"><span
                                            class="ico_comm ico_tennis"></span> 테니스
                                    <li id="footsalMenu" onclick="changeMarker('footsal');map.setLevel(10);"><span
                                            class="ico_comm ico_footsal"></span> 풋살</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- 지도가 표시될 div end-->


                    <!-- 리스트 표시될 div start-->
                    <div class="col bg-light" style="width:320px; padding:0;">	

                        <div class="nav justify-content-end" >
                            <div class="list-group" style="overflow: auto; width: 100%; height: 670px; border : 1px solid silver">

                                <div id='HtmlList'></div>




                            </div>
                        </div>
                    </div>
                    <!-- 리스트 표시될 div end-->
                </div>
            </div>


         <script>
    var Check = location.href;
    var checkCenter = Check.split("=")[1];
    var mapContainer = document.getElementById('map')// 지도를 표시할 div  
    switch (checkCenter) {
        case '11': checkmap = new kakao.maps.LatLng(37.55179806924573, 126.98986980793178);
            break;
        case '21': checkmap = new kakao.maps.LatLng(35.16212400103579, 129.047757759559);
            break;
        case '22': checkmap = new kakao.maps.LatLng(35.825188230874495, 128.5670409325588);
            break;
        case '23': checkmap = new kakao.maps.LatLng(37.50260839865224, 126.66610090247079);
            break;
        case '24': checkmap = new kakao.maps.LatLng(35.15422674499753, 126.83487119648517);
            break;
        case '25': checkmap = new kakao.maps.LatLng(37.339900401195976, 127.39703737811574);
            break;
        case '26': checkmap = new kakao.maps.LatLng(35.545209912591886, 129.25467338727785);
            break;
        case '29': checkmap = new kakao.maps.LatLng(36.56236386365618, 127.2567513019287);
            break;
        case '31': checkmap = new kakao.maps.LatLng(37.586113055675206, 127.09301162933102);
            break;
        case '32': checkmap = new kakao.maps.LatLng(37.80046190328578, 128.27463560567378);
            break;
        case '33': checkmap = new kakao.maps.LatLng(36.68236062118246, 127.84040489531188);
            break;
        case '34': checkmap = new kakao.maps.LatLng(36.55810050557958, 126.87332800215337);
            break;
        case '35': checkmap = new kakao.maps.LatLng(35.728309862490654, 127.13984591660557);
            break;
        case '36': checkmap = new kakao.maps.LatLng(34.95290265867075, 126.85079147460186);
            break;
        case '37': checkmap = new kakao.maps.LatLng(36.294796646659044, 128.85771919876842);
            break;
        case '38': checkmap = new kakao.maps.LatLng(35.32829075242766, 128.28652178806226);
            break;
        case '39': checkmap = new kakao.maps.LatLng(33.3753564031499, 126.5426591164497);
            break;
        default: checkmap = new kakao.maps.LatLng(37.498004414546934, 127.02770621963765);
    };
    mapOption = {
        center: checkmap, // 지도의 중심좌표 
        level: 10 // 지도의 확대 레벨 


    };

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    var golfPositions = [];
    var basketPositions = [];
    var multiUsePositions = [];
    var badminPositions = [];
    var baseballPositions = [];
    var footballPositions = [];
    var gymPositions = [];
    var soccerPositions = [];
    var campingPositions = [];
    var tennisPositions = [];
    var footsalPositions = [];

    $.getJSON('../project/final_PublicFacility (2).json', function (json) {
        const ArrayofEverything = json.publicfacility;
        nameArray = [];
        typeArray = [];
        addr1Array = [];
        addr2Array = [];
        telArray = [];
        addrArray = [];
        indexArray = [];

        LatArray = [];
        LngArray = [];

        OffDayArray = [];
        DayOpenTImeArray = [];
        DayEndTimeArray = [];
        EndOpenTimeArray = [];
        EndEndTimeArray = [];
        CapacityArray = [];
        SizeArray = [];
        Internal_InfoArray = [];
        Regi_MethodArray = [];
        ImageArray = [];

        for (const data of ArrayofEverything) {
            fname = data.Facility_nm;
            name = data.Location_nm;
            lat = data.Lat;
            lng = data.Lng;
            type = data.Facility_Type;
            addr1 = data.Loc_Address;
            addr2 = data.Loc_New_Address;
            tel = data.POC_num;
            address1_code = data.address1_code;
            addr = data.address1;

            OffDay = data.OffDay;
            DayOpenTIme = data.DayOpenTIme;
            DayEndTime = data.DayEndTime;
            EndOpenTime = data.EndOpenTime;
            EndEndTime = data.EndEndTime;
            Capacity = data.Capacity;
            Size = data.Size;
            Internal_Info = data.Internal_Info;
            Regi_Method = data.Regi_Method;
            Image = data.Image;

            index = data.No;
            // 카테고리별 마크 분류
            switch (type) {
                case '골프장': golfPositions.push(new kakao.maps.LatLng(lat, lng));
                    break;
                case '농구장': basketPositions.push(new kakao.maps.LatLng(lat, lng));
                    break;
                case '다목적경기장': multiUsePositions.push(new kakao.maps.LatLng(lat, lng));
                    break;
                case '배드맨턴장': badminPositions.push(new kakao.maps.LatLng(lat, lng));
                    break;
                case '야구장': baseballPositions.push(new kakao.maps.LatLng(lat, lng));
                    break;
                case '족구장': footballPositions.push(new kakao.maps.LatLng(lat, lng));
                    break;
                case '체육관': gymPositions.push(new kakao.maps.LatLng(lat, lng));
                    break;
                case '축구장': soccerPositions.push(new kakao.maps.LatLng(lat, lng));
                    break;
                case '캠핑장': campingPositions.push(new kakao.maps.LatLng(lat, lng));
                    break;
                case '테니스장': tennisPositions.push(new kakao.maps.LatLng(lat, lng));
                    break;
                case '풋살경기장': footsalPositions.push(new kakao.maps.LatLng(lat, lng));
                    break;
            } //switch end


            // 시/도에 맞는 데이터 추출
            if (checkCenter === address1_code) {
                nameArray.push(fname);
                typeArray.push(type);
                addr1Array.push(addr1);
                addr2Array.push(addr2);
                telArray.push(tel);
                addrArray.push(addr);
                indexArray.push(index);

                LatArray.push(lat);
                LngArray.push(lng);
                OffDayArray.push(OffDay);
                DayOpenTImeArray.push(DayOpenTIme);
                DayEndTimeArray.push(DayEndTime);
                EndOpenTimeArray.push(EndOpenTime);
                EndEndTimeArray.push(EndEndTime);
                CapacityArray.push(Capacity);
                SizeArray.push(Size);
                Internal_InfoArray.push(Internal_Info);
                Regi_MethodArray.push(Regi_Method);
                ImageArray.push(Image);

            } //if

        } //for문 마지막

        $("#addr").append(addrArray[0] + " 공공체육시설");
        $("#count").append('검색 결과 : 총 ' + indexArray.length + '건'); 

        //리스트 클릭시 카드 생성
        for (var a in indexArray) {

        	HtmlList = '<div class="list-group-item list-group-item-action" id="insertAjax' + indexArray[a] + '">'
            HtmlList += '<div class="d-flex w-100 justify-content-between">'
            HtmlList += '<h5 class="mb-1" id="listFacility_name"> <ul>' + nameArray[a] + '</ul></h5>'
            HtmlList += '<small id="listFacility_type"><ul> ' + typeArray[a] + ' </ul></small>'
            HtmlList += '</div>'
            HtmlList += '<p class="mb-1" id="listFacility_addr1"><ul>' + addr1Array[a] + '</ul></p>'
            HtmlList += '<p class="mb-1" id="listFacility_addr2"><ul>' + addr2Array[a] + '</ul></p>'
            HtmlList += '<small id="listFacility_tel"><ul>' + telArray[a] + '</ul></small>'
            HtmlList += '</div>'

            $("#HtmlList").append(HtmlList);
        } // for end

        for (const i of indexArray) {
            $("#insertAjax" + i).click(function () {
                $.ajax({
                    url: '../project/final_PublicFacility (2).json',
                    type: 'GET',
                    dataType: 'json',
                    data: { data: JSON.stringify("publicfacility") },
                    error: function () {
                        alert('error!')
                    },
                    success: function () {
                        map.setLevel(5);
                        //지도 포커스 이동
                        panTo(LatArray[indexArray.indexOf(i)], LngArray[indexArray.indexOf(i)]);

                        //클릭 된 리스트 정보
                        clickedListHtml = '<div id="insertAjax' + i + '">'
                        clickedListHtml += '<div class="card" >'
                        clickedListHtml += '<div class="card text-dark bg-light mb-3" >'
                        clickedListHtml += '<div class="card-body">'
                        clickedListHtml += '<div class="col" id="card-text"><p style="font-weight : bold; font-size : 20px">'+ nameArray[indexArray.indexOf(i)]
                                        +  '</p></div>'                        
                        clickedListHtml += '<ul class="list-group list-group-flush">'
                        clickedListHtml += '<p class="card-text">&nbsp&nbsp<i class="fa fa-clock-o" aria-hidden="true"></i>&nbsp&nbsp운영정보</p>'
                        clickedListHtml += '<li class="list-group-item">운영시간' 
                                        + '<br>평일 : ' + DayOpenTImeArray[indexArray.indexOf(i)]
                                        + ' - ' + DayEndTimeArray[indexArray.indexOf(i)] 
                                        + '<br>주말 : ' + EndOpenTimeArray[indexArray.indexOf(i)]
                                        + ' - ' + EndEndTimeArray[indexArray.indexOf(i)] + '</li>'
                        clickedListHtml += '<p class="card-text">&nbsp&nbsp<i class="fa fa-user-o" aria-hidden="true"></i>&nbsp&nbsp시설정보</p>'
                        clickedListHtml += '<li class="list-group-item">수용가능인원수 : ' + CapacityArray[indexArray.indexOf(i)]
                                        + '<br>면적 : ' + SizeArray[indexArray.indexOf(i)]
                                        + '<br>부대시설정보 : ' + Internal_InfoArray[indexArray.indexOf(i)]
                                        + '<br>신청방법 : ' + Regi_MethodArray[indexArray.indexOf(i)]
                                        + '<br>시설사진정보 : ' + ImageArray[indexArray.indexOf(i)] + '</li>'
                        clickedListHtml += '<p class="card-text">&nbsp&nbsp<i class="fa fa-phone" aria-hidden="true"></i>&nbsp&nbsp찾아오는 길</p>'
                        clickedListHtml += '<li class="list-group-item">' + addr1Array[indexArray.indexOf(i)]
                                        + '<br>' + addr2Array[indexArray.indexOf(i)]
                                        + '<br>' + telArray[indexArray.indexOf(i)] + '</li></ul></div></div></body></div>'

                        $("#insertAjax" + i).replaceWith(clickedListHtml);

                        //리스트 클릭시 카테고리 마커도 같이 변경
                        switch (typeArray[indexArray.indexOf(i)]) {
                            case '골프장': changeMarker('golf');
                                break;
                            case '농구장': changeMarker('basket');
                                break;
                            case '다목적경기장': changeMarker('multiUse');
                                break;
                            case '배드맨턴장': changeMarker('badmin');
                                break;
                            case '야구장': changeMarker('baseball');
                                break;
                            case '족구장': changeMarker('football');
                                break;
                            case '체육관': changeMarker('gym');
                                break;
                            case '축구장': changeMarker('soccer');
                                break;
                            case '캠핑장': changeMarker('camping');
                                break;
                            case '테니스장': changeMarker('tennis');
                                break;
                            case '풋살경기장': changeMarker('footsal');
                                break;
                        } //switch end
                    } // success end
                });//ajax end
            }) // click function end
        } // for loop end

        creategolfMarkers();
        createbasketMarkers();
        createmultiUseMarkers();
        createbadminMarkers();
        createbaseballMarkers();
        createfootballMarkers();
        creategymMarkers();
        createsoccerMarkers();
        createcampingMarkers();
        createtennisMarkers();
        createfootsalMarkers();
        $("#filterNone").hide();
        changeMarker('all'); // 지도에 골프장 마커가 보이도록 설정합니다    

    }) // end of getJSON


    var golfMarkers = [];
    var basketMarkers = [];
    var multiUseMarkers = [];
    var badminMarkers = [];
    var baseballMarkers = [];
    var footballMarkers = [];
    var gymMarkers = [];
    var soccerMarkers = [];
    var campingMarkers = [];
    var tennisMarkers = [];
    var footsalMarkers = [];

    var imageSize = new kakao.maps.Size(30, 30)
    var imageOption = { offset: new kakao.maps.Point(27, 69) };


    function panTo(a, b) {
        var moveLatLon = new kakao.maps.LatLng(a, b);
        map.panTo(moveLatLon);
    }

    // 좌표와 마커이미지를 받아 마커를 생성하여 리턴하는 함수입니다
    function createMarker(position, image) {
        var marker = new kakao.maps.Marker({
            position: position,
            image: image
        });
        

        
        
        return marker;
    }


    // 골프장 마커를 생성하고 골프장 마커 배열에 추가하는 함수입니다
    function creategolfMarkers() {
        for (var i = 0; i < golfPositions.length; i++) {
            var imageSrc = '../project/mark/골프장.png'
            // 마커이미지와 마커를 생성합니다
            var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
                marker = createMarker(golfPositions[i], markerImage);
            // 생성된 마커를 골프장 마커 배열에 추가합니다
            golfMarkers.push(marker);
        }
    }


    function createbasketMarkers() {
        for (var i = 0; i < basketPositions.length; i++) {
            var imageSrc = '../project/mark/농구장.png'
            var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
                marker = createMarker(basketPositions[i], markerImage);
            basketMarkers.push(marker);
        }
    }

    function createmultiUseMarkers() {
        for (var i = 0; i < multiUsePositions.length; i++) {
            var imageSrc = '../project/mark/다목적경기장.png'
            var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
                marker = createMarker(multiUsePositions[i], markerImage);
            multiUseMarkers.push(marker);
        }
    }

    function createbadminMarkers() {
        for (var i = 0; i < badminPositions.length; i++) {
            var imageSrc = '../project/mark/배드맨턴장.png'
            var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
                marker = createMarker(badminPositions[i], markerImage);
            badminMarkers.push(marker);
        }
    }

    function createbaseballMarkers() {
        for (var i = 0; i < baseballPositions.length; i++) {
            var imageSrc = '../project/mark/야구장.png'
            var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
                marker = createMarker(baseballPositions[i], markerImage);
            baseballMarkers.push(marker);
        }
    }

    function createfootballMarkers() {
        for (var i = 0; i < footballPositions.length; i++) {
            var imageSrc = '../project/mark/족구장.png'
            var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
                marker = createMarker(footballPositions[i], markerImage);
            footballMarkers.push(marker);
        }
    }

    function creategymMarkers() {
        for (var i = 0; i < gymPositions.length; i++) {
            var imageSrc = '../project/mark/체육관.png'
            var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
                marker = createMarker(gymPositions[i], markerImage);
            gymMarkers.push(marker);
        }
    }

    function createsoccerMarkers() {
        for (var i = 0; i < soccerPositions.length; i++) {
            var imageSrc = '../project/mark/축구장.png'
            var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
                marker = createMarker(soccerPositions[i], markerImage);
            soccerMarkers.push(marker);
        }
    }

    function createcampingMarkers() {
        for (var i = 0; i < campingPositions.length; i++) {
            var imageSrc = '../project/mark/캠핑장.png'
            var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
                marker = createMarker(campingPositions[i], markerImage);
            campingMarkers.push(marker);
        }
    }

    function createtennisMarkers() {
        for (var i = 0; i < tennisPositions.length; i++) {
            var imageSrc = '../project/mark/테니스장.png'
            var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
                marker = createMarker(tennisPositions[i], markerImage);
            tennisMarkers.push(marker);
        }
    }

    function createfootsalMarkers() {
        for (var i = 0; i < footsalPositions.length; i++) {
            var imageSrc = '../project/mark/풋살경기장.png'
            var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
                marker = createMarker(footsalPositions[i], markerImage);
            footsalMarkers.push(marker);
        }
    }


    //마커들 지도 위에 생성합니다.
    function setgolfMarker(map) {
        for (var i = 0; i < golfMarkers.length; i++) {
            golfMarkers[i].setMap(map);
        }
    }
    function setbasketMarker(map) {
        for (var i = 0; i < basketMarkers.length; i++) {
            basketMarkers[i].setMap(map);
        }
    }
    function setmultiUseMarker(map) {
        for (var i = 0; i < multiUseMarkers.length; i++) {
            multiUseMarkers[i].setMap(map);
        }
    }
    function setbadminMarker(map) {
        for (var i = 0; i < badminMarkers.length; i++) {
            badminMarkers[i].setMap(map);
        }
    }
    function setbaseballMarker(map) {
        for (var i = 0; i < baseballMarkers.length; i++) {
            baseballMarkers[i].setMap(map);
        }
    }
    function setfootballMarker(map) {
        for (var i = 0; i < footballMarkers.length; i++) {
            footballMarkers[i].setMap(map);
        }
    }
    function setgymMarker(map) {
        for (var i = 0; i < gymMarkers.length; i++) {
            gymMarkers[i].setMap(map);
        }
    }
    function setsoccerMarker(map) {
        for (var i = 0; i < soccerMarkers.length; i++) {
            soccerMarkers[i].setMap(map);
        }
    }
    function setcampingMarker(map) {
        for (var i = 0; i < campingMarkers.length; i++) {
            campingMarkers[i].setMap(map);
        }
    }
    function settennisMarker(map) {
        for (var i = 0; i < tennisMarkers.length; i++) {
            tennisMarkers[i].setMap(map);
        }
    }
    function setfootsalMarker(map) {
        for (var i = 0; i < footsalMarkers.length; i++) {
            footsalMarkers[i].setMap(map);
        }
    }

    function setCoffeeMarker(map) {
        for (var i = 0; i < coffeeMarkers.length; i++) {
            coffeeMarkers[i].setMap(map);
        }
    }


    function markerInit() {
        allMenu.className = '';
        golfMenu.className = '';
        basketMenu.className = '';
        multiUseMenu.className = '';
        badminMenu.className = '';
        baseballMenu.className = '';
        footballMenu.className = '';
        gymMenu.className = '';
        soccerMenu.className = '';
        campingMenu.className = '';
        tennisMenu.className = '';
        footsalMenu.className = '';
        setgolfMarker(null);
        setbasketMarker(null);
        setmultiUseMarker(null);
        setbadminMarker(null);
        setbaseballMarker(null);
        setfootballMarker(null);
        setgymMarker(null);
        setsoccerMarker(null);
        setcampingMarker(null);
        settennisMarker(null);
        setfootsalMarker(null);
    }


    function markerSearch(emptyList) {
        for (var i of indexArray) {
            $("#insertAjax" + i).show();
        }
        for (var j of emptyList) {
            $("#insertAjax" + j).hide();
        }
        num = indexArray.length - emptyList.length;
        if (num == 0) {
            $("#filterNone").show();
            $("#filterCount").hide();
        }else {
        	$("#filterNone").hide();
            $("#filterCount").replaceWith('<div id="filterCount" >&nbsp 중 ' + num + '건</div>');
        }
    }


    // 카테고리를 클릭했을 때 type에 따라 카테고리의 스타일과 지도에 표시되는 마커를 변경합니다
    function changeMarker(type) {
        var allMenu = document.getElementById('allMenu');
        var golfMenu = document.getElementById('golfMenu');
        var basketMenu = document.getElementById('basketMenu');
        var multiUseMenu = document.getElementById('multiUseMenu');
        var badminMenu = document.getElementById('badminMenu');
        var baseballMenu = document.getElementById('baseballMenu');
        var footballMenu = document.getElementById('footballMenu');
        var gymMenu = document.getElementById('gymMenu');
        var soccerMenu = document.getElementById('soccerMenu');
        var campingMenu = document.getElementById('campingMenu');
        var tennisMenu = document.getElementById('tennisMenu');
        var footsalMenu = document.getElementById('footsalMenu');

        // 골프장 카테고리가 클릭됐을 때
        if (type === 'all') {
            markerInit();
            allMenu.className = 'menu_selected';
            setgolfMarker(map);
            setbasketMarker(map);
            setmultiUseMarker(map);
            setbadminMarker(map);
            setbaseballMarker(map);
            setfootballMarker(map);
            setgymMarker(map);
            setsoccerMarker(map);
            setcampingMarker(map);
            settennisMarker(map);
            setfootsalMarker(map);
            for (var i of indexArray) {
                $("#insertAjax" + i).show();
            }
            $("#count").replaceWith('검색 결과 : 총 ' + indexArray.length + '건');
            $("#filterNone").hide();
            $("#filterCount").hide();

        } else if (type === 'golf') {
            markerInit();
            golfMenu.className = 'menu_selected';
            setgolfMarker(map);
            // 골프장 리스트만 표시하도록 설정합니다.
            emptyList = indexArray.filter(function (element) {
                return typeArray[indexArray.indexOf(element)] != '골프장'
            });
            markerSearch(emptyList)

        } else if (type === 'basket') {
            markerInit();
            basketMenu.className = 'menu_selected';
            setbasketMarker(map);
            // 농구장 리스트만 표시하도록 설정합니다.
            emptyList = indexArray.filter(function (element) {
                return typeArray[indexArray.indexOf(element)] != '농구장'
            });
            markerSearch(emptyList)

        } else if (type === 'multiUse') {
            markerInit();
            multiUseMenu.className = 'menu_selected';
            setmultiUseMarker(map);
            // 다목적경기장 리스트만 표시하도록 설정합니다.
            emptyList = indexArray.filter(function (element) {
                return typeArray[indexArray.indexOf(element)] != '다목적경기장'
            });
            markerSearch(emptyList)

        } else if (type === 'badmin') {
            markerInit();
            badminMenu.className = 'menu_selected';
            setbadminMarker(map);
            // 배드민턴 리스트만 표시하도록 설정합니다.
            emptyList = indexArray.filter(function (element) {
                return typeArray[indexArray.indexOf(element)] != '배드맨턴장'
            });
            markerSearch(emptyList)

        } else if (type === 'baseball') {
            markerInit();
            baseballMenu.className = 'menu_selected';
            setbaseballMarker(map);
            // 야구장 리스트만 표시하도록 설정합니다.
            emptyList = indexArray.filter(function (element) {
                return typeArray[indexArray.indexOf(element)] != '야구장'
            });
            markerSearch(emptyList)

        } else if (type === 'football') {
            markerInit();
            footballMenu.className = 'menu_selected';
            setfootballMarker(map);
            // 족구장 리스트만 표시하도록 설정합니다.
            emptyList = indexArray.filter(function (element) {
                return typeArray[indexArray.indexOf(element)] != '족구장'
            });
            markerSearch(emptyList)

        } else if (type === 'gym') {
            markerInit();
            gymMenu.className = 'menu_selected';
            setgymMarker(map);
            // 체육관 리스트만 표시하도록 설정합니다.
            emptyList = indexArray.filter(function (element) {
                return typeArray[indexArray.indexOf(element)] != '체육관'
            });
            markerSearch(emptyList)

        } else if (type === 'soccer') {
            markerInit();
            soccerMenu.className = 'menu_selected';
            setsoccerMarker(map);
            // 축구장 리스트만 표시하도록 설정합니다.
            emptyList = indexArray.filter(function (element) {
                return typeArray[indexArray.indexOf(element)] != '축구장'
            });
            markerSearch(emptyList)

        } else if (type === 'camping') {
            markerInit();
            campingMenu.className = 'menu_selected';
            setcampingMarker(map);
            // 캠핑장 리스트만 표시하도록 설정합니다.
            emptyList = indexArray.filter(function (element) {
                return typeArray[indexArray.indexOf(element)] != '캠핑장'
            });
            markerSearch(emptyList)

        } else if (type === 'tennis') {
            markerInit();
            tennisMenu.className = 'menu_selected';
            settennisMarker(map);
            // 테니스장 리스트만 표시하도록 설정합니다.
            emptyList = indexArray.filter(function (element) {
                return typeArray[indexArray.indexOf(element)] != '테니스장'
            });
            markerSearch(emptyList)

        } else if (type === 'footsal') {
            markerInit();
            footsalMenu.className = 'menu_selected';
            setfootsalMarker(map);
            // 풋살경기장 리스트만 표시하도록 설정합니다.
            emptyList = indexArray.filter(function (element) {
                return typeArray[indexArray.indexOf(element)] != '풋살경기장'
            });
            markerSearch(emptyList);
        }

    }

</script>
        </body>





        <%@ include file="../inc/footer.jsp" %>