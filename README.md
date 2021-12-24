# figma 주소

백엔드(이클립스 코드) : [백엔드 코드](https://www.figma.com/file/wopIL5BBgMOJZpkJP9LwWj/cy?node-id=0%3A1)   
프론트엔드(실행화면 및 스케치) : [프론트엔드](https://www.figma.com/file/HQ5v1nr5u8iiX57ILyfofI/cyworld?node-id=0%3A1)   


# 싸이월드 스타일 게시판 프로그램 

# 2021-12-23

## 할일 

### 자바 스크립트로 tab 이동 구현 (반복분 써서)

### 다이어리 캘린더 어떻게 적용할지 

### 왼쪽 사이드에 어떻게 만들지 

### 데이터 입력받고 나서 form 태그 사용시에 어떻게 기존 화면으로 돌아갈 건지
문제점 : 메인 페이지에서 tab 이동으로 인해 특정 탭 안에 include 되어있음. 근데 글 등록 후 컨트롤러에서 다시 이동할 경우에 특정 페이지로 이동하면, tab 안에 들어있는게 아니라 해당하는 페이지 전체가 출력되어버림. tab 구조에 대해서 생각을 더 해봐야하고, 아니면 사진 등록을 제외하고는 모두 ajax 로 바꿔야할 것 같음. 
글 등록 후 해당 게시판 페이지가 아니라, 메인 페이지로 가게끔 하면 현재 구조로는 문제가 없는데 좀 어색함. 현재 페이지가 그대로 다시 로드되야 하는데 말이지 

# 작업일지

# 12.23 

1. 방명록 기본틀
2. 방명록에 user_no 필요, 하지만 header에 login 정보가 없어 user_no를 찾을수가 없었음
3. 그리하여 UserDao에 user_no를 찾는 메소드를 생성
![12 23 회원번호 찾기 코드](https://user-images.githubusercontent.com/88937233/147216452-2e058963-937d-4da6-9cb2-97961f29d22f.png)
4. logInController에 로그인 세션 작성

![세션](https://user-images.githubusercontent.com/88937233/147216706-6158a024-bbe9-480f-8547-c8627212a4a0.png)

# 12.24

1. DB에 날짜가 자동으로 찍히지 않아 date컬럼에 now()를 설정
![DB](https://user-images.githubusercontent.com/88937233/147321237-8d64b0a4-2b52-4070-95b2-5b296e9c855a.png)

2. 방명록 작성하면 DB에 저장완료 
![방명록작성확인](https://user-images.githubusercontent.com/88937233/147321338-c900443d-8601-45e4-b215-2c8ee4d300dd.png)

3.
