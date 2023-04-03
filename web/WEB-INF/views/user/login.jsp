<%--
  Created by IntelliJ IDEA.
  User: cwt75
  Date: 2023-03-24
  Time: 오전 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Gowun+Batang&family=Nanum+Myeongjo&family=Noto+Sans+KR:wght@500&family=Noto+Serif&family=Sono:wght@800&display=swap');
        * {
            margin: 0;
            padding: 0;
            box-sizing:border-box ;
            border-collapse: collapse;
        }
        .container{
            width: 100%;
            height: 100vh;
            font-family: 'Noto Sans KR', sans-serif;
        }
        a{
            text-decoration: none;
        }
        main {
            height: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .top {
            font-family: 'Sono', sans-serif;
            margin-top: 8%;
            margin-bottom: 3%;
        }
        .middle{
            width: 450px;
            border: 0.3px solid #b0afaf;
            padding: 2%;
            border-radius: 5px;
        }
        .login-box{
            width: 100%;
            height: 45px;
        }
        .login-box:focus {
            border: solid 1px red;
            outline: none;
        }
        .login-btn{
            font-family: 'Noto Sans KR', sans-serif;
            width: 100%;
            height: 45px;
            font-size: 1em;
            border: none;
            background-color: red;
            border-radius: 20px;
            font-weight: bold;
            color: white;
        }
        .bottom a{
            color: #807e7e;
        }


    </style>
</head>
<body>
    <div class="container">
        <main>
            <div class="top" style="font-size: 1.6em">
                <a href="/"><h1 style="color: red">Super</h1></a>
            </div>

            <div class="middle">
                <p style="margin-bottom: 10%">ID 로그인<br></p>
                <form method="post" action="/user/auth">
                    <input class="login-box" type="text" name="username" placeholder=" 아이디"><br>
                    <input class="login-box" type="password" name="password" placeholder=" 비밀번호"><br>
                    <input style="margin-top:10px " type="checkbox" name="remember-me">자동 로그인<br>
                    <button style="margin-top: 10%" class="login-btn" type="submit" class="btn btn-primary">로그인</button><br>
                </form>
            </div>
            <div class="bottom" style="margin-top: 20px">
                <a class="btn btn-info" href="/user/register">회원가입</a>
            </div>
        </main>
    </div>
</body>
</html>
