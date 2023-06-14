<%@ page import="Dao.PostDao" %>
<%@ page import="Models.Post" %>
<%@ page import="java.util.List" %>
<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@	taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"	%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="t" %>
<%
    int userId = (int) request.getAttribute("userId");
%>



<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta http-equiv="content-type" charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Twithor</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link rel="stylesheet" href="/BlogJava/css/style.css">
</head>
<body>
<main class="container ">

    <div class="row m-0" style="min-height: 100vh; height: 100%;">
        <div class="col-3 d-flex flex-column gap-3">
            <img src="imagens/twittor.png" alt="twitter-logo">
            <ul class="p-0 d-flex flex-column gap-3">
                <li class="d-flex align-items-center gap-2">
                    <ion-icon name="heart"></ion-icon>
                    <a href="/">Pagina inicial</a>

                </li>
                <li class="d-flex align-items-center gap-2">
                    <ion-icon name="search"></ion-icon>
                    <a href="/">Explorar</a>

                </li>
                <li class="d-flex align-items-center gap-2">
                    <ion-icon name="notifications"></ion-icon>
                    <a href="/">Notificações</a>

                </li>
                <li class="d-flex align-items-center gap-2">
                    <ion-icon name="text"></ion-icon>
                    <a href="/">Mensagens</a>

                </li>
                <li class="d-flex align-items-center gap-2">
                    <ion-icon name="list-box"></ion-icon>
                    <a href="/">Listas</a>

                </li>
                <li class="d-flex align-items-center gap-2">
                    <ion-icon name="bookmark"></ion-icon>
                    <a href="/">Itens Salvos</a>

                </li>
                <li class="d-flex align-items-center gap-2">
                    <ion-icon name="checkmark-circle"></ion-icon>
                    <a href="/">Verificadas</a>

                </li>
                <li class="d-flex align-items-center gap-2">
                    <ion-icon name="contact"></ion-icon>
                    <a href="/">Perfil</a>

                </li>
                <li class="d-flex align-items-center gap-2">
                    <ion-icon name="more"></ion-icon>
                    <a href="/">Mais</a>

                </li>

            </ul>
            <div class="user-info">
                <%= userId %>
            </div>

        </div>
        <div class="col-6 main-area p-0">

            <!-- Header area -->
            <header>
                <h3 id="page-title">Página Inicial</h3>
                <div class="row">
                    <div class="col-6 text-center type-content">
                        Para você
                    </div>
                    <div class="col-6 text-center type-content">
                        Seguindo
                    </div>
                </div>
            </header>

            <!-- Main-area-content -->
            <div class="main-area-content">
                <div class="row what-is-happen">
                    <div class="col-1">
                        <img src="imagens/dog.jpg" alt="user-image" srcset="">
                    </div>
                    <form method="post" action="createPost" class="col-11 d-flex flex-column gap-1">
                        <div   class="text-area">
                            <input type="text" name="action" id="action" value="createPost" class="d-none">
                            <input type="number" name="idUser" id="idUser" value="<%= userId%>" class="d-none">
                            <input type="text" name="wih" id="wih" placeholder="O que está acontecendo?">
                        </div>
                        <div class="bar"></div>
                        <div class="d-flex justify-content-between">
                            <div class="icons">
                                <ion-icon name="images"></ion-icon>
                                <ion-icon name="gift"></ion-icon>
                                <ion-icon name="wallet"></ion-icon>
                                <ion-icon name="logo-tux"></ion-icon>
                                <ion-icon name="calendar" aria-labelledby="Programar" role="button" aria-roledescription="Programar"></ion-icon>
                                <ion-icon name="pin"></ion-icon>
                            </div>
                            <div class="btns mb-2">
                                <ion-icon name="add-circle-outline"></ion-icon>
                                <button class="btnPattern" type="submit">Publicar</button>
                            </div>
                        </div>
                    </form>
                </div>



                <jsp:useBean id="dao" class="Dao.PostDao"/>
                <c:forEach varStatus="post.id" var="post" items="${dao.get()}">
                    <t:post  post="${post}" userPhoto="sinoco.jpg"  />
                </c:forEach>

            </div>

        </div>
        <div class="col-3 topic-area">
            <div class="input-search">
                <ion-icon name="search"></ion-icon>
                <input type="text" name="search-topic" id="search-topic" placeholder="buscar no Twitthor">
            </div>

        </div>
    </div>
</main>
<script type="module" src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons/ionicons.esm.js"></script>
</body>
</html>