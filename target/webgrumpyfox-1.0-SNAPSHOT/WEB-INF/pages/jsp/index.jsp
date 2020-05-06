<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page session="false"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width">
    <title>GrumpyFox</title>

    <link href="<c:url value="/res/images/GrumpyFox.png"/>" rel="shortcut icon" type="image/x-icon"/>
    <link href="<c:url value="/res/css/index.css"/>" rel="stylesheet" type="text/css"/>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css" />

    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>

<body>
<!-- <div id="number"></div> -->
<div class="container">
    <canvas id=c></canvas>
    <div class="row">
        <div class="col-md-offset-3 col-md-6">
            <div class="tab" role="tabpanel">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active"><a href="#Section1" aria-controls="home" role="tab" data-toggle="tab">sign in</a></li>
                    <li role="presentation"><a href="#Section2" aria-controls="profile" role="tab" data-toggle="tab">sign up</a></li>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content tabs">
                    <div role="tabpanel" class="tab-pane fade in active" id="Section1">
                        <form class="form-horizontal" method="post" action="<c:url value="/authentication"/>">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Email address</label>
                                <input name="emailAddress" placeholder="emailAddress" class="form-control" id="exampleInputEmail1" value="${user.emailAddress}">
                                <p style="color: red">${errorEmailAddressAuth}</p>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <input type="password" name="password" placeholder="password" class="form-control" id="exampleInputPassword1" value="${user.password}">
                                <p style="color: red">${errorPasswordAuth}</p>
                            </div>
                            <div class="form-group">
                                <div class="main-checkbox">
                                    <input value="None" id="checkbox1" name="check" type="checkbox">
                                    <label for="checkbox1"></label>
                                </div>
                                <span class="text">Keep me Signed in</span>
                            </div>
                            <div class="form-group">
                                <button name="authentication" type="submit" class="btn btn-default">Sign in</button>
                                <p style="color: red">${errorSignInAuth}</p>
                            </div>
                            <div class="form-group forgot-pass">
                                <button type="submit" class="btn btn-default">forgot password</button>
                            </div>
                        </form>
                    </div>
                    <div role="tabpanel" class="tab-pane fade" id="Section2">
                        <form class="form-horizontal" method="post" action="<c:url value="/registration"/>">
                            <div class="form-group">
                                <label for="exampleInputLastName">Last Name</label>
                                <input name="lastName" placeholder="lastName" class="form-control" id="exampleInputLastName" value="${user.lastName}">
                                <p style="color: red">${errorLastNameReg}</p>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputFirstName">First Name</label>
                                <input name="firstName" placeholder="firstName" class="form-control" id="exampleInputFirstName" value="${user.firstName}">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail2">Email address</label>
                                <input name="emailAddress" placeholder="emailAddress" class="form-control" id="exampleInputEmail2" value="${user.emailAddress}">
                                <p style="color: red">${errorEmailAddressReg}</p>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword2">Password</label>
                                <input type="password" name="password" placeholder="password" class="form-control" id="exampleInputPassword2" value="${user.password}">
                                <p style="color: red">${errorPasswordReg}</p>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword3">Password confirm</label>
                                <input type="password" name="passwordConfirm" placeholder="passwordConfirm" class="form-control" id="exampleInputPassword3" value="${user.passwordConfirm}">
                                <p style="color: red">${errorPasswordConfirmReg}</p>
                            </div>
                            <div class="form-group">
                                <button name="registration" type="submit" class="btn btn-default">Sign up</button>
                                <p style="color: red">${errorSignUpReg}</p>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div><!-- /.col-md-offset-3 col-md-6 -->
    </div><!-- /.row -->
</div><!-- /.container -->



    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <script src="<c:url value="/res/js/index.js"/>"></script>
</body>
</html>