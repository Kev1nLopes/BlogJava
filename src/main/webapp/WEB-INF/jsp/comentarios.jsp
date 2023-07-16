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
          <a href="/api/">Pagina Inicial</a>

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
          ${sessionScope.authUser.userName}


        </div>
        <a href="logout"  style="color: red; text-align: center">Logout</a>

      </div>

    </div>
    <div class="col-6 main-area p-0">
      <div class="main">
        <!-- Header area -->
        <header>
          <h3 id="page-title">
            <a href="/api/">
              <- Voltar
            </a>
            </h3>
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

            <div class="row post" post-action-id="${post.id}" style="background: #939393">
              <div class="col-1">
                <img src="<c:url value="/imagens/dog.jpg"/>" alt="user-image" srcset="">
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
                        <c:if test="${post.user.id == userId}">
                          <li style="border-bottom-left-radius: 1rem; border-bottom-right-radius: 1rem">
                            <a style="color: red" href="post?postId=${post.id}&action=delete">
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

            <c:if test="${comments.size() > 0}">
              <c:forEach items="${comments}" var="comment">
                <div class="row post" post-action-id="${comment.id}" >
                  <div class="col-1">
                    <img src="<c:url value="/imagens/dog.jpg"/>" alt="user-image" srcset="">
                  </div>
                  <div class="col-11 d-flex flex-column">
                    <div class="user-info">
                      <div class="d-flex gap-1">
                        <span> ${comment.user.userName}</span>
                        <small>@ ${comment.user.userName}</small>
                      </div>
                      <button>
                        ...
                        <div class="menu">
                          <ul class="d-flex flex-column p-0">
                            <li style="border-top-left-radius: 1rem; border-top-right-radius: 1rem">Seguir @${comment.user.userName}</li>
                            <li>Silênciar</li>
                            <li>Bloquear</li>
                            <li>Denunciar</li>
                            <c:if test="${comment.user.id == userId}">
                              <li style="border-bottom-left-radius: 1rem; border-bottom-right-radius: 1rem">
                                <a style="color: red" href="post?postId=${comment.id}&action=delete">
                                  Apagar
                                </a>
                              </li>
                            </c:if>

                          </ul>
                        </div>
                      </button>
                    </div>

                    <div class="post-content">
                        ${comment.content}
                    </div>
                    <div class="post-actions d-flex justify-content-between w-75 mt-2">
                      <a href="/api/comentarios/${comment.id}">
                        <ion-icon name="chatboxes"  class="pointer"></ion-icon>
                      </a>

                      <ion-icon name="share-alt"></ion-icon>
                      <!--Quando curtido mostrar o outro coracao -->
                      <div class="d-flex align-items-center justify-content-center">

                        <c:choose>

                          <c:when test="${comment.ILiked == 1}">
                            <a href="/api/deslike/${comment.id}">
                              <ion-icon name="heart" style="cursor: pointer" ></ion-icon>
                            </a>

                          </c:when>
                          <c:when test="${comment.ILiked == 0}">
                            <a href="/api/like/${comment.id}">
                              <ion-icon name="heart-empty" style="cursor: pointer"></ion-icon>
                            </a>
                          </c:when>
                        </c:choose>
                        <p class="p-0 m-0" id="postCurtidas" style="color: black">${comment.curtidas}</p>

                      </div>

                      <ion-icon name="bookmark"></ion-icon>
                      <ion-icon name="cash"></ion-icon>
                    </div>

                  </div>

                </div>
              </c:forEach>
            </c:if>

            <c:if test="${comments.size() == 0}">
              Esse post nao possui comentarios
            </c:if>

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



<script type="module" src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons/ionicons.esm.js"></script>


</body>
</html>