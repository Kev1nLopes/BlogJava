<%--
  Created by IntelliJ IDEA.
  User: Kevin Lopes
  Date: 15/06/2023
  Time: 00:51
  To change this template use File | Settings | File Templates.
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib tagdir="/WEB-INF/tags" prefix="cadastro"%>--%>

<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="<c:url value="/css/common.css"/>"/>
</head>
<style>


</style>
<body style="display: flex; justify-content: center; align-items: center; height: 100vh; width: 100vw;">
<div class="row formTemplate ">
    <div class="left-area col-6 row flex-column align-items-center justify-content-center">
        <h3 class="text-center">Anti-LGPD</h3>
        <p>
            Se você quer que seu e-mail esteja lotado todos os dias, com mensagens agradaveis,
            com noticias da semana e muito spam aleatório e coisas inuteis, você está no lugar certo,
            aqui nós vendemos seus dados em troca de nada! Apenas ajudando a evolução humana!
        </p>
    </div>
    <div class="right-area col-6 d-flex align-items-center">



        <form:form action="/api/register" method="post" modelAttribute="user" cssClass="row flex-column align-items-center mx-auto gap-1 w-100">
            <h3 class="text-center" style="color: black">Cadastro</h3>
            <div class="d-flex flex-column col-10">
                <form:label path="userName">Usuario:</form:label>
                <form:input type="text" path="userName" cssClass="inputForm" autocomplete="false"/>
            </div>

            <div class="d-flex flex-column col-10">
                <form:label path="email">Email:</form:label>
                <form:input type="text" path="email" cssClass="inputForm" autocomplete="false"/>
            </div>

            <div class="d-flex flex-column col-10">
                <form:label path="password">Senha:</form:label>
                <form:input type="password" path="password" cssClass="inputForm" autocomplete="false"/>
            </div>


            <input type="submit" value="Entrar" class="btnPattern col-10">
        </form:form>


    </div>

</div>
<script src="./js/index.js"></script>

</body>
</html>
