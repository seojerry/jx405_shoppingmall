<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>인덱스</title>
    <link rel="stylesheet" href="/resources/css/header.css">
    <script src="https://kit.fontawesome.com/9dd8e5a0a7.js" crossorigin="anonymous"></script>
    <style>

        body{
            font-family: 'Noto Sans KR', sans-serif;
            font-family: 'Noto Serif', serif;
        }
        .container {
            display: flex;
            flex-direction: column;
        }

        main{
            position: relative;
            height: 100vh;
            /*background-image: url("/resources/images/mainpage3.jpg");*/
            /*background-repeat: no-repeat;*/
            /*background-size: cover;*/
        }
        .main-img{
            position: relative;top: 0; left: 0;
            width: 100%;
            height: 100%;
        }
        .main-text{
            position: absolute;
            top: 35%;
            left: 9%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            color: white;
            text-shadow: 1px 1px 1px gray;
        }
        .main-text p{
            margin-bottom: 3%;
        }

        .main-text-btn {
            width: 170px;
            height: 50px;
            background: white;
            color: black;
            display: flex;
            justify-content: center;
            align-items: center;
            box-shadow: 1px 1px 1px black;
        }
        .main-text-btn p{
            margin: 6% 0;
        }

        a {
            color: black;
            text-decoration: none;
        }

    </style>
</head>

<body>
    <div class="container">
        <%@include file="./header.jsp" %>
        <main>
            <img class="main-img" src="/resources/images/mainpage4.jpg" style="z-index: -1;">
            <div class="main-text">
                <p style="font-weight: bold; font-size: 1.3vw">2023 SUPER SUMMER<br></p>
                <p style="font-weight: bold; font-size: 1.7vw">Big Sale , Summer Festial ,For You<br></p>
                <div  class="main-text-btn" style="margin-top: 8%"><a  href="/goods/showAll/1" style="font-size: 1.1vw">Shopping</a></div>
            </div>
        </main>
        <footer>

        </footer>
    </div>

</body>
</html>
