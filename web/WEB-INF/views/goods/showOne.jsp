<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="/resources/css/header.css">
    <script src="https://kit.fontawesome.com/9dd8e5a0a7.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
    <script>
        function fnCalCount(type) {
            console.log($('input[name=stock]').val())
            if (type == 'p') {
                if (Number($('input[name=pop_out]').val()) < Number($('input[name=stock]').val())) {
                    $('input[name=pop_out]').val(Number($('input[name=pop_out]').val()) + 1);
                    console.log($('input[name=pop_out]').val())
                }
            } else {
                if (Number($('input[name=pop_out]').val()) > 1) {
                    $('input[name=pop_out]').val($('input[name=pop_out]').val() - 1);
                    console.log($('input[name=pop_out]').val())
                }
            }
        }

        function work() {
            if(confirm("로그인이 필요한 서비스입니다.\n로그인 페이지로 이동 하시겠습니까?")==true){
                location.href="/user/logIn"
            }else{
                return ;
            }
        }

        function registerConfirm(){
            if (confirm("장바구니에 담으시겠습니까?") == true) {
                $('#cartForm').attr("action",'/cart/register').submit()
            }else{
                return;
            }
        }
    </script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            height: 100vh;
            width: 100%;
        }

        .container {
            min-width: 1300px;
            height: 100%;
            min-height: 800px;
            display: flex;
            flex-direction: column;

            align-items: center;
        }

        main {
            display: flex;
            flex-direction: row;
            width: 50%;
            margin: 5%;
            min-height: 70%;
            border: #e8e6e6 0.1px solid;
        }

        .main-left {
            width: 50%;
            height: 100%;
            padding: 0 3%;
            border-right: #e8e6e6 0.1px solid;
        }

        .main-right {
            font-family: 'Hahmlet', serif;
            width: 50%;
            height: 100%;
            padding: 5%;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .main-right-top {
            width: 100%;
            height: 40%;
        }

        .price{
            width: 100%;
            display: flex;
            justify-content: end;
            margin: 30px 0;
        }
        .explanation{
            background-color: #eeeeee;
            border-radius: 6px;
            height: 100%;
            padding: 5px;
        }

        .main-right-bottom {
            width: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .img-wrap {
            width: 100%;
            height: 80%;
        }

        img {
            width: 100%;
            height: 100%;
            object-fit: contain;
        }

        .formBox {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .formBox input {
            border: 0.1px solid #e8e6e6;
            width: 35px;
            height: 35px;
            margin: 0 5px;
        }

        .formBox button {
            border-radius: 5px;
            border: none;
            background-color: #807e7e;
            color: white;
            font-weight: bold;
            font-size: 20px;
            width: 35px;
            height: 35px;
        }

        .btn {
            width: 100%;
            height: 45px;
            border: none;
            background-color: red;
            border-radius: 8px;
            color: white;
            margin-top: 10px;
            font-weight: bold;
        }

        form {
            width: 100%;
        }
    </style>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<div class="container">
    <main>
        <div class="main-left">
            <div class="img-wrap">
                <img src="${result.image}">
            </div>
        </div>
        <div class="main-right">
            <div class="main-right-top">
                <h3>${result.name}</h3>
                <div class="price"><h3>${result.price}원</h3></div>
                <div class="explanation"><p>${result.explanation}</p></div>
            </div>
            <div class="main-right-bottom">

                <div class="formBox">

                    <button type="button" onclick="fnCalCount('p',this);">+</button>
                    <input type="text" name="pop_out" value="1" readonly="readonly" style="text-align:center;"/>
                    <button type="button" onclick="fnCalCount('m', this);">-</button>
                </div>
                <form action="/" method="post">
                    <input type="hidden" name="id" value="${result.id}">
                    <input type="hidden" name="name" value="${result.name}">
                    <input type="hidden" name="category" value="${result.category}">
                    <input type="hidden" name="stock" value="${result.stock}">
                    <input type="hidden" name="image" value="${result.image}">
                    <input type="hidden" name="userId" value="${result.userId}">
                    <input type="hidden" name="price" value="${result.price}">
                    <input type="hidden" name="explanation" value="${result.explanation}">
                    <button class="btn" type="submit" disabled="disabled">주문하기</button>

                </form>
                <form action="/cart/register" method="post" id="cartForm">
                    <input type="hidden" name="pop_out" value="1" readonly="readonly" style="text-align:center;"/>
                    <input type="hidden" name="id" value="${result.id}">
                    <input type="hidden" name="name" value="${result.name}">
                    <input type="hidden" name="category" value="${result.category}">
                    <input type="hidden" name="stock" value="${result.stock}">
                    <input type="hidden" name="image" value="${result.image}">
                    <input type="hidden" name="userId" value="${result.userId}">
                    <input type="hidden" name="price" value="${result.price}">
                    <input type="hidden" name="explanation" value="${result.explanation}">
                    <c:choose>
                        <c:when test="${logIn != null}">
                            <button class="btn" type="button" onclick="registerConfirm()" >장바구니</button>
                        </c:when>
                        <c:otherwise>
                            <button class="btn" type="button" onclick="work()">장바구니</button>
                        </c:otherwise>
                    </c:choose>
                </form>
            </div>
        </div>
    </main>
</div>
</body>
</html>
