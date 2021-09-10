<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page session="false"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>GrumpyFox</title>

    <link href="<c:url value="/static/images/GrumpyFox.png"/>" rel="shortcut icon" type="image/x-icon"/>
    <link href="<c:url value="/static/css/index.css"/>" rel="stylesheet" type="text/css"/>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>

<body>
<%@ include file="nav_bar.jsp" %>
<%@ include file="cloud_animation.jsp" %>
<div class="container-fluid" style="position: absolute; margin: 70px 0px 0px 0px;">
    <div style="position: absolute;left: 45%;font-size: 20pt;">Top in the world games.</div>
    <div class="row" style="position: static; margin-left: 250px;">
        <c:forEach var="game" items="${gamesList}" varStatus="i">
            <div class="col-3 div-index" onclick="location.href='<c:url value="/game/${game.id}"/>'" style="z-index:1000; background-color: darkorange; margin: 100px 0px 5px 30px;box-shadow: 10px 10px 10px 10px rgba(10,10,10,0.5);border-radius:10px;border:10px black">
                <h2>${game.name}</h2>
                <h5>${game.description}</h5>
                <img src="<c:url value="/static/images/GrumpyFox.png"/>" alt="" width="200" height="150"/>
                <!--a style="width:100%; color: rebeccapurple" href="<c:url value="/game/${game.id}"/>">Play game!</a-->
            </div>
        </c:forEach>
    </div>
</div>

    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

    <script src="<c:url value="/static/js/index.js"/>"></script>

</body>
</html>