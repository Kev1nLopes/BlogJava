<%@ page import="devcon.models.User" %>
<%--<%@ page import="java.util.List" %>--%>
<%--<%@ page isELIgnored="false" %>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@	taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"	%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>



<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta http-equiv="content-type" charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Twithor</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link rel="stylesheet" href="<c:url value="/css/common.css"/>"/>
</head>
<body>
<main class="container ">

    <div class="row m-0" style="min-height: 100vh; height: 100%;">
        <div class="col-3 d-flex flex-column gap-3">
            <img src="imagens/twittor.png" alt="twitter-logo">
            <ul class="p-0 d-flex flex-column gap-3">
                <li class="d-flex align-items-center gap-2">
                    <ion-icon name="heart"></ion-icon>
                    <a href="/api/">Pagina inicial</a>

                </li>
                <li class="d-flex align-items-center gap-2">
                    <ion-icon name="search"></ion-icon>
                    <a href="/api/follow/not">Descobrir pessoas</a>

                </li>
                <li class="d-flex align-items-center gap-2">
                    <ion-icon name="notifications"></ion-icon>
                    <a href="/api/follow">Seguindo</a>

                </li>
                <li class="d-flex align-items-center gap-2">
                    <ion-icon name="text"></ion-icon>
                    <a href="/api/follow/me">Seguidores</a>

                </li>


            </ul>
            <div class="user-info mt-auto mb-3 d-flex flex-column ">
                <div class="d-flex gap-2 mx-auto" style="border: 1px solid gray; border-radius: 2rem; width: fit-content; padding: 10px">
                    <img src="imagens/dog.jpg" alt="user-image" srcset="" width="25" class="rounded-circle">
                    <a href="/api/profile">
                        ${sessionScope.authUser.userName}
                    </a>



                </div>
                <a href="logout"  style="color: red; text-align: center">Logout</a>

            </div>

        </div>
        <div class="col-6 main-area p-0">
            <div class="main">
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

                        <form:form method="post" action="/api/add" modelAttribute="post" cssClass="col-11 d-flex flex-column gap-1">
                            <div   class="text-area">
<%--                                <div class="d-flex flex-column col-10 d-none">--%>
<%--                                    <form:label path="user.id">Usuario:</form:label>--%>
<%--                                    <form:input type="text" path="user.id" cssClass="inputForm" autocomplete="false" value="<%=user.Id%>"/>--%>
<%--                                </div>--%>
                                <div class="d-flex flex-column col-10 ">
<%--                                    <form:label path="content">Usuario:</form:label>--%>
                                    <form:input type="text" path="content" id="wih" autocomplete="false" placeholder="O que está acontecendo?"/>
                                </div>
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
                        </form:form>
                    </div>


                    <div class="d-flex flex-column-reverse">
                        <c:forEach items="${posts}" var="post">
                            <div class="row post" post-action-id="${post.id}">
                                <div class="col-1">
                                    <img src="imagens/dog.jpg" alt="user-image" srcset="">
                                </div>
                                <div class="col-11 d-flex flex-column">
                                    <div class="user-info">
                                        <div class="d-flex gap-1">
                                            <span> ${post.user.userName}</span>
                                            <small>@ ${post.user.userName}</small>
                                        </div>
                                        <button>
                                            ...
                                            <div class="menu">
                                                <ul class="d-flex flex-column p-0">
                                                    <li style="border-top-left-radius: 1rem; border-top-right-radius: 1rem">Seguir @${post.user.userName}</li>
                                                    <li>Silênciar</li>
                                                    <li>Bloquear</li>
                                                    <li>Denunciar</li>
                                                    <c:if test="${post.user.id ==  sessionScope.authUser.id}">
                                                        <li style="border-bottom-left-radius: 1rem; border-bottom-right-radius: 1rem">
                                                            <a style="color: red" href="/api/delete/${post.id}">
                                                                Apagar
                                                            </a>
                                                        </li>
                                                    </c:if>

                                                </ul>
                                            </div>
                                        </button>
                                    </div>

                                    <div class="post-content">
                                            ${post.content}
                                    </div>
                                    <div class="post-actions d-flex justify-content-between w-75 mt-2">
                                        <a href="/api/comentarios/${post.id}">
                                            <ion-icon name="chatboxes"  class="pointer"></ion-icon>
                                        </a>

                                        <ion-icon name="share-alt"></ion-icon>
                                        <!--Quando curtido mostrar o outro coracao -->
                                        <div class="d-flex align-items-center justify-content-center">

                                            <c:choose>

                                                <c:when test="${post.ILiked == 1}">
                                                    <a href="/api/deslike/${post.id}">
                                                        <ion-icon name="heart" style="cursor: pointer" ></ion-icon>
                                                    </a>

                                                </c:when>
                                                <c:when test="${post.ILiked == 0}">
                                                    <a href="/api/like/${post.id}">
                                                        <ion-icon name="heart-empty" style="cursor: pointer"></ion-icon>
                                                    </a>
                                                </c:when>
                                            </c:choose>
                                            <p class="p-0 m-0" id="postCurtidas" style="color: black">${post.curtidas}</p>

                                        </div>

                                        <ion-icon name="bookmark"></ion-icon>
                                        <ion-icon name="cash"></ion-icon>
                                    </div>

                                </div>

                            </div>

                        </c:forEach>

                    </div>


                    <div id="overlay" onclick="closeModal()"></div>
                    <div id="modal-comentario">
                        <div class="modal-user-info">

                        </div>
                        <div class="modal-content">

                        </div>

                    </div>
                </div>
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


<script>
    function closeModal() {

        document.getElementById("overlay").style.display = "none";
        document.getElementById("modal-comentario").style.display = "none";
        const postModal = document.getElementById("modal-comentario").innerHTML = "";

    }
     function openModal(id) {
        console.log(id);
        let listJson =  getPostComments(id);
         for (let i of listJson) {
             let post = document.querySelector('.post').cloneNode(true);
             console.log(i);
             post.querySelector('.user-info').querySelector('span').textContent = i.Id;
             post.querySelector('.post-content').textContent = i.Content;
             post.querySelector('#postCurtidas').textContent = i.Curtidas;
             document.querySelector('#modal-comentario').appendChild(post);
         }

        document.getElementById("overlay").style.display = "block";
        document.getElementById("modal-comentario").style.display = "block";

    }

     async function getPostComments(id){

        const response = await fetch('http://localhost:8080/BlogJava/post', {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: "action=" + "getComments" + "&postId=" + id
        });
        console.log(response);

         const list = await response.text();
         const listJson = JSON.parse(list);
            return listJson;



    }

    async function getPost(id){
        await fetch('http://localhost:8080/BlogJava/post', {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: "action=" + "getPost" + "&postId=" + id
        })
            .then(response => response.json())
            .then((data)=> data)
            .catch((err) =>{
                console.log(err)
            })
    }


</script>
<script type="module" src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons/ionicons.esm.js"></script>


</body>
</html>