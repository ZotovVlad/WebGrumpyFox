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
    <link href="<c:url value="/static/css/menu.css"/>" rel="stylesheet" type="text/css"/>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>

<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#"><img src="<c:url value="/static/images/GrumpyFox.png"/>" alt="GrumpyFox" height="42" width="42"></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item ">
                <a class="nav-link" href="#">
                    Home
                </a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" href="#">
                    Games
                </a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Rating
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" onclick="location.href='<c:url value="/rate_games"/>'" class="nav-link" href="#">Games </a>
                    <a class="dropdown-item" onclick="location.href='<c:url value="/rate_users"/>'" class="nav-link" href="#">Users </a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Account
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" onclick="location.href='<c:url value="/profile"/>'" class="nav-link" href="#">Profile</a>
                    <a class="dropdown-item" onclick="location.href='<c:url value="/"/>'" class="nav-link" href="#">Sign out</a>
                </div>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>
<div class="container-fluid" style="position: absolute; margin: 100px 0px 0px 0px;">
    <div class="row"  style="position: static;">
        <div id="number" class="col-3 bg-success" style="margin: 10px auto 5px auto;">.col-3</div>
        <div id="number" class="col-3 bg-warning" style="margin: 10px auto 5px auto;">.col-3</div>
        <div id="number" class="col-3 bg-success" style="margin: 10px auto 5px auto;">.col-3</div>
    </div>
    <div class="row" style="position: static">
        <div id="number"  class="col-3 bg-success" style="margin: 100px auto 5px auto;">.col-3</div>
        <div id="number" class="col-3 bg-warning" style="margin: 100px auto 5px auto;">.col-3</div>
        <div id="number" class="col-3 bg-success" style="margin: 100px auto 5px auto;">.col-3</div>
    </div>
</div>
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



<script>

    jQuery(document).ready(function($) {

        $(document).ready(function(){
            show();
            setInterval('show()', 5000);
        });

        /*$("#search-form").submit(function(event) {

            //Disble the search button
            enableSearchButton(false);

            //Prevent the form from submitting via the browser.
            event.preventDefault();

            searchViaAjax();

        });*/

    });

    var user = {}
    user["lastName"] = "user0";
    user["emailAddress"] = "email0";

    function show() {

        user["lastName"] += "user0";
        user["emailAddress"] += "email0";

        //search["username"]= $("#username").val();
        //search["email"]= $("#email").val();

        $.ajax({
            type : "POST",
            contentType : "application/json",
            url : "${home}rating/getRatingResult",
            data : JSON.stringify(user),
            dataType : 'json',
            timeout : 100000,
            success : function(data) {
                console.log("SUCCESS: ", data);
                display(data);
            },
            error : function(e) {
                console.log("ERROR: ", e);
                display(e);
            },
            done : function(e) {
                console.log("DONE");
                enableSearchButton(true);
            }
        });

    }

    function enableSearchButton(flag) {
        $("#btn-search").prop("disabled", flag);
    }

    function display(data) {
        var json = JSON.stringify(data, null, 4);
        var obj = jQuery.parseJSON(json);
        var str = obj.result;
        $('#number').html(str);
    }

</script>



    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

    <script src="<c:url value="/static/js/menu.js"/>"></script>
</body>
</html>