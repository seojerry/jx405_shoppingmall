<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>상품리스트</title>
    <link rel="stylesheet" href="/resources/css/header.css">
    <script src="https://kit.fontawesome.com/9dd8e5a0a7.js" crossorigin="anonymous"></script>
    <style>
        body{
            font-family: 'Noto Sans KR', sans-serif;
            font-family: 'Noto Serif', serif;
            width: 100%;
            height: 100vh;
        }
        .container {
            display: flex;
            flex-direction: column;
            height: 100%;
        }
        main{
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .main-box{
            display: flex;
            flex-direction: column;
        }
        .main-header{
            padding: 4% 15% 1%;
        }
        .main-header h1{
            border-bottom: 3px solid black;
        }
        .main-content {
            padding: 1% 15% 2%;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 300px));
            grid-template-rows: repeat(auto-fit, minmax(300px, 400px));
            grid-auto-rows: minmax(300px, 3fr);
            gap:2em;
        }
        article {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            /*border: 3px solid black;*/
            font-family: 'Nanum Myeongjo', serif;
        }
        .title {
            padding: 1em 0;
        }
        img {
            width: 100%;
            height: 100%;
        }
        .image {
            height: 100%;
            background-color: #efebeb;
            /*padding: 1em;*/
        }
        .info {
            display: flex;
            flex-direction: column;
            justify-content: center;
            /*border-top: 3px solid black;*/
            padding: 1em 0;
            font-family: 'Nanum Myeongjo', serif;
        }
        .price{
            font-weight: bold;
        }
        .pagination-wrap {
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
            margin-bottom: 10%;
        }
        .pagination{
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
            list-style: none;
            font-family: 'Nanum Myeongjo', serif;
            font-weight: bold;
        }
      .page-item{
          padding:10px;
          margin: 2px;
          flex: 1;
      }
      .page-arrow{

      }
      .page-link{
          color: #aba9a9;
          font-size: 1.1em;
      }
      .active{
          color: black;
      }
    </style>
</head>

<body>
<div class="container">
    <%@include file="/WEB-INF/views/header.jsp" %>
    <main>
        <div class="main-box">
            <div class="main-header">
                <h1 style="color: red">New</h1>
            </div>
            <div class="main-content">
                <c:forEach items="${list}" var="item">
                <article>
                    <div class="image">
                        <a href="/goods/showOne/${item.id}"><img src="${item.image}"></a>
                    </div>
                    <div class="info">
                        <a href="/goods/showOne/${item.id}"><h4 class="title">${item.name}</h4></a>
                        <div class="price">${item.price}원</div>
                    </div>
                </article>
                </c:forEach>
            </div>
        </div>
        <div class="pagination-wrap">
            <ul class="pagination">
                <li class="page-item page-arrow">
                    <a class="page-link" href="${pagingAddr}/1?keyword=${keyword}&category=${category}">&laquo</a>
                </li>
                <c:forEach var="i" begin="${paging.start}" end="${paging.end}">
                    <c:choose>
                        <c:when test="${i eq paging.current}">
                            <li class="page-item ">
                                <a class="page-link active" href="${pagingAddr}/${i}?keyword=${keyword}&category=${category}">${i}</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item">
                                <a class="page-link" href="${pagingAddr}/${i}?keyword=${keyword}&category=${category}">${i}</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <li class="page-item page-arrow">
                    <a class="page-link" href="${pagingAddr}/${paging.totalPage}?keyword=${keyword}&category=${category}">&raquo</a>
                </li>
            </ul>
        </div>

    </main>

</div>
</body>
</html>

