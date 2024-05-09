# 📊 AILA(Artificial intelligence Insight Lens Assistant)
> 데이터 시각화로 지원하는 스마트 의사결정 서비스   
> 기업의 필요성을 바탕으로 리뷰 정보와 트랜드 정보, 뉴스 정보를 종합적으로 제공하는 정보 가시화 서비스   

</br>

## 1. 제작 기간 & 참여 인원
- 2024년 02월 5일 ~ 2024년 4월 1일
- 팀 프로젝트(기업 연계 프로젝트 - 멘토 : 그랑알파 컨설팅 김기현 대표)
- 프로젝트 과제: 리뷰 및 고객 분석을 통한 모 식품기업의 신제품 솔루션 서비스
- 참여 인원

| 이름 | 역할 |
|---|---|
| 박지승(팀장) |Back-end |
| 이은희(부팀장) |Front-end |
| 임영주 |Front-end |
| 조재현 |Back-end |
| 김종찬 |Back-end |


</br>

## 2. 사용 기술
#### `Back-end`
  - Java 17
  - Jsp/Servlet
  - Maven
  - mysql
  - Gson Library
  - MyBatis
  - Lombok
  - Python
  - Apache Tomcat 9.0
  - google trend API

#### `Front-end`
  - JS
  - Jquery
  - css
  - html
  - Chart.js
  - ZingChart

#### `IDE`
  - Eclipse
  - CoLab
  - Jupyter NoteBook

</br>

