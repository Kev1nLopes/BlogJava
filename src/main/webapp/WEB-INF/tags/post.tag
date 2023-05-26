<%@ attribute name="content" required="true" %>
<%@ attribute name="userPhoto" required="true" %>
<%@ attribute name="date" %>
<%@ attribute name="user" required="true" type="Models.User" %>
<%@ tag language="java" pageEncoding="UTF-8" isELIgnored="false" %>

<div class="row p-2 my-2 post" >
    <img class="col-md-2 rounded-circle" src="http://localhost:8080/BlogJava/imagens/sinoco.jpg" />
    <div class="col-10 d-flex flex-column">
        <p class="d-flex">
            <strong>
                ${user.userName}
            </strong>
            @${user.userName}
        </p>
        <p>
            ${content}
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