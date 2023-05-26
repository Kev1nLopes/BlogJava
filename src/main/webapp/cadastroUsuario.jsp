<%--
  Created by IntelliJ IDEA.
  User: Kevin Lopes
  Date: 30/04/2023
  Time: 19:25
  To change this template use File | Settings | File Templates.
--%>
<%@taglib tagdir="/WEB-INF/tags" prefix="cadastro"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
  <form action="style.jsp">
    Idade:
    <input type="text" name="idade"/>
    <input type="submit"/>
    <cadastro:inputForm id="kevin" place="teste" type="text"></cadastro:inputForm>
  </form>

</body>
</html>
