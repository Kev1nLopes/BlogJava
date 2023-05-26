<%@ page import="Dao.PostDao" %>
<%@ page import="Models.Post" %>
<%@ page import="java.util.List" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@	taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"	%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="t" %>



<html lang="pt-BR">
<head>
    <link rel="stylesheet" href="../css/style.css" />
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<body>
    <main class="container-xl h-100">
        <div class="row">
            <div class="col-lg-3 d-flex flex-column gap-3">
                <div class="logo">

                </div>
                <div class="SidebarItem pointer">
                    <a>Pagina inicial</a>
                </div>
                <div class="SidebarItem pointer">
                    <a>Explorar</a>
                </div>
                <div class="SidebarItem pointer">
                    <a>Notificações</a>
                </div>
                <div class="SidebarItem pointer">
                    <a>Mensagens</a>
                </div>
                <div class="SidebarItem pointer">
                    <a>Itens salvos</a>
                </div>
                <div class="SidebarItem pointer">
                    <a>Twitter Blue</a>
                </div>
                <div class="SidebarItem pointer">
                    <a>Perfil</a>
                </div>
                <div class="SidebarItem pointer">
                    <a>Mais</a>
                </div>

            </div>
            
            <div class="col-lg-6 main-column" style="border-left: 2px solid gray;">
                Pagina inicial
                <div class="row">
                    <div class="col-5 text-center">
                        Para voce
                    </div>
                    <div class="col-5 text-center">
                        Seguindo
                    </div>
                </div>
                <div class="row d-flex flex-column">
                    <t:inputThinking place="O que voce esta acontecendo?" imgUrl="sinoco.jpg"></t:inputThinking>
                </div>

                <jsp:useBean id="dao" class="Dao.PostDao"/>
                <jsp:useBean id="user" class="Dao.UserDao"/>
                <c:forEach varStatus="post.id" var="post" items="${dao.get()}">
                    <t:post  content="${post.content}" userPhoto="sinoco.jpg" user="${user.getById(1)}" />
                </c:forEach>

            </div>
            <div class="col-lg-3">
                <t:inputForm id="search" place="Buscar no Twitter" type="text"></t:inputForm>
            </div>
        </div>
    </main>




</body>
</html>

