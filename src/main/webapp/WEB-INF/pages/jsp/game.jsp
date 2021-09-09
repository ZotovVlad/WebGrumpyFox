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
    <link href="<c:url value="/static/css/game.css"/>" rel="stylesheet" type="text/css"/>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>

<body>
<%@ include file="nav_bar.jsp" %>
<%@ include file="cloud_animation.jsp" %>
    <div class="container emp-game">
        <form method="post">
            <div class="row">
                <div class="col-md-6 div-index" style="z-index:1000;">
                    <div class="game-head">
                        <h4>
                            <center> ${gameName} </center>
                        </h4>
                        <h6 style="padding-left: 15px;">
                            ${gameDescription}
                        </h6>
                        </br>
                        <div class="col-md-3 div-index" style="z-index:1000;">
                            <input type="submit" class="game-play-btn" name="btnAddMore" value="Play NOW"/>
                        </div>
                    </div>
                </div>
                <!--div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                 </div-->
                <div class="col-md-6" style="z-index:1000;">
                    <div class="progressBar">
                        <div class="greenBar" id="gameRating">${gameRating}</div>
                        <div class="rightSide">
                            <button id="like" type="button" class="buttonPlus">+</button>
                            <p></p>
                            <button id="dislike" type="button" class="buttonMinus">-</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

    <script src="<c:url value="/static/js/game.js"/>"></script>
</body>
</html>