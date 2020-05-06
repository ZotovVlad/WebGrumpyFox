<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width">
    <title>GrumpyFox</title>

    <link href="<c:url value="/res/images/GrumpyFox.png"/>" rel="shortcut icon" type="image/x-icon"/>
    <link href="<c:url value="/res/css/rate_users.css"/>" rel="stylesheet" type="text/css"/>

    <link rel="stylesheet" href="https://bootstraptema.ru/plugins/2015/bootstrap3/bootstrap.min.css" />
    <link rel="stylesheet" href="https://bootstraptema.ru/plugins/font-awesome/4-4-0/font-awesome.min.css" />
    <link href='https://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
    <link href="https://bootstraptema.ru/snippets/element/2020/bootstrap-table.css" rel="stylesheet" />

</head>

<body>

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

    <script src="<c:url value="/res/js/rate_users.js"/>"></script>
</body>
</html>