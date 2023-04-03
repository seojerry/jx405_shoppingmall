<%@ page import="com.bit.spring.model.UserDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    function work() {
        if(confirm("로그인이 필요한 서비스입니다.\n로그인 페이지로 이동 하시겠습니까?")==true){
            location.href="/user/logIn"
        }else{
            return ;
        }
    }
</script>
<header>
    <div class="h-d1">
        <div style="margin-right: 6%;font-size: 1.6em"><a href="/"><h1 style="color: red">Super</h1></a></div>
        <div class="dropdown-wrap" style="margin-right: 3%;height: 100%;display: flex;justify-content: center;align-items: center">
            <div class="dropdown" >
                <div class="dropbtn" style="font-family: 'Noto Serif', serif; font-weight: bold">
                    <a href="#">Category</a>
                </div>
                <div class="dropdown-content" >
                    <a href="/goods/category/1?category=의류">의류</a>
                    <a href="/goods/category/1?category=뷰티">뷰티</a>
                    <a href="/goods/category/1?category=식품">식품</a>
                    <a href="/goods/category/1?category=가구">가구</a>
                </div>
            </div>
        </div>
        <%--                <div style="margin-right: 3%;font-family: 'Noto Serif', serif; font-weight: bold"><a href="#">Category</a></div>--%>
        <div class="search-box">
            <form action="/goods/search/1" method="get">
                <input class="search-txt" type="text" placeholder="" name="keyword">
                <button class="search-btn" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
            </form>
        </div>
    </div>

    <div class="h-d2" >
        <c:choose>
            <c:when test="${logIn==null}">
        <a href="/user/logIn"><div style="width: 70px; color: #3b3939;">로그인</div></a>
            </c:when>
            <c:otherwise>
                <div class="dropdown-wrap" style="margin-right: 14%; height: 100%;display: flex;justify-content: center;align-items: center">
                    <div class="dropdown" >
                        <div class="dropbtn" style="font-family: 'Noto Serif', serif; font-weight: bold">
                            <a href="#"><i class="fa-sharp fa-solid fa-user fa-xl"></i></a>
                        </div>
                        <div class="dropdown-content" style="margin-top: 20px;font-weight: initial;font-family: none">
                            <a href="/goods/write">상품등록</a>
<%--                            <a href="#" hidden="hidden">상품관리</a>--%>
<%--                            <a href="#">주문내역</a>--%>
                            <a href="/user/logOut">로그아웃</a>
                        </div>
                    </div>
                </div>
<%--                <a href="/user/logIn"><div style="width: 40px; color: #3b3939;"><i class="fa-sharp fa-solid fa-user fa-xl"></i></div></a>--%>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${logIn != null}">
                <a href="/cart/show"><div style="width: 70px; color: #3b3939;">장바구니</div></a>
            </c:when>
            <c:otherwise>
                <a href="#" onclick="work()"><div style="width: 70px; color: #3b3939;">장바구니</div></a>
            </c:otherwise>
        </c:choose>
    </div>
</header>