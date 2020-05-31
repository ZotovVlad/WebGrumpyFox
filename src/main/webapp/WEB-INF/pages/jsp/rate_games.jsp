<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page session="false"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width">
    <title>GrumpyFox</title>

    <link href="<c:url value="/static/images/GrumpyFox.png"/>" rel="shortcut icon" type="image/x-icon"/>
    <link href="<c:url value="/static/css/rate_games.css"/>" rel="stylesheet" type="text/css"/>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css" />

    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>

<body>
<div class="container">
    <table style="width:100%; color: antiquewhite">
    <tr>
        <th>№</th>
        <th>Name</th>
        <th>Description</th>
        <th>Author</th>
        <th>Rating</th>
        <th>Awards</th>
        <th colspan="2">Action</th>
    </tr>
    <c:forEach var="game" items="${gamesList}" varStatus="i">
        <tr>
            <td>${i.index + 1 + (page - 1) * 10}</td>
            <td>${game.name}</td>
            <td>${game.description}</td>
            <td>${game.author}</td>
            <td id = ${game.id}>${game.rating}</td>
            <td>${game.awards}</td>
            <td><a style="width:100%; color: rebeccapurple" href="<c:url value="/game/${game.id}"/>">Play game!</a></td>
        </tr>
    </c:forEach>
    <tr>
        <td colspan="7">
            <c:forEach begin="${1}" end="${pagesCount}" step="1" varStatus="i">
                <c:url value="/rate_games" var="url">
                    <c:param name="page" value="${i.index}"/>
                </c:url>
                <a style="width:100%; color: #9e79ff" href="${url}">${i.index}</a>
            </c:forEach>
        </td>
    </tr>
    </table>
</div>

    <script>

    jQuery(document).ready(function($) {

        $(document).ready(function(){
            updateRatingGames();
            setInterval('updateRatingGames()', 15000);
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

    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>

    <script src="<c:url value="/static/js/rate_games.js"/>"></script>
</body>
</html>