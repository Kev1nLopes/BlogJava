<%@ attribute name="userPhoto" required="true" %>
<%@ attribute name="date" %>
<%@ attribute name="post" required="true" type="Models.Post" %>
<%@ tag language="java" pageEncoding="UTF-8" isELIgnored="false" %>

<div class="row post">
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
                        <li>Seguir @${post.user.userName}</li>
                        <li>Silênciar</li>
                        <li>Bloquear</li>
                        <li>Denunciar</li>
                    </ul>
                </div>
            </button>
        </div>

        <div class="post-content">
            ${post.content}
        </div>

    </div>

</div>