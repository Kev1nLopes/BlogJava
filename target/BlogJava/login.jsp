<%--
  Created by IntelliJ IDEA.
  User: Kevin Lopes
  Date: 15/06/2023
  Time: 00:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="cadastro"%>

<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css" />
</head>
<style>
    body{
        background: rgba(47, 112, 175, 0.3);
    }
    .formTemplate{
        max-width: 1024px;
        width: 100%;
        min-width: 500px;
        max-height: 500px;
        height: 100%;
        padding: 30px;
        border-radius: 1rem;
        -webkit-box-shadow: -1px 0px 23px 0px rgba(0,0,0,0.75);
        -moz-box-shadow: -1px 0px 23px 0px rgba(0,0,0,0.75);
        box-shadow: -1px 0px 23px 0px rgba(0,0,0,0.75);
        background: #02315E;
        transition: all 0.5s ease-in-out;
    }


    .left-area{
        padding: 30px;
    }
    .right-area{
        background: white;
        border-radius: 1rem;
        overflow: auto;

    }

    h3,p{
        color: aliceblue;
        font-weight: bold;
        font-family: Cambria, cursive;
    }

    small{
        font-size: 15px;
        color: gray;

    }
    small span{
        color: #02315E;
        font-width: bold;
    }

</style>
<body style="display: flex; justify-content: center; align-items: center; height: 100vh; width: 100vw;">
<div class="row formTemplate">
    <div class="left-area col-6 row flex-column align-items-center justify-content-center">
        <h3 class="text-center">Anti-LGPD</h3>
        <p>
            Se você quer que seu e-mail esteja lotado todos os dias, com mensagens agradaveis,
            com noticias da semana e muito spam aleatório e coisas inuteis, você está no lugar certo,
            aqui nós vendemos seus dados em troca de nada! Apenas ajudando a evolução humana!
        </p>
    </div>
    <div class="right-area col-6 ">



        <form method="POST" action="login" id="login" style="height: calc(100% - 60px);" class=" row flex-column align-items-center justify-content-center gap-3">
            <small class="text-center">Ainda não possui conta ? <a href="cadastroUsuario.jsp">Cadastre-se</a></small>
            <cadastro:inputForm id="Usuario" place="Informe seu usuario" type="text" ></cadastro:inputForm>
            <cadastro:inputForm id="Senha" place="Informe sua senha" type="text"></cadastro:inputForm>
            <div class="col-12 d-flex align-items-center  justify-content-center">
                <button  type="submit" class="btnPattern sucess w-75" >Entrar</button>
            </div>
        </form>

    </div>

</div>
<script src="./js/index.js"></script>

</body>
</html>
