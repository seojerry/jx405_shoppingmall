<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>인덱스</title>
    <link rel="stylesheet" href="/resources/css/header.css">
    <script src="https://kit.fontawesome.com/9dd8e5a0a7.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
    <script>
        $(document).ready(function (){
            $("#submit").click(function (){
                if($("#input-name").val().length==0){alert("상품명을 입력하세요.");$("#input-name").focus();return false;}
                if($("#input-price").val().length==0){alert("상품가격을 입력하세요.");$("#input-price").focus();return false;}
                if($("#input-stock").val().length==0){alert("상품수량을 입력하세요.");$("#input-stock").focus();return false;}
                if($("#input-image").val().length==0){alert("이미지 파일을 첨부해주세요.");return false;}
            })
        })
    </script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Gowun+Batang&family=Nanum+Myeongjo&family=Noto+Sans+KR:wght@500&family=Noto+Serif&family=Sono:wght@800&display=swap');
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body{
            font-family: 'Noto Sans KR', sans-serif;
            font-family: 'Noto Serif', serif;
            /*width: 100%;*/
            width: 100%;
            min-width: 500px;
            min-height: 100vh;
        }
        .container {
            display: flex;
            flex-direction: column;
            width: 100%;
            height: 100%;
        }
        main {
            height: 100%;
            width: 70%;
            display: flex;
            flex-direction: row;
            /*background-color: white;*/
        }
        .main-left{
            font-family: 'Nanum Myeongjo', serif;
            padding: 5% 0 0 0;
            width: 20%;
            height: 100vh;
            text-align: center;
            /*border-right:2px solid black;*/
        }
        .main-right{
            font-family: 'Noto Sans KR', sans-serif;
            padding: 5% 0 0 5%;
            width: 80%;
            height: 100vh;
            font-size: 1.0vw;
            /*white-space: nowrap;*/
        }
        header{
            border-bottom: 2px solid black;
        }
       label{
           display: inline-block;
           width: 200px;
       }
       .upsert-box{
           margin-bottom: 3%;
           width: 200px;
           height: 45px;
       }
       .form-textarea{
           display: flex;
           align-items: center;
           margin: 3% 0;
           flex-wrap: wrap;
       }
       .main-wrap {
           width: 100%;
           display: flex;
           justify-content: center;
           align-items: center;
       }
       .upsert-btn{
           font-family: 'Noto Sans KR', sans-serif;
           margin: 6% 0 0 0;
           width: 200px;
           height: 50px;
           border-radius: 10px;
           font-weight: bold;
           color: white;
           font-size: 16px;
           border:none;
           background-color: red;
       }
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
    </style>
</head>

<body>

<div class="container">
    <%@include file="/WEB-INF/views/header.jsp" %>
    <div class="main-wrap">
    <main>
        <div class="main-left">
            <h1 style="font-size: 2.2vw">상품등록</h1>
        </div>
        <div class="main-right">
            <form class="main-form" method="post" action="/goods/upsert" enctype="multipart/form-data">
                <input type="hidden" value="${goods.id}" name="attemptId">
                <label for="input-name">* 상품명</label>
                <input value="${goods.name}" maxlength="35" class="upsert-box" type="text" name="name" placeholder="삼품명" id="input-name"><br>
                <label for="input-category">* 상품 카테고리</label>
                <select id="input-category" name="category">
                    <option value="의류" <c:if test="${goods.category eq '의류'}">selected</c:if>>의류</option>
                    <option value="뷰티" <c:if test="${goods.category eq '뷰티'}">selected</c:if>>뷰티</option>
                    <option value="식품" <c:if test="${goods.category eq '식품'}">selected</c:if>>식품</option>
                    <option value="가구" <c:if test="${goods.category eq '가구'}">selected</c:if>>가구</option>
                </select><br>
                <div class="form-textarea">
                <label for="input-explanation">· 상품설명</label>
                <textarea value="${goods.explanation}" style="display: inline-block" maxlength="200" class="" type="text" name="explanation"  id="input-explanation" rows="15" cols="60"></textarea>
                </div>
                <label for="input-price">* 상품가격</label>

                <input value="${goods.price}" class="upsert-box" type="number" name="price" placeholder="가격" id="input-price"><br>
                <label for="input-stock">* 상품수량</label>
                <input value="${goods.stock}" class="upsert-box" type="number" name="stock" placeholder="수량" id="input-stock"><br>
                <c:if test="${empty goods.image}">
                <label for="input-image">* 이미지 업로드</label>
                <input type="file" name="file" accept="image/*" id="input-image"><br>
                </c:if>
                <button class="upsert-btn" type="submit" id="submit" class="btn btn-primary">등록하기</button><br>
            </form>
        </div>
    </main>
    </div>

</div>

</body>
</html>
