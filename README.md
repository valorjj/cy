# figma 주소

백엔드(이클립스 코드) : [백엔드 코드](https://www.figma.com/file/wopIL5BBgMOJZpkJP9LwWj/cy?node-id=0%3A1)   
프론트엔드(실행화면 및 스케치) : [프론트엔드](https://www.figma.com/file/HQ5v1nr5u8iiX57ILyfofI/cyworld?node-id=0%3A1)   



# 싸이월드 스타일 게시판 프로그램 

# 2021-12-23



### 자바 스크립트로 tab 이동 구현 (반복분 써서)


1. 주어진 기간 내 실현 가능한 주제
2. jsp 수업 때 배운 내용 복습 및 활용


### 왼쪽 사이드에 어떻게 만들지 


1. 나만의 홈페이지 : 게시글, 사진 등록, ~~다이어리~~ 방명록 
2. 음악플레이어 [현재는 한곡만 가능]
3. 일촌 맺기
4. 랜덤 파도 타기[시도중]
5. ~~방문자 통계~~
6. ~~게시판 - 하위 게시판~~


# 작업일지

# 12.23 

1. 방명록 기본틀
2. 방명록에 user_no 필요, 하지만 header에 login 정보가 없어 user_no를 찾을수가 없었음
3. 그리하여 UserDao에 user_no를 찾는 메소드를 생성
![12 23 회원번호 찾기 코드](https://user-images.githubusercontent.com/88937233/147216452-2e058963-937d-4da6-9cb2-97961f29d22f.png)
4. logInController에 로그인 세션 작성

# db : 
![image](https://user-images.githubusercontent.com/30681841/147749308-b019206e-602a-4616-a40a-0fddf77a7193.png)

# front : 

1. tab 이벤트 + 모든 div 에 ajax 걸다가 5일 날리고 취소
2. 모든 페이지를 직접 다 만듦



![세션](https://user-images.githubusercontent.com/88937233/147216706-6158a024-bbe9-480f-8547-c8627212a4a0.png)


# 12.24

팀원 | 역할분담 |
--- | --- |
김태호 | 접속 페이지, 프론트엔트 전반 |                  
신우현 | 게시물, 사진첩 |
조지훈 | 방명록 |
김정진 | 로그인 및 회원가입, 접속 페이지, 메인페이지, 헤더, ~~다이어리~~, 프로필 |


# 진도 :

> 처음에 인스타그램 1주일 날림 
> 싸이월드 시도, 1주일 동안 모든 곳에 ajax 적용하려다가 너무 많은 오류에 포기
> 12-27 오후부터 틀 단순화 시키고 다시 시작 


날짜 | 계획 
--- | --- 
12-27 | DB 수정 및 역할 분담, 프론트 레이아웃, 컨트롤러 시작, 접속하는 페이지 추가
12-28 | 접속 페이지 추가, 게시판 및 방명록 다듬기, 메인 페이지
12-29 | 메인 페이지, 사진첩 추가, 유효성 검사 및 예외처리 시작 
12-30 | 최소한의 프론트 추가, 유효성 검사 및 예외처리 할수 있는데 까지 
12-31 | 예외처리 최종 검사 및 발표 자료 준비 후 발표 









1. DB에 날짜가 자동으로 찍히지 않아 date컬럼에 now()를 설정
![DB](https://user-images.githubusercontent.com/88937233/147321237-8d64b0a4-2b52-4070-95b2-5b296e9c855a.png)

2. 방명록 작성하면 DB에 저장완료 
![방명록작성확인](https://user-images.githubusercontent.com/88937233/147321338-c900443d-8601-45e4-b215-2c8ee4d300dd.png)


※ 다른 사람의 미니홈피로 들어갈때 내 정보를 가진 session과 다른 사람의 정보를 가진 session이 필요하다고 판단.

4. 검색창에 id설정

![검색창id](https://user-images.githubusercontent.com/88937233/147335489-bc1fd9ac-3e82-442f-847b-8e6d4b23f519.png)

5. dto other 생성

6. searchUserController에서 검색창에 입력한 값 요청 및 db
![search](https://user-images.githubusercontent.com/88937233/147335785-6e6c1be0-f4c6-4669-a68c-3f320de7c4a3.png)

7. UserDao에 sql문 작성
![dao](https://user-images.githubusercontent.com/88937233/147335850-b5dfb9b4-ab12-4af4-a2b8-58fd893a1901.png)

8. header에 적용 

![header othersession](https://user-images.githubusercontent.com/88937233/147335875-1d354581-164d-4a93-9d0a-4b213e1fd044.png)

# 12.27

1. form 태그를 사용해 방명록을 등록했었으나, 프로젝트 특성상 ajax를 사용해야 해서 수정함
2. 작성 / DB 처리 / 작성후 페이지 전환 완료

다음: 방명록 출력 및 페이징 처리


# 발표 자료

![image](https://user-images.githubusercontent.com/30681841/147807839-5cca58e5-9319-4716-aa7c-b61b6304c400.png)
![image](https://user-images.githubusercontent.com/30681841/147807844-1eaf7a2a-5e08-4bea-9b1b-a1e73d207519.png)
![image](https://user-images.githubusercontent.com/30681841/147807848-9e94c613-26c4-4138-a5e2-2c3703b2a89d.png)
![image](https://user-images.githubusercontent.com/30681841/147807850-2ad619a5-2579-48bd-9d9e-c156091a9ed5.png)
![image](https://user-images.githubusercontent.com/30681841/147807853-abc57a04-8703-4390-9c68-a5aa27a93c25.png)
![image](https://user-images.githubusercontent.com/30681841/147807858-6ec694c4-4b50-40a2-8cb1-cd299c0cf466.png)

![image](https://user-images.githubusercontent.com/30681841/147807865-1d871b27-6ca6-4444-aa2f-de4c06e851c8.png)
![image](https://user-images.githubusercontent.com/30681841/147807867-1c404fd3-437e-4691-a230-a18001e67ed8.png)
![image](https://user-images.githubusercontent.com/30681841/147807875-81627492-59fe-48e7-b8e6-2a77e036fc8c.png)
![image](https://user-images.githubusercontent.com/30681841/147807880-070d8489-4b62-4afc-b47e-b2f819357919.png)

![image](https://user-images.githubusercontent.com/30681841/147807883-baf04f01-6805-4a7b-bcd5-7d3595f5fd67.png)

![image](https://user-images.githubusercontent.com/30681841/147807887-f8f443e5-6cee-41c2-9ff3-27f7e82c074f.png)
![image](https://user-images.githubusercontent.com/30681841/147807892-0dbeb8a1-dc32-41d6-99c3-1ffaee59f3ef.png)
![image](https://user-images.githubusercontent.com/30681841/147807898-1dcf3961-c302-4fba-ba7c-62fe849e5273.png)
![image](https://user-images.githubusercontent.com/30681841/147807900-0218cd98-fb89-4ce7-b824-fbade4db102e.png)

![image](https://user-images.githubusercontent.com/30681841/147807906-b800f8cf-b564-40fc-b7d4-802eeb2d5b26.png)