## 3. ERD 설계
![image](https://github.com/SMHRD-2021-KDT-AI-16/AILA-Repo/assets/152379672/bb46083e-1394-4c18-b856-33a8167c75c2)

## 4. 서비스 흐름도
![aila 서비스 흐름도](https://github.com/SMHRD-2021-KDT-AI-16/AILA-Repo/assets/144122046/0484eb6c-3681-4628-8512-50e72e8892e7)

## 5. 시스템 아키텍처
![image](https://github.com/SMHRD-2021-KDT-AI-16/AILA-Repo/assets/152379672/eadf7276-ea1a-44af-bd79-fc1b00dda354)

## 6. 핵심 기능
- 기업 맞춤 리뷰 데이터 분석 정보 제공
- 식품 분야 인기 검색어 정보를 통한 트렌드 확인


<details>
<summary><b>핵심 기능 설명 펼치기</b></summary>
<div markdown="1">

### 6.1. 식품 트렌드

![trend page](https://github.com/SMHRD-2021-KDT-AI-16/AILA-Repo/assets/144122046/cdc8154e-291a-4a37-9904-f375a142e829)
- 식품 인기검색어 TOP10과 인기검색어 관한 연관검색어 검색량 표시
  - 일간 인기검색어를 네이버 데이터랩 API에서 가져오고 그에 관련된 연관검색어 검색량을 데이터 베이스에 저장
  - 데이터 베이스에서 가져온 연관검색어 검색량을 ChartJS로 가시화
- Openweathermap API를 활용하여 전국 일기예보 구현(익일 0시 기준)

### 6.2. 리뷰 분석

<img src="https://github.com/SMHRD-2021-KDT-AI-16/AILA-Repo/assets/144122046/4c39e419-eb2c-46e1-8b08-00c0648414a6" width="450px"></img>
<img src="https://github.com/SMHRD-2021-KDT-AI-16/AILA-Repo/assets/144122046/48697310-9687-4d12-9301-40aab320e4cc" width="450px" height="231.7px"></img>
- 원하는 품목에 관한 리뷰데이터 분석결과를 차트로 가시화
- 자사몰/네이버/쿠팡 총 3개 채녈의 리뷰 분석 결과 비교 가능
  - ko-electra fine tuning을 활용하여 리뷰 데이터의 감정(긍정/부정) 분석을 진행
  - 긍정/부정 리뷰의 비율을 도넛 차트로 가시화
  - 월별 리뷰 갯수 추이를 통한 판매량 변화 분석
  - 긍정/부정 별 빈도수가 높은 키워드를 워드 클라우드와 막대 그래프로 시각화
  - 막대 그래프의 각 막대 클릭 시 해당 키워드가 포함된 전체 리뷰의 내용을 최대 3개 표시
    ![detail reviews](https://github.com/SMHRD-2021-KDT-AI-16/AILA-Repo/assets/144122046/2178f7d4-b90e-4d2f-829e-3f9a00938ab9)

### 6.3. 뉴스

![news page](https://github.com/SMHRD-2021-KDT-AI-16/AILA-Repo/assets/144122046/099d99ec-c320-45e5-b9d5-7a12cab483d2)
- 구글 API를 활용하여 일간 검색어 TOP10 표시
- 각 검색어 클릭 시 우측 화면에 해당 검색어 관련 뉴스 타이틀 TOP10을 표시
- 각 뉴스 타이틀 클릭 시 해당 기사로 이동

<!--  
### 6.2. 사용자 요청

- **기업의 필요성에 따른 리뷰 데이터 분석결과**
  - 기업이 원하는 품목에 관한 리뷰데이터 분석결과를 차트로 가시화<br>
    <img src="https://github.com/SMHRD-2021-KDT-AI-16/AILA-Repo/assets/152379672/4e5d5e6e-7e96-42e4-9858-3ba783664e1a" width="450px" height="300px" title="px(픽셀) 크기 설정"></img>
- **식품인기검색어TOP10과 인기검색어 관한 연관검색어 검색량 날씨API를 가시화**
  - Openweathermap에서 지방별 날씨를 시각화
  - 일간 인기검색어를 네이버API에서 가져오고 그에 관련된 연관검색어 검색량을 데이터 베이스에 저장
  - 데이터 베이스에서 가져온 연관검색어 검색량을 ChartJS로 가시화<br>
    <img src="https://github.com/SMHRD-2021-KDT-AI-16/AILA-Repo/assets/152379672/6ba65855-acca-48dc-a03f-e39d02b1b267" width="450px" height="300px" title="px(픽셀) 크기 설정"></img>
- **일간검색어TOP10과 검색어와관련된 뉴스링크**
  - 구글 API에서 일간 검색어 TOP10을 데이터 베이스에 저장
  - 데이터 베이스에서 일간 검색어 TOP10을 이용하여 네이버에 검색 후 뉴스 탭에서 뉴스 링크를 크롤링
  - 일간 검색어 TOP10 클릭시 해당 검색어 관련 뉴스 타이틀 TOP10을 가시화
  - 뉴스 타이틀 클릭시 해당 뉴스 페이지로 이동<br>
   <img src="https://github.com/SMHRD-2021-KDT-AI-16/AILA-Repo/assets/152379672/cd9b783f-1ecf-46f5-ab7b-2f30030e056f" width="450px" height="300px" title="px(픽셀) 크기 설정"></img>
### 6.3. Controller

- **요청 처리**
  - 화면에서 요청된 데이터 값을 Service로 전달해줍니다.

- **결과 응답**
  - Service 계층에서 넘어온 로직 처리 결과를 jsp로 전달해줍니다.

### 4.4. Service

- **JsonArray / text/plain 방식으로 데이터 변환** 
  - 데이터 베이스에서 받아온 데이터를 jsp파일에서 사용할 수 있게 하기 위해 데이터를 변환합니다.

### 4.5. DAO

-->

</div>
</details>

</br>

## 7. 프로젝트 시연
![실전프로젝트 시연 영상](https://github.com/SMHRD-2021-KDT-AI-16/AILA-Repo/assets/144122046/0808851f-6fb6-4c70-930e-4cbd25aff69b)

## 8. 트러블 슈팅

- GitHub File 복제시 서버 오류 문제  
  - TomcatServer 삭제 후 Server 재설정으로 해결.

- 리뷰 추이 차트 생성시 시간을 숫자로 인식하는 오류
  - 데이터베이스에서 가져온 String으로 되어있는 yyyy-mm 형식의 날짜를 request 객체에 담아 세션에 담는 경우, java script에서 사용을 할 때 문자열이 아닌 숫자로 인식을 하여 yyyy-mm의 형식이 아닌 yyyy숫자 빼기 mm의 형태로 인식을 하여 yyyy-mm의 날짜가 아닌 4자리 수의 숫자 형태로 나타남.
  - 이를 해결하기 위해 보내는 형식을 배열에 담는 것이 아닌 json형태로 키값에 따른 문자열로 받아오게 변경하는 형식으로 해결.

- 개발 히스토리의 부재로 인한 생산성 저하
  - 개발 중간중간 히스토리를 남기지 않고 진행을 하다가 오류가 생긴경우 히스토리가 없었기 때문에 모든 코드를 뜯어보며 오류가 생성된 원인을 찾기위해 너무 많은 시간을 소요하여 개발일정을 맞추지 못하는 경우가 생김.
  - 특정 부분의 개발을 하였을 경우 작업 중간중간 히스토리를 남기는 작업을 진행
  - 히스토리를 남긴 이후로 생산성이 증가

<!--
## 6. 회고 / 느낀점
>
-->
