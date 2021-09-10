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
    <link href="<c:url value="/static/css/rate_games.css"/>" rel="stylesheet" type="text/css"/>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>

<body>
<%@ include file="nav_bar.jsp" %>
<%@ include file="cloud_animation.jsp" %>
<div class="container">
    <table style="width:100%; color: antiquewhite;border-spacing: 0px 30px;">
    <tr style="border: 5px black; box-shadow: 0px 1px 10px black;">
        <th style="padding: 10px 0px 10px 0px;"><div class="col-12 div-index" style="z-index:1000;">Name</div></th>
        <th style="padding: 10px 0px 10px 0px;"><div class="col-12 div-index" style="z-index:1000;">Description</div></th>
        <th style="padding: 10px 0px 10px 0px;"><div class="col-12 div-index" style="z-index:1000;">Author</div></th>
        <th style="padding: 10px 0px 10px 0px;"><div class="col-12 div-index" style="z-index:1000;">Rating</div></th>
        <th style="padding: 10px 0px 10px 0px;"><div class="col-12 div-index" style="z-index:1000;">Awards</div></th>
        <th style="padding: 10px 0px 10px 0px;" colspan="2"><div class="col-12 div-index" style="z-index:1000;">Action</div></th>
    </tr>
    <c:forEach var="game" items="${gamesList}" varStatus="i">
        <tr style="margin: 50px; border-radius: 5px; border: 5px black; box-shadow: 2px 2px 2px 2px black;">
            <td style="padding: 10px 0px 10px 0px;"><div class="col-12 div-index" style="z-index:1000;">${game.name}</div></td>
            <td style="padding: 10px 0px 10px 0px;"><div class="col-12 div-index" style="z-index:1000;">${game.description}</div></td>
            <td style="padding: 10px 0px 10px 0px;"><div class="col-12 div-index" style="z-index:1000;">${game.author}</div></td>
            <td style="padding: 10px 0px 10px 0px;"><div class="col-12 div-index" style="z-index:1000;" id=${game.id}>${game.rating}</div></td>
            <td style="padding: 10px 0px 10px 0px;"><div class="col-12 div-index" style="z-index:1000;">${game.awards}</div></td>
            <td style="padding: 10px 0px 10px 0px;"><a class="col-12 div-index" style="width:100%; color: rebeccapurple; z-index:1000;" href="<c:url value="/game/${game.id}"/>">Play game!</a></td>
        </tr>
    </c:forEach>
    </table>
</div>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

    <script src="<c:url value="/static/js/rate_games.js"/>"></script>

<script>
    updateRatingGamesInterval = 60000;
    jQuery(document).ready(function($) {
        $(document).ready(function(){
            updateRatingGames();
            setInterval('updateRatingGames()', updateRatingGamesInterval);
        });
    });
    function updateRatingGames() {
        $.ajax({
            type : "GET",
            contentType : "application/json",
            url : "${home}/updateRatingGames",
            data : JSON.stringify(""),
            dataType : 'json',
            timeout : 100000,
            async: true,
            success : function(data) {
                console.log("SUCCESS: ", data);
                displayUpdateRatingGames(data);
            },
            error : function(e) {
                console.log("ERROR: ", e);
                displayUpdateRatingGame(e);
            },
            done : function(e) {
                console.log("DONE");
                enableSearchButton(true);
            }
        });
    }

    function displayUpdateRatingGames(data) {
        var json = JSON.stringify(data, null, 4);
        var obj = jQuery.parseJSON(json);
        var str = obj.result;
        str = str.split(",");
        for (var i = 0; i < str.length; i++) {
            var id = i + 1;
            $("#" + id).html(str[i]);
        }

    }
</script>

</body>
</html>