# :pushpin: AILA
> 데이터 시각화로 지원하는 스마트 의사결정 서비스
>> 기업의 필요성을 바탕으로 리뷰 정보와 트랜드 정보, 뉴스 정보를 종합적으로 제공하는 정보 가시화 서비스

</br>

## 1. 제작 기간 & 참여 인원
- 2024년 02월 5일 ~ 2024년 4월 1일
- 팀 프로젝트
- 박지승, 이은희, 조재현, 임영주, 김종찬

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

## 4. 핵심 기능
기업 맞춤 리뷰 데이터 분석 정보 제공 
게시판과 채팅을 통한 실시간 정보 공유  
맞춤 대출 서비스 소개


<details>
<summary><b>핵심 기능 설명 펼치기</b></summary>
<div markdown="1">

### 4.1. 전체 흐름

![image](https://github.com/SMHRD-2021-KDT-AI-16/AILA-Repo/assets/152379672/eadf7276-ea1a-44af-bd79-fc1b00dda354)


### 4.2. 사용자 요청

- **기업의 필요성에 따른 리뷰 데이터 분석결과**
  - 기업이 원하는 품목에 관한 리뷰데이터 분석결과를 차트로 가시화
<img src="https://github.com/SMHRD-2021-KDT-AI-16/AILA-Repo/assets/152379672/4e5d5e6e-7e96-42e4-9858-3ba783664e1a" width="450px" height="300px" title="px(픽셀) 크기 설정"></img><br/>
- **식품인기검색어TOP10과 인기검색어 관한 연관검색어 검색량 날씨API를 가시화**
  - Openweathermap에서 지방별 날씨를 시각화
  - 일간 인기검색어를 네이버API에서 가져오고 그에 관련된 연관검색어 검색량을 데이터 베이스에 저장
  - 데이터 베이스에서 가져온 연관검색어 검색량을 ChartJS로 가시화
<img src="https://github.com/SMHRD-2021-KDT-AI-16/AILA-Repo/assets/152379672/6ba65855-acca-48dc-a03f-e39d02b1b267" width="450px" height="300px" title="px(픽셀) 크기 설정"></img><br/>
- **일간검색어TOP10과 검색어와관련된 뉴스링크**
  - 구글 API에서 일간 검색어 TOP10을 데이터 베이스에 저장
  - 데이터 베이스에서 일간 검색어 TOP10을 이용하여 네이버에 검색 후 뉴스 탭에서 뉴스 링크를 크롤링
  - 일간 검색어 TOP10 클릭시 해당 검색어 관련 뉴스 타이틀 TOP10을 가시화
  - 뉴스 타이틀 클릭시 해당 뉴스 페이지로 이동
  - <img src="https://github.com/SMHRD-2021-KDT-AI-16/AILA-Repo/assets/152379672/cd9b783f-1ecf-46f5-ab7b-2f30030e056f" width="450px" height="300px" title="px(픽셀) 크기 설정"></img><br/>
### 4.3. Controller

- **요청 처리**
  - 화면에서 요청된 데이터 값을 Service로 전달해줍니다.

- **결과 응답**
  - Service 계층에서 넘어온 로직 처리 결과를 jsp로 전달해줍니다.

### 4.4. Service

- **JsonArray / text/plain 방식으로 데이터 변환** 
  - 데이터 베이스에서 받아온 데이터를 jsp파일에서 사용할 수 있게 하기 위해 데이터를 변환합니다.

### 4.5. DAO



</div>
</details>

</br>

## 5. 트러블 슈팅
<details>
<summary>String값을 화면으로 내보낼 때 명령어로 인식되는 문제</summary>
<div markdown="1">

- String값을 request객체에 담아 javascript로 보내면 명령어로 인식하여 오류 발생
- json으로 파싱하여 해결.

</div>
</details>

<details>
<summary>GitHub File 복제시 서버 오류 문제</summary>
<div markdown="1">
  
  - TomcatServer 삭제 후 Server 재설정으로 해결.
  
</div>
</details>

</br>

## 6. 회고 / 느낀점
>
