<%--
  Created by IntelliJ IDEA.
  User: cwt75
  Date: 2023-03-27
  Time: 오전 3:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
  var msg = "<c:out value='${msg}'/> ";
  var url = "<c:out value='${url}'/> ";
  alert(msg)
  location.href = url;
</script>
