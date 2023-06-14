<%@ attribute name="userPhoto" required="true" %>
<%@ attribute name="date" %>
<%@ attribute name="post" required="true" type="Models.Post" %>
<%@ tag language="java" pageEncoding="UTF-8" isELIgnored="false" %>

<div class="row p-2 my-2 post" >
    <img class="col-md-2 rounded-circle" src="http://localhost:8080/BlogJava/imagens/sinoco.jpg" />
    <div class="col-10 d-flex flex-column">
        <p class="d-flex flex-column">
            <strong>
                ${post.user.userName}
            </strong>
            @${post.user.userName}
        </p>
        <p>
            ${post.content}
        </p>
        <div class="d-flex w-100 justify-content-between">
            <div class="actions d-flex gap-2">
                <p>I</p>
                <p>I</p>
                <p>I</p>
                <p>I</p>
                <p>I</p>
                <p>I</p>
            </div>

        </div>

    </div>

</div>