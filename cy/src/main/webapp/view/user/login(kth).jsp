<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../common/common.jsp" %>
<%@ include file="../common/header(kth).jsp" %>
<!-- 로그인 페이지 -->
    <div id="login" class=wrap>
        <div class="container">
            <div class="row col-12 d-flex flex-column">
                <ul class="d-flex my-2">
                    <li class="mx-3 "><a href="../common/home.jsp">홈</a></li>
                    <li class="mx-3 active" style="border-bottom: solid 1px #000;"><a href="./login(kth).jsp">로그인</a></li>
                </ul>
                <h1 class="my-2" style="font-size: 30px;">로그인</h1>
                <div class="row login col-12 border">
                    <div class="col-6">
                        <h1 class="my-4 text-center col-10 offset-1 border-bottom" style="font-size: 1.5rem;">회원 로그인
                        </h1>
                        <div class="row  col-12">
                            <form class="col-9 d-flex flex-column justify-content-center" action="">
                                <input class="my-2" type="text" style="width: 100%;" placeholder="아이디를 입력해주세요.">
                                <input class="my-2" type="password" style="width: 100%; font-family: '나눔';" placeholder="비밀번호를 입력해주세요.">
                            </form>
                            <div class="col-3 d-flex align-items-center justify-content-center" style="height: 80px;">
                                <button type="button" class="btn"
                                    style="background: orange; color: white; height: 90%;">로그인</button>
                            </div>
                            <div class="mt-1 d-flex flex-column col-12">
                                <div class="my-1 d-flex justify-content-between ">
                                    <label class="align-self-center" for="">아직도 싸이월드 회원이 아니신가요?</label>
                                    <a href="./signup(kth).jsp"> <button type="button" class="btn btn-outline-warning"
                                            data-mdb-ripple-color="dark">
                                            회원가입
                                        </button></a>

                                </div>
                                <div class="my-1 d-flex justify-content-between">
                                    <label class="align-self-center" for="">회원아이디 또는 비밀번호를 잊으셨나요?</label> <button
                                        type="button" class="btn btn-outline-warning" data-mdb-ripple-color="dark">
                                        아이디 / 비밀번호찾기
                                    </button>
                                </div>
                            </div>
                        </div>


                    </div>
                    <div class="col-6" style="position: relative;">
                        <div
                            style="position: absolute; top: 20%; left: 50%; transform: translate(-50%,-50%);font-weight: bold; line-height: 20px; background: rgba(0, 0, 0, 0.5); border-radius: 10px; width: 60%; text-align: center; padding: 1rem 0; color: white;">
                            <span>가입만 해도</span><br>
                            <span>바로 이용 가능한</span><br>
                            <span>300도토리를</span><br>
                            <span>지급해 드립니다.</span>
                        </div>
                        <div class="text-center">
                            <img src="../../image/common/3.login.png" alt="" style="width: 100%; height: 100%;">
                        </div>


                    </div>
                </div>
            </div>

        </div>
    </div>

    <!-- 액티브 -->
    <script>
        const li = document.querySelector('.active');
        const li2 = document.querySelector('.active2');
        li.style.color = 'orange';
        li2.style.color = 'orange';
    </script>

</body>
</html>