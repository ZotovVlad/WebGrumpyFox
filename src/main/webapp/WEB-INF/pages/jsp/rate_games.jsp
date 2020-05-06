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
    <div class="row">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 style="margin:5px">
                </h3>
            </div>
            <table class="table table-fixed">
                <thead>
                <tr>
                    <th class= "col-xs-2">#</th><th class="col-xs-8">Game</th><th class="col-xs-2">Rating</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td class="col-xs-2">1</td><td class="col-xs-8">Chess</td><td class="col-xs-2">
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                </td>
                </tr>
                <tr>
                    <td class="col-xs-2">2</td><td class="col-xs-8">Pacman</td><td class="col-xs-2">
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                </td>
                </tr>
                <tr>
                    <td class="col-xs-2">3</td><td class="col-xs-8">Snake</td><td class="col-xs-2">
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                </tr>
                <tr>
                    <td class="col-xs-2">4</td><td class="col-xs-8">Fireboy and Watergirl</td><td class="col-xs-2">
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star"></span>
                </td>
                </tr>
                <tr>
                    <td class="col-xs-2">5</td><td class="col-xs-8">Raid</td><td class="col-xs-2">
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star"></span>
                </td>
                </tr>
                <tr>
                    <td class="col-xs-2">6</td><td class="col-xs-8">2048</td><td class="col-xs-2">
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star"></span>
                </td>
                </tr>
                <tr>
                    <td class="col-xs-2">7</td><td class="col-xs-8">X_0</td><td class="col-xs-2">
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star"></span>
                    <span class="fa fa-star"></span>
                </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

    <script src="<c:url value="/res/js/rate_games.js"/>"></script>
</body>
</html>