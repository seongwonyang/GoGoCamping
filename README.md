# GoGoCamping(고고캠핑)
<p align="center"><img width="700" alt="GoGoCamping-Logo" src="https://user-images.githubusercontent.com/65536352/146703960-e96409f7-602a-4245-a5a6-4ff927906b5c.png"></p>

## 🚀 프로젝트 개요
### 프로젝트명 : GoGoCamping
- 캠핑용품 전문 브랜드를 모은 플랫폼형 쇼핑몰

### 프로젝트 목적 :
- 5개월 간의 교육 내용에 대한 복습
- SpringBoot를 활용한 프로젝트 경험
- 팀원들 간 협업을 통한 실무 능력 향상

### 팀명 : DevCamp(Developer + Camp) : 데브캠프
- 개발자들의 프로젝트 캠핑

### 팀원 및 구현 기능
- `김근영(소통리더)` / [kk-young](https://github.com/kk-young) : Main Developer / 서기(회의록) + 총무
- `신유라` / [Youra Shin](https://github.com/diverJenny) : Main Developer / 일정관리
- `양성원(팀장)` / [SeongWon Yang](https://github.com/seongwonyang) : Main Developer / 형상관리
- `이주형` / [juhyung96](https://github.com/juhyung96) : Main Developer / 형상관리
- `임세희` / [Sehee](https://github.com/liiims) : Main Developer / 서기(버전관리)
- `임지원` / [zheld12](https://github.com/zheld12) : Main Developer / 서기(이슈관리)

### 팀 규칙 :
- 쉬는시간 엄수 (매 시간 정각~15분)
- 야근 최소화 (할 땐 하고 놀 땐 놀자)
- 본인 파트 이슈 그때그때 기록해서 서기에게 보고
- 물음표로 끝나는 카톡 읽씹 금지
- 모르는 거 아는 척하지 않기 (좋은 멘토가 있으니 활용할 것)
- 병합은 가급적 다같이 있을 때 하기


## 🚀 [회의록](https://docs.google.com/document/d/1sh5bd2DbItSiBQMGIA5Vaq9O2Ggcr-6d_IWltDrYkM4/edit)
<!-- - [2021.12.08(수) 2차 회의록]() -->


## 🚀 개발기간 
2021.12.07 ~ 2021.12.30 (Official) : 교육기관 마감기한(3차 구현까지 완료)

## 🚀 개발환경 및 적용기술 
<img src="https://img.shields.io/badge/java-v1.8-007396?style=flat&logo=java&logoColor=blue"><br>
<img src="https://img.shields.io/badge/Spring--6DB33F?style=flat&logo=Spring"><br>
<img src="https://img.shields.io/badge/Spring Boot-v2.6.1-6DB33F?style=flat&logo=Spring Boot"><br>
<img src="https://img.shields.io/badge/Apache Tomcat-v8.5-F8DC75?style=flat&logo=Apache Tomcat"><br>
<img src="https://img.shields.io/badge/javascript-ES6+-F7DF1E?logo=javascript"><br>
<img src="https://img.shields.io/badge/git-v2.32.2-F05032?logo=git"><br>
<img src="https://img.shields.io/badge/Oracle-v11-F80000?style=flat&logo=Oracle&logoColor=red"><br>
<img src="https://img.shields.io/badge/HTML5-v5-E34F26?logo=HTML5"><br>
<img src="https://img.shields.io/badge/CSS3-v3-1572B6?logo=CSS3&logoColor=blue"><br>
<img src="https://img.shields.io/badge/Bootstrap-v4-7952B3?logo=Bootstrap"><br>
<img src="https://img.shields.io/badge/Eclipse IDE-v4-2C2255?logo=Eclipse IDE&logoColor=navy"><br>
<img src="http://img.shields.io/badge/GitHub--181717?style=flat&logo=github"><br>
<img src="https://img.shields.io/badge/Trello--0052CC?logo=Trello&logoColor=blue"><br>


## 🚀 요구사항

### 1차 구현 
  - 판매자
    - 판매자는 스토어(브랜드)를 등록한 후 상품을 등록하여 판매할 수 있다.
    - 판매자 회원가입 : 판매자 및 브랜드 정보를 입력하여 회원가입 신청을 한다.
    - 판매자 로그인 : 회원가입 시 입력한 판매자의 아이디와 비밀번호를 입력하여 로그인 한다.
    - 브랜드 정보 등록 : 회원가입 시 판매자 개인정보 입력 후 본인이 등록하고자 하는 브랜드 정보를 추가로 입력한다.

  - 구매자(회원)
    - 회원만 상품 구입이 가능하며 회원 정보로는 아이디, 비밀번호, 이름, 주소, 전화번호를 입력한다.
    - 회원가입 : 회원(구매자)의 정보를 입력하여 회원가입한다.
    - 로그인 : 아이디와 비밀번호를 입력하여 로그인한다. 로그인이 완료되면 메인페이지로 이동한다.
    - 아이디 찾기 : 회원의 이름과 이메일을 확인하여 화면에 아이디를 보여준다.
    - 비밀번호 찾기 : 회원가입시 입력한 이메일 정보를 통해 인증을 거친 후 , 비밀번호를 재설정 할 수 있다.
    
  - 관리자
    - 관리자는 브랜드 등록 승인과 구매 후기 등 댓글 관리가 가능하다.
    - 관리자 인증 : 관리자 전용 계정으로 로그인하면 인증이 이루어진다.
    - 판매자 가입 승인 : 판매자가 회원가입을 하면 관리자가 판매자 정보를 확인한 후, 가입을 승인한다.
  
  - 상품
    - 브랜드별 상품조회 : 메인페이지에서 브랜드별 상품 조회를 클릭하면 브랜드 별로 조회가 가능하다.
    - 카테고리별 상품조회 : 메인페이지에서 카테고리별 상품 조회를 클릭하면 상품의 카테고리 별로 조회가 가능하다.
    - 상품 검색 : 메인페이지에서 상품 검색을 하면 브랜드별, 카테고리별 통합 검색이 가능하다.

  
 ### 2차 구현 
  - 판매자
    - 상품등록 : 판매하고자 하는 상품의 정보를 입력 후 등록 신청을 한다.
    - 상품 정보 관리 : 판매자가 등록해놓은 상품의 목록을 조회한다.
    - 상품 정보 수정 : 판매자가 등록한 상품의 정보를 수정한다.
  - 구매자(회원)
    - 회원 정보 수정 : 비밀번호 확인 후, 회원정보를 수정할 수 있다.
    - 마이페이지 : 회원정보수정, 주문조회, 찜 목록, 장바구니 서비스를 이용할 수 있다.
    - 주문 조회 :자신이 주문한 상품의 주문내역을 조회할 수 있다.
  - 관리자
    - 상품 등록 승인 : 판매자가 상품을 등록하고, 관리자가 승인해야 상품이 등록된다.
  - 상품
    - 장바구니 : 회원은 상품을 장바구니에 담아둘 수 있고 장바구니에 담긴 상품의 총 합계 금액이 표기된다.
                장바구니에 담긴 상품을 일괄 또는 일부를 선택하여 구매가 가능하다.
    - 찜하기 : 회원은 관심 상품에 대해 찜을 할 수 있고 찜한 상품 목록을 볼 수 있다.
    - 상품 주문 : 회원은 상품을 주문할 수 있다.
                  상품 주문 시 배송 정보를 입력하고 결제를 하면 주문이 완료된다.
    - 주문 취소 : 구매자는 주문한 상품에 대해 상품 준비중 이하 단계에서 주문을 취소할 수 있다.
                  배송 출발, 또는 배송 중 상태에 따라 주문 취소가 불가능 할 수 있고,
                  이때 주문 취소가 아닌 환불이 가능하다.
    - 상품 상세페이지 : 판매자가 등록한 상품의 정보를 회원이 확인하고 구매, 찜, 장바구니 기능을 수행하는 페이지

 ### 3차 구현 
  - 판매자
    - 고객 문의 답변 : 고객이 등록한 문의에 대해 각 문의 사항별로 답변을 한다.
    - 주문 관리 : 현재 진행 중인 전체 주문 건에 대해 조회한다.
    - 판매 내역 확인 : 판매자가 등록한 상품에 대한 회원의 전체 구매 내역을 조회한다.
  - 구매자(회원)
    - 네이버 로그인 : 회원의 네이버 아이디 연동로그인을 통해 서비스 이용이 가능하다.
    - 카카오 로그인 : 회원의 카카오 아이디 연동로그인을 통해 서비스 이용이 가능하다.
  - 관리자
    - 고객 후기 관리 : 관리자는 상품 후기에 대해 삭제를 할 수 있는 권한이 있다.
  - 상품
    - 1대1 문의 : 고객은 문의 유형, 문의 사항을 작성하여 판매자에게 1대1로 문의할 수 있다.
                  판매자는 고객 문의에 대해 답변을 작성할 수 있다.
    - 상품 정보 문의 : 고객은 상품에 관련하여 판매자에게 상세페이지 하위의 댓글로 문의할 수 있다.
                      문의 글은 판매자에게만 공개, 비공개 설정이 가능하다.
                      판매자는 문의에 대한 답변을 댓글로 작성할 수 있다.
    - 교환 및 환불 문의 : 구매 고객은 구매한 상품에 대해 마이페이의 주문 상세내역에서 교환 및 환불 문의를 할 수 있다.
                        문의 시 교환/환불 유형을 선택하고 상세 내용 작성 및 사진을 첨부하여 문의할 수 있다.
                        판매자는 문의에 대해 교환/환불 가능 여부를 답변할 수 있다.
    - 구매 후기 작성 : 구매 고객은 상품 상세페이지의 하위에 구매 후기를 작성할 수 있다.
                      판매자는 구매 후기에 댓글을 달 수 있다.


## 🚀 개발 프로세스 및 설계
### UseCase Diagram

### Class Diagram

### [UI 설계](https://www.figma.com/file/XHo3oxMEyHXXmhclGGYBgI/GoGoCAMP?node-id=0%3A1)

### ERD


## 🚀 트러블슈팅

