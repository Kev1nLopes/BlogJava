<%--
  Created by IntelliJ IDEA.
  User: Kevin Lopes
  Date: 15/06/2023
  Time: 01:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@	taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"	%>



<html>
<head>
    <title>Users</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="<c:url value="/css/common.css"/>"/>
</head>
<body>
  <section id="listagemUsers">
      <div class="container d-flex flex-column">

          <ul>

                  <c:forEach  varStatus="user.id" var="user" items="${following}">
                      <c:if test="${userId != user.id}">
                          <li class="d-flex ">
                              <div class="gap-2 d-flex align-items-center ">
                                  <img src="<c:url value="/imagens/dog.jpg"/>" class="rounded-circle" width="25px">
                                  <p class="m-0">@${user.userName}</p>
                              </div>

                              <div class="btnFollow" data-user-id="${user.id}">
                                  <a href="/api/follow/stop/${user.id}" style="color: white">
                                    Deixar de seguir
                                  </a>

                              </div>
                          </li>
                      </c:if>
                  </c:forEach>
          </ul>
<%--          <div class="btnPattern " style="max-width: 300px">--%>
<%--              <a href="/WEB-INF/index.jsp" style="color: white">Voltar</a>--%>
<%--          </div>--%>
          <a href="/api/">
            <button class="btnPattern my-5" >Voltar</button>
          </a>
      </div>

  </section>

</body>
</html>
