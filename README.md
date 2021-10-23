# Public Sports Facility

### Kakao Maps API를 이용한 전국 공공 체육시설 웹 서비스 개발 *(2021.06.07 – 2021.06.16)*

#### 전국 체육 공공시설에 대한 위치와 상세한 정보를 시도별, 종목별로 얻을 수 있는 웹 서비스

<p align="center"><img width="50%" src="https://user-images.githubusercontent.com/83495586/138552063-c7c95062-96da-4ad8-9bda-e47b3d1b93cc.png"/></p>

#

### 영상
---
<p align="center"><img width="100%" src="https://user-images.githubusercontent.com/83495586/138554857-ca1d981a-a3a8-48e8-8ce4-f7d8bfccaf0b.gif"/></p>

### 사용기술
---
        데이터 : 공공데이터포털
        
        Kakao Maps API
        
        데이터 전처리 : PostgreSQL, QGIS
        
        서버 : Nginx, Apache Tomcat
        
        웹개발, 디자인 : JS, HTML, CSS, Bootstrap
        
        웹 반응성 : AJAX, JQuery, JSP

### 기능 
---
         홈에 전국 지도 위 폴리곤 형성, 폴리곤 클릭 시 해당 공공 체육시설 정보를 얻을 수 있는 페이지로 이동
         
         AJAX를 이용하여 url의 쿼리 요소를 시도별 localcode로 구분지어 사용자에게 시도별 정보 제공
         
         맵 위에 카테고리를 형성하여 종목별 공공시설 표시 및 종목별 마커 디자인 차별화
         
         카테고리 변경 시 맵 위의 마커 변경과 동시에 우측에 시설 정보 유형도 카테고리에 맞추어 생성
         
         시설 정보 리스트 중 특정 시설을 클릭하면 자세한 정보 카드가 생성됨
         
         시도별 전체 공공시설 개수와 종목별 공공시설 개수 표시
         
         특정 시설 혹은 카테고리 클릭에 따른 맵 레벨 설정
