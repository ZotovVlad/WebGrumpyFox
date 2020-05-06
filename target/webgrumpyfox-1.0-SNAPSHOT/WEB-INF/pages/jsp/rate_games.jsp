<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width">
    <title>GrumpyFox</title>

    <link href="<c:url value="/res/images/GrumpyFox.png"/>" rel="shortcut icon" type="image/x-icon"/>
    <link href="<c:url value="/res/css/rate_games.css"/>" rel="stylesheet" type="text/css"/>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css" />
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
        <th colspan="2">action</th>
    </tr>
    <c:forEach var="game" items="${gamesList / 2}" varStatus="i">
        <tr>
            <td>${i.index + 1 + (page - 1) * 10}</td>
            <td>${game.name}</td>
            <td>${game.description}</td>
            <td>${game.author}</td>
            <td>${game.rating}</td>
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

    <script src="<c:url value="/res/js/rate_games.js"/>"></script>
</body>
</html>