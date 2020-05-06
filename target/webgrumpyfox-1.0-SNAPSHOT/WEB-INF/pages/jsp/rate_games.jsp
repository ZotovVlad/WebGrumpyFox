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
    <tr>
        <th>№</th>
        <th>name</th>
        <th>description</th>
        <th>author</th>
        <th>rating</th>
        <th>awards</th>
        <th colspan="2">action</th>
    </tr>
    <c:forEach var="game" items="${gamesList}" varStatus="i">
        <tr>
            <td>${i.index + 1 + (page - 1) * 10}</td>
            <td>${game.name}</td>
            <td>${game.description}</td>
            <td>${game.author}</td>
            <td>${game.rating}</td>
            <td>${game.awards}</td>
            <td><a href="<c:url value="/game/${game.id}"/>">game</a></td>
        </tr>
    </c:forEach>
    <tr>
        <td colspan="7">
            <c:forEach begin="${1}" end="${pagesCount}" step="1" varStatus="i">
                <c:url value="/" var="url">
                    <c:param name="page" value="${i.index}"/>
                </c:url>
                <a href="${url}">${i.index}</a>
            </c:forEach>
        </td>
    </tr>
</div>

    <script src="<c:url value="/res/js/rate_games.js"/>"></script>
</body>
</html>