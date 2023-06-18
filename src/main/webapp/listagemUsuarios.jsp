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

<%
    int userId = (int) request.getSession().getAttribute("userId");
%>

<html>
<head>
    <title>Users</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css" />
</head>
<body>
  <section id="listagemUsers">
      <div class="container">
          <ul>
              <!--- Listar todos os usuarios que eu não sigo !-->
              <jsp:useBean id="dao" class="Dao.UserDao">
                  <c:forEach  varStatus="user.id" var="user" items="${dao.GetUsersThatINotFollow(userId)}">
                      <c:if test="${userId != user.id}">
                          <li class="d-flex ">
                              <div class="gap-2 d-flex align-items-center ">
                                  <img src="imagens/dog.jpg" class="rounded-circle" width="25px">
                                  <p class="m-0">@${user.userName}</p>

                              </div>

                              <button class="btnFollow" data-user-id="${user.id}" onclick="followUser(this)">+Seguir</button>
                          </li>
                      </c:if>
                  </c:forEach>
              </jsp:useBean>
          </ul>
<%--          <div class="btnPattern" style="max-width: 300px">--%>
<%--              <a href="/WEB-INF/index.jsp" style="color: white">Voltar</a>--%>
<%--          </div>--%>
      </div>

  </section>

    <script>
        function followUser(button){
            let followedId = button.getAttribute('data-user-id');
            button.textContent = 'Seguindo';


            fetch('http://localhost:8080/BlogJava/post', {
                method: "POST",
                headers: {
                    "Content-Type": "application/x-www-form-urlencoded"
                },
                body: "action=" + "follow" + "&userId=" + <%=userId%> +"&followedId=" + followedId
            }).then(response =>{
                console.log(response)
                if(response.ok){
                    console.log("deu bom")
                }else{
                    console.log("erro ao seguir o usuario")
                }
            }).catch((err) =>{
                console.log(err)
            })

        }

    </script>
</body>
</html>
