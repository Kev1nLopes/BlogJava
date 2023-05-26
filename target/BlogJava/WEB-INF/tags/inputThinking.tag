<%@ attribute name="place" required="true"  %>
<%@ attribute name="imgUrl" required="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ tag language="java" pageEncoding="UTF-8" isELIgnored="false" %>



<div class="d-flex flex-column">
    <div class="row align-items-center justify-content-center">
        <img class="col-2 rounded-circle" src="http://localhost:8080/BlogJava/imagens/${imgUrl}">
        <div class="col-10 d-flex flex-column">
            <input  type="text" placeholder="${place}" id="inputThinking" />
            <div class="d-flex w-100 justify-content-between">
                <div class="actions d-flex gap-2">
                    <p>I</p>
                    <p>I</p>
                    <p>I</p>
                    <p>I</p>
                    <p>I</p>
                    <p>I</p>
                </div>
                <button class="ui-button bg-success rounded p-2 ">
                    Twettar
                </button>
            </div>

        </div>

    </div>
</div>




