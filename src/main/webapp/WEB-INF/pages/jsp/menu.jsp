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
<%@ include file="nav_bar.jsp" %>
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