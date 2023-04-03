<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>장바구니</title>
    <link rel="stylesheet" href="/resources/css/header.css">
    <script src="https://kit.fontawesome.com/9dd8e5a0a7.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
    <script>
        function checkBoxClick(item,index) {
            console.log($('input[name=orderPrice]').val());
            if (item.checked) {
                $('input[name=orderPrice]').val(Number($('input[name=orderPrice]').val()) + Number(item.value));
            }else{
                $('input[name=orderPrice]').val(Number($('input[name=orderPrice]').val()) - Number(item.value));
            }
            console.log(Number(item.value))
        }
        function selectAll(selectAll) {
            const checkboxes
                = document.getElementsByName('item');
            let orderPrice=0
            checkboxes.forEach((checkbox,index) => {
                checkbox.checked = selectAll.checked;
                if(index>0){
                    orderPrice = orderPrice+Number(checkbox.value)
                }
            })
            console.log(orderPrice)
            if(selectAll.checked){
                $('input[name=orderPrice]').val(orderPrice)
            }else {
                $('input[name=orderPrice]').val(0)
            }
        }

        function itemDelete(){
            const checkboxes = document.getElementsByName('item');
            checkboxes.forEach((checkbox) => {
                if(checkbox.checked){
                    console.log(checkbox)
                    $('input[name=id]').val(checkbox.value2)
                    // $('#deleteForm').attr("action",'/cart/delete').submit()
                }
            })
        }

    </script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            width: 100%;
            min-height: 100vh;
            padding-bottom: 100px;
        }
        main {
            display: flex;
            flex-direction: column;
            width: 100%;
            justify-content: center;
            align-items: center;
            padding: 0 20%;
            min-width: 1600px;
        }
        .cart-item{
            width: 100%;
            display: flex;
            flex-direction: row;
            justify-content: space-evenly;
            align-items: center;
            border-top: 2px solid lightgray;
        }
        .image-wrap {
            width: 150px;
            height: 150px;
        }
        img {
            width: 100%;
            height: 100%;
            object-fit: contain;
        }
        .main-box1{
            width: 100%;
            margin: 4%;
            border-bottom: 2px solid black;
        }
        .main-box2 {
            width: 100%;
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            margin: 2%;
        }
        .main-box2 div{
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
        }
        .cart-item div{
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        .deleteBtn{
            width: 100px;
            height: 40px;
            background-color: red;
            color: white;
            font-size: 16px;
            border: none;
            font-weight: bold;
            border-radius: 8px;
            margin-right: 10px;
        }
        .main-box2 div p{
            font-weight: bold;
            font-size: 16px;
            margin-left: 6px;
        }
        .cartBtn{
            width: 90px;
            height: 30px;
            border: 1px solid #bebebe;
            background-color: white;
        }
        input {
            width: 25px;
            height: 25px;
            border-color: #aba9a9;
        }
        .main-box3{
            width: 100%;
            display: flex;
            justify-content: end;
            height: 100px;
            border-top: 2px solid lightgray;
            background-color: #e3e1e1;
        }
        .main-box3 div{
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
            font-size: 16px;
            font-weight: bold;
        }
        .main-box3 div button{
            width: 100px;
            height: 40px;
            background-color: red;
            color: white;
            font-size: 16px;
            border: none;
            font-weight: bold;
            border-radius: 8px;
            margin-left: 20px;
            margin-right: 10px;

        }
        #orderPrice {
            width: 100px;
            height: 40px;
            margin: 0 15px;
            border: none;
            font-size: 20px;
            font-weight: bold;
            background-color: #e3e1e1;
        }
    </style>
</head>
<body>
<div class="container">
    <%@include file="../header.jsp" %>
    <main>
        <div class="main-box1">
            <h1 style="font-size: 50px"><i class="fa-solid fa-cart-shopping fa-lg"></i>Cart</h1>
        </div>
        <div class="main-box2">
            <div>
            <input type="checkbox" name="item" onclick="selectAll(this)">
            <p>전체 선택</p>
            </div>
            <form id="deleteForm" method="post">
                <input type="hidden" name="id">
            <button class="deleteBtn" onclick="itemDelete()" disabled="disabled">선택삭제</button>
            </form>
        </div>
        <c:forEach items="${list}" var="item" varStatus="status">
            <div class="cart-item">
                <input type="checkbox" name="item" value="${item.price}" id="item" onclick="checkBoxClick(this,${status.index})">
                <div class="image-wrap"><img src="${item.image}"></div>
                <div>수량: ${item.count}</div>
                <div>상품금액: ${item.price}원</div>
                <div>
                    <form>
                        <button class="cartBtn">주문하기</button>
                    </form>
                </div>
            </div>
        </c:forEach>
        <div class="main-box3">
            <div>
                <label for="orderPrice" style="font-size: 20px; font-weight: bold">주문금액:</label>
                <input id="orderPrice" name="orderPrice" type="text" value="0" readonly="readonly" >
                <button>주문하기</button>
            </div>
        </div>
    </main>
</div>
</body>
</html>
