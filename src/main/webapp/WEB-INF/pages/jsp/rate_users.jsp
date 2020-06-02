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

    <link rel="stylesheet" href="https://bootstraptema.ru/plugins/2015/bootstrap3/bootstrap.min.css" />
    <link rel="stylesheet" href="https://bootstraptema.ru/plugins/font-awesome/4-4-0/font-awesome.min.css" />
    <link href="https://bootstraptema.ru/snippets/element/2020/bootstrap-table.css" rel="stylesheet" />
    <link href='https://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>

</head>

<body>
<%@ include file="nav_bar.jsp" %>
<div class= "wrapper">
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div class= "fresh-table full-color-orange">
                    <!-- Изменение фона таблицы: full-color-blue, full-color-azure, full-color-green, full-color-red, full-color-orange
                    Изменение фона тулбара страницы: toolbar-color-blue, toolbar-color-azure, toolbar-color-green, toolbar-color-red, toolbar-color-orange
                    -->
                    <table id="fresh-table" class="table">
                        <thead>

                        <th data-field="id" >#</th>
                        <th data-field="firstName" data-sortable="true">firstName</th>
                        <th data-field="lastName" data-sortable="true">lastName</th>
                        <th data-field="emailAddress" data-sortable="true">emailAddress</th>
                        <th data-field="password" data-sortable="true">password</th>
                        <th data-field="actions" data-formatter="operateFormatter" data-events="operateEvents">Actions</th>
                        </thead>
                        <tbody>
                        <tr>
                            <td>${getId1}</td>
                            <td>${getFirstName1}</td>
                            <td>${getLastName1}</td>
                            <td>${getEmailAddress1}</td>
                            <td>${getPassword1}</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>${getId2}</td>
                            <td>${getFirstName2}</td>
                            <td>${getLastName2}</td>
                            <td>${getEmailAddress2}</td>
                            <td>${getPassword2}</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>Sage Rodriguez</td>
                            <td>Rodie</td>
                            <td>Netherlands</td>
                            <td>Chess</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>Philip Chaney</td>
                            <td>Philly</td>
                            <td>Korea, South</td>
                            <td>Chess</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td>Doris Greene</td>
                            <td>Gossamery</td>
                            <td>Malawi</td>
                            <td>Chess</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>6</td>
                            <td>Mason Porter</td>
                            <td>MassX</td>
                            <td>Chile</td>
                            <td>Chess</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>7</td>
                            <td>Alden Chen</td>
                            <td>Cart</td>
                            <td>Finland</td>
                            <td>Chess</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>8</td>
                            <td>Colton Hodges</td>
                            <td>Col9</td>
                            <td>Nicaragua</td>
                            <td>Chess</td>
                            <td></td>
                        </tr>
                        <tr>
                </div>
            </div>
        </div>
    </div>
</div>


    <script src="https://bootstraptema.ru/plugins/jquery/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="http://bootstraptema.ru/plugins/2015/b-v3-3-6/bootstrap.min.js"></script>
    <script type="text/javascript" src="https://bootstraptema.ru/snippets/element/2020/bootstrap-table.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bubbly-bg@1.0.0/dist/bubbly-bg.js"></script>

    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

    <script src="<c:url value="/static/js/rate_users.js"/>"></script>
</body>
</html>