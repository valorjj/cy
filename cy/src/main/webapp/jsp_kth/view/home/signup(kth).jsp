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
<%@ include file="../common/header.jsp" %>
<!-- 회원가입 페이지 -->
    <div id="signup" class=wrap>
        <div class="container">
            <div class="row col-12 d-flex flex-column">
                <ul class="d-flex my-2">
                    <li class="mx-3 "><a href="../common/home.jsp">홈</a></li>
                    <li class="mx-3 active" style="border-bottom: solid 1px #000;"><a href="/signup.html">회원가입</a></li>
                </ul>
                <h1 class="my-2" style="font-size: 30px;">회원가입</h1>
                <div class="row login col-12 border">
                    <div class="title text-center" style="width: 100%;">
                        <p class="my-2 h3">싸이월드에 오신 것을 환영합니다</p>
                        <p class="my-2 h5"><span class="mr-2" style="font-weight: bold;">지금 회원가입하신 후</span><span
                                class="text-warning">싸이월드의
                                다양한
                                서비스를</span>만나보세요</p>
                    </div>
                    <div class="h5">기본정보입력</div>
                    <form id="signupform"
                        class="signform col-12 border border-dark pt-2 pb-2 rounded d-flex flex-column justify-content-center"
                        action="" method="post" enctype="multipart/form-data" onsubmit="return signupcheck()"
                        style="width: 80%">
                        <div class="form-group">
                            <label for="signId">아이디</label>
                            <input type="text" class="form-control" id="signId" name="signId"
                                placeholder="아이디는 10글자를 넘을 수 없습니다." />
                            <div>
                                <span id="idresult"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="signPassword">비밀번호</label>
                            <input type="password" class="form-control" id="signPassword" name="signPassword"
                                placeholder="비밀번호는 영문과 숫자만 사용가능하고 16글자 이내." style="font-family: '나눔';" />
                            <div>
                                <span id="idresult"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="signPasswordConfirm">비밀번호 확인</label>
                            <input type="password" class="form-control" id="signPasswordConfirm"
                                name="signPasswordConfirm" style="font-family: '나눔';" />
                        </div>
                        <div class="form-group">
                            <label for="signName">이름</label>
                            <input type="text" class="form-control" id="signName" name="signName"
                                placeholder="특수문자 제외 및 최대 10글자." />
                        </div>
                        <div class="form-group">
                            <label for="signPhone">핸드폰번호</label>
                            <input type="text" class="form-control" id="signPhone" name="signPhone"
                                placeholder="핸드폰 번호(000-0000-0000 형식)를 입력하세요. " />
                        </div>
                        <div class="form-group">
                            <label for="signEmail">이메일주소</label>
                            <div class="input-group-append d-flex" style="width: 100%">
                                <input type="text" class="form-control" id="signEmail" name="signEmail"
                                    placeholder="유효한 이메일주소" />
                                <span class="input-group-text" id="basic-addon2">@</span>
                                <select class="custom-select" name="postAddress" id="postAddress">
                                    <option value="메일을 선택하세요"></option>
                                    <option value="gmail.com">gmail.com</option>
                                    <option value="naver.com">naver.com</option>
                                    <option value="daum.net">daum.net</option>
                                    <option value="kakao.net">kakao.net</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="genderCheck" id="genderCheck1"
                                    value="M" />
                                <label for="genderCheck1">남성</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="genderCheck" id="genderCheck2"
                                    value="F" />
                                <label for="genderCheck1">여성</label>
                            </div>
                            <small id="genderHelp" class="form-text text-muted">성별을 선택해주세요.</small>
                        </div>
                        <div class="form-group d-flex">
                            <div class="col-7">
                                <div class="form-group">
                                    <label for="signPic">프로필 사진</label>
                                    <input class="border border-lightgrey" type="file" class="custom-file" id="signPic"
                                        name="signPic">
                                    <small id="fileHelp" class="form-text text-muted">이미지 파일을 업로드해주세요.</small>
                                </div>
                            </div>
                            <div class="col-5">
                                <div class="imageContainer" style="border: 1px dotted lightgrey; height: 100%;">
                                    <img src="" alt="" style="max-width: 100%;" id="previewImage" />
                                </div>
                            </div>
                        </div>

                        <div class="form-group d-flex align-content-center" style="height: auto ">
                            <div class="col-6"><label for="birth" class="align-self-center">생년월일</label>
                                <p class="align-self-center mx-2"><input type="date"></p>
                            </div>

                            <div class="col-6"><label for="age" class="align-self-center">나이</label>

                                <select name="signAge" id="signAge" class="custom-select d-inline-block">
                                    <% for (int i = 10; i < 60; i++) { %>
                                    <option value="<%=i%>">
                                        <%=i%></option> <% } %>
                                </select></div>



                        </div>
                        <div class="form-group">
                            <label for="">홈페이지 별명</label>
                            <input type="text" class="form-control" id="signNickname" name="signNickname"
                                placeholder="홈페이지에 멋진 별명을 붙여주세요" />
                        </div>
                        <div class="form-group">
                            <label for="">홈페이지 소개글</label>
                            <input type="text" class="form-control" id="signInfo" name="signInfo"
                                placeholder="간단한 홈페이지 소개를 적어주시면 어떨까요?" />
                        </div>
                    </form>
                </div>
                <div class="row d-flex justify-content-center align-items-center my-3">
                    <button class="mx-2 btn btn-warning" type="submit">회원가입 ></button>
                    <a href="./login(kth).jsp"><button class="mx-2 btn btn-warning" type="button">돌아가기 ></button></a>

                </div>


            </div>

        </div>
    </div>

    <!-- 업로드 -->
    <script type="text/javascript">
        var imagePreview = document.getElementById('imageContainer');

        function readImage(input) {
            if (input.files && input.files[0]) {
                const reader = new FileReader();
                reader.onload = (e) => {
                    const previewImage = document.getElementById('previewImage');
                    previewImage.src = e.target.result;
                }
                reader.readAsDataURL(input.files[0]);
            }
        }
        document.getElementById('signPic').addEventListener('change', (e) => {
            readImage(e.target);
        });
    </script>

    <!-- 액티브 -->
    <script>
        const li = document.querySelector('.active');
        const li2 = document.querySelector('.active2');
        li.style.color = 'orange';
        li2.style.color = 'orange';
    </script>
</body>
</html>