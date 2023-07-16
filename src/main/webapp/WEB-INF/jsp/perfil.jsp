<%--
  Created by IntelliJ IDEA.
  User: Kevin Lopes
  Date: 16/07/2023
  Time: 08:00
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Perfil</title>
    <link rel="stylesheet" href="<c:url value="/css/common.css"/>"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body>
<main>
  <div class="container">
      <header id="profile-pics-area"  style="display: flex; justify-content: center; margin-bottom: 30px">
<%--&lt;%&ndash;        <img src="<c:url value="/imagens/dog.jpg" ></c:url> " style="border-radius: 50%">&ndash;%&gt;--%>
<%--          <form:form method="post" action="/api/save-image" enctype="multipart/form-data">--%>
<%--              <form:label path="file">Select a file to upload</form:label>--%>
<%--              <form:input path="file" name="file" />--%>
<%--          </form:form>--%>
      </header>

      <div id="user-info">
          <form:form action="/api/updateProfile" method="post" modelAttribute="user" cssClass="d-flex flex-column gap-3">
            <div class="row">
              <form:label path="userName" cssClass="col-2">
                Usuario:
              </form:label>
              <form:input path="userName" type="text" cssClass="inputForm col-8" autocomplete="false" ></form:input>
            </div>
            <div class="row">
              <form:label path="email" cssClass="col-2">
                Email:
              </form:label>
              <form:input path="email" type="text" cssClass="inputForm col-8" autocomplete="false" ></form:input>
            </div>



            <div class="row">
              <form:label path="password" cssClass="col-2">
                Senha:
              </form:label>
              <form:input path="password" type="password" cssClass="inputForm col-8" autocomplete="false" ></form:input>
            </div>


            <input type="submit" value="Salvar" class="btnPattern col-4 mx-auto">
          </form:form>
      </div>
  </div>
</main>

</body>
</html>
