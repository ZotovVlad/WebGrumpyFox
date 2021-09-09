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
    <link href="<c:url value="/static/css/rate_users.css"/>" rel="stylesheet" type="text/css"/>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>

<body>
<div id="Clouds">
    <div class="Cloud Foreground"></div>
    <div class="Cloud Background"></div>
    <div class="Cloud Foreground"></div>
    <div class="Cloud Background"></div>
    <div class="Cloud Foreground"></div>
    <div class="Cloud Background"></div>
    <div class="Cloud Background"></div>
    <div class="Cloud Foreground"></div>
    <div class="Cloud Background"></div>
    <div class="Cloud Background"></div>
</div>
<%@ include file="nav_bar.jsp" %>
<div class= "wrapper">
    <div class="container">
        <table style="width:100%; color: antiquewhite;border-spacing: 0px 30px;">
            <tr style="border: 5px black; box-shadow: 0px 1px 10px black;">
                <th style="padding: 10px 10px 10px 10px;"><div class="col-12 div-index" style="z-index:1000;">Last Name</div></th>
                <th style="padding: 10px 10px 10px 10px;"><div class="col-12 div-index" style="z-index:1000;">First Name</div></th>
                <th style="padding: 10px 10px 10px 10px;"><div class="col-12 div-index" style="z-index:1000;">Rating user</div></th>
            </tr>
            <c:forEach var="user" items="${usersList}" varStatus="i">
                <tr style="border-radius: 5px; border: 5px black; box-shadow: 2px 2px 2px 2px black;">
                    <td style="padding: 10px 10px 10px 10px;"><div class="col-12 div-index" style="z-index:1000;">${user.lastName}</div></td>
                    <td style="padding: 10px 10px 10px 10px;"><div class="col-12 div-index" style="z-index:1000;">${user.firstName}</div></td>
                    <td style="padding: 10px 10px 10px 10px;"><div class="col-12 div-index" style="z-index:1000;">${user.ratingUser}</div></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>


    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

    <script src="<c:url value="/static/js/rate_users.js"/>"></script>
</body>
</html>