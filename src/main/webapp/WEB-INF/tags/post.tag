<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="userPhoto" required="true" %>
<%@ attribute name="date" %>
<%@ attribute name="post" required="true" type="Models.Post" %>
<%@ tag language="java" pageEncoding="UTF-8" isELIgnored="false" %>

<%
    int userId = (int) request.getSession().getAttribute("userId");
    String user = (String) request.getSession().getAttribute("Usuario");

%>

<div class="row post" post-action-id="${post.id}">
    <div class="col-1">
        <img src="imagens/dog.jpg" alt="user-image" srcset="">
    </div>
    <div class="col-11 d-flex flex-column">
        <div class="user-info">
            <div class="d-flex gap-1">
                <span>${post.id} ${post.user.userName}</span>
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
            <ion-icon name="chatboxes"  class="pointer" onclick="openModal(${post.id})"></ion-icon>
            <ion-icon name="share-alt"></ion-icon>
            <!--Quando curtido mostrar o outro coracao -->
            <div class="d-flex align-items-center justify-content-center">

                <c:choose>
                    <c:when test="${post.ILiked == 1}">
                        <ion-icon name="heart"></ion-icon>
                    </c:when>
                    <c:when test="${post.ILiked == 0}">
                        <ion-icon name="heart-empty"></ion-icon>
                    </c:when>
                </c:choose>
                <p class="p-0 m-0" id="postCurtidas">${post.curtidas}</p>

            </div>

            <ion-icon name="bookmark"></ion-icon>
            <ion-icon name="cash"></ion-icon>
        </div>

    </div>

</div>


