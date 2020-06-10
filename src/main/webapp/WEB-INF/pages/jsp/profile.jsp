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
    <!--link href="<c:url value="/static/css/profile.css"/>" rel="stylesheet" type="text/css"/-->

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <style>
        html,body{margin:0;padding:0}
        html{height:100%}
        body{min-height:100%;color:#FFF;background-color:#FD940A;background-image:radial-gradient(circle,#F9A72B 0%,#FA9026 70%,#FB6C1F 100%)}
        #Clouds{position:absolute;top:0;right:0;bottom:0;left:0;margin:auto;height:30%;overflow:hidden;-webkit-animation:FadeIn 3s ease-out;animation:FadeIn 3s ease-out;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none}
        @-webkit-keyframes FadeIn {
            from{opacity:0}
            to{opacity:1}
        }
        @keyframes FadeIn {
            from{opacity:0}
            to{opacity:1}
        }
        .Cloud{position:absolute;width:100%;background-repeat:no-repeat;background-size:auto 100%;height:70px;-webkit-animation-duration:120s;animation-duration:120s;-webkit-animation-iteration-count:infinite;animation-iteration-count:infinite;-webkit-animation-fill-mode:forwards;animation-fill-mode:forwards;-webkit-animation-timing-function:linear;animation-timing-function:linear;-webkit-animation-name:Float,FadeFloat;animation-name:Float,FadeFloat;z-index:1}
        .Cloud.Foreground{height:10%;min-height:20px;z-index:3}
        .Cloud.Background{height:9.09090909%;min-height:8px;-webkit-animation-duration:210s;animation-duration:210s}
        @-webkit-keyframes Float {
            from{-webkit-transform:translateX(100%) translateZ(0);transform:translateX(100%) translateZ(0)}
            to{-webkit-transform:translateX(-15%) translateZ(0);transform:translateX(-15%) translateZ(0)}
        }
        @keyframes Float {
            from{-webkit-transform:translateX(100%) translateZ(0);transform:translateX(100%) translateZ(0)}
            to{-webkit-transform:translateX(-15%) translateZ(0);transform:translateX(-15%) translateZ(0)}
        }
        @-webkit-keyframes FadeFloat {
            0%,100%{opacity:0}
            5%,90%{opacity:1}
        }
        @keyframes FadeFloat {
            0%,100%{opacity:0}
            5%,90%{opacity:1}
        }
        .Cloud:nth-child(10){-webkit-animation-delay:-184.61538462s;animation-delay:-184.61538462s;top:60%}
        .Cloud.Foreground:nth-child(10){-webkit-animation-duration:80s;animation-duration:80s;height:35%}
        .Cloud.Background:nth-child(10){-webkit-animation-duration:110s;animation-duration:110s;height:-3.40909091%}
        .Cloud:nth-child(9){-webkit-animation-delay:-166.15384615s;animation-delay:-166.15384615s;top:54%}
        .Cloud.Foreground:nth-child(9){-webkit-animation-duration:84s;animation-duration:84s;height:32.5%}
        .Cloud.Background:nth-child(9){-webkit-animation-duration:114s;animation-duration:114s;height:-2.15909091%}
        .Cloud:nth-child(8){-webkit-animation-delay:-147.69230769s;animation-delay:-147.69230769s;top:48%}
        .Cloud.Foreground:nth-child(8){-webkit-animation-duration:88s;animation-duration:88s;height:30%}
        .Cloud.Background:nth-child(8){-webkit-animation-duration:118s;animation-duration:118s;height:-.90909091%}
        .Cloud:nth-child(7){-webkit-animation-delay:-129.23076923s;animation-delay:-129.23076923s;top:42%}
        .Cloud.Foreground:nth-child(7){-webkit-animation-duration:92s;animation-duration:92s;height:27.5%}
        .Cloud.Background:nth-child(7){-webkit-animation-duration:122s;animation-duration:122s;height:.34090909%}
        .Cloud:nth-child(6){-webkit-animation-delay:-110.76923077s;animation-delay:-110.76923077s;top:36%}
        .Cloud.Foreground:nth-child(6){-webkit-animation-duration:96s;animation-duration:96s;height:25%}
        .Cloud.Background:nth-child(6){-webkit-animation-duration:126s;animation-duration:126s;height:1.59090909%}
        .Cloud:nth-child(5){-webkit-animation-delay:-92.30769231s;animation-delay:-92.30769231s;top:30%}
        .Cloud.Foreground:nth-child(5){-webkit-animation-duration:100s;animation-duration:100s;height:22.5%}
        .Cloud.Background:nth-child(5){-webkit-animation-duration:130s;animation-duration:130s;height:2.84090909%}
        .Cloud:nth-child(4){-webkit-animation-delay:-73.84615385s;animation-delay:-73.84615385s;top:24%}
        .Cloud.Foreground:nth-child(4){-webkit-animation-duration:104s;animation-duration:104s;height:20%}
        .Cloud.Background:nth-child(4){-webkit-animation-duration:134s;animation-duration:134s;height:4.09090909%}
        .Cloud:nth-child(3){-webkit-animation-delay:-55.38461538s;animation-delay:-55.38461538s;top:18%}
        .Cloud.Foreground:nth-child(3){-webkit-animation-duration:108s;animation-duration:108s;height:17.5%}
        .Cloud.Background:nth-child(3){-webkit-animation-duration:138s;animation-duration:138s;height:5.34090909%}
        .Cloud:nth-child(2){-webkit-animation-delay:-36.92307692s;animation-delay:-36.92307692s;top:12%}
        .Cloud.Foreground:nth-child(2){-webkit-animation-duration:112s;animation-duration:112s;height:15%}
        .Cloud.Background:nth-child(2){-webkit-animation-duration:142s;animation-duration:142s;height:6.59090909%}
        .Cloud:nth-child(1){-webkit-animation-delay:-18.46153846s;animation-delay:-18.46153846s;top:6%}
        .Cloud.Foreground:nth-child(1){-webkit-animation-duration:116s;animation-duration:116s;height:12.5%}
        .Cloud.Background:nth-child(1){-webkit-animation-duration:146s;animation-duration:146s;height:7.84090909%}
        .Cloud{background-image:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAKQAAABgCAYAAACTzNnjAAAFCklEQVR42u3d34uVRRjA8YMsEi0iSwhdRBGhSJgZiNRFIkWhQVEXBipKUVBBLCF6k0h4UxFkBLq4QT/Qiyi80EgxCjXMWqOMtqy0bBNja92yXatN3c3pGc9sHU/v+X3emWfe93vx+QN23u+e95x5Z94pmNWFQo5NEytErzgoBsSIOCf+FqbEBTEhzophcVTsFxvFEjE152PZHGMukbcB6BAPij0uqgtl0bXCBvyjeFPcS2wEWc0y0ec++Ywnf7rwbyc8grQ6RY8Y9RhhJT+Jde4TmghzFuR08bo4ryDEpE/N58QUYsx+kFPcD4yzCkMsZz+1uwkyu0HeKYYiCLHcN2I2QWYnSPudbHubfy37NuFu4wQZeZD2k2Uw4hDLHRZdBBnnH3K/5ykcX86IeQQZl6civ0XXYv/RlhJkHLZkOMTypz7dBKnbyzmJsfTZeTdB6vRszmIsjXI5QeryWMa/M9ZinzjdTJA63CLGcxzjpD/ElQQZfq3iKDFe8lSHIAPqI8L/6SHIMB4nvorTQQsI0v+teoz4KjpBkH7tIrqaNhCkH9cnbK5C8q/uywiSHzKabCLIdM3K+QR4o8YysfVWcZDvElnD1hNkOi5XuilLu5MlOyzni3vESnGfWCRuIMjm1zgSWPM7GWvNXdonXkdM8Q0dCwmytu8Iy/vK9B3iRoJMnghnqifc8jb7yXkXQf5nLWGo2WR2HUGuLrxPDKq25D6d9yBPE4I6/e6rVO6CnMpkuFq/eLmFKwtyMRde/dOg2XkKkvlH/X5P9ZNSWZBvcMGjMJza6iJlQe7nYkfjozwE+TkXOiprsx7kES5yVOzLYK/IcpA/cJGj806Wg/yaCxzlzsersxpkPxc4SruzGuQBLm603yU7DPOQUOSJWIK0E6j2lcvPm+JJVp+674oDbiFuv5t/fEXs5cJG65DmIO3KY3vG3yCLbXO1N1xVkB3uWfQQFye3rtUS5DN1bC5C9j0cOki7XOwUFwJOb6gg7TmCW1lMizI7QwQ5nW2qqGCv7yDtwsxfGXhU0OczyKvECIOOKvb5CnKa2+TDoKOat3wFyaIH1ONFH0H2MNCo00NpBzmXR39owIy0gzzOIKNOv6X9LHsZg4wGp3xsM/ZMoUfF3aaZ4++qBDnIIKMNzrsHKb11Lb6oEORtDCRSYB81f+vWxzYUJBv2kTYb5vx6gzzHgMHTjsUXagV5BwMFzz78d5NYQpDbGCAEcOzissaEIL9kcBDIx0lBsrwMIW0uD3KcQUHgqaEFpUGyLQGhnSgNkgGBBg8QJDQ5Phkky82g5bvkNQXDscDQY6MNcpiBgBL9NsjDDAS0LPq1Qb7EQECJicLFSUkGAkpMLgMaYzCgKci3GQxomPqZDPImBgMa9uOULifnDWcI7VRpkIsYEAR2sHwX2GcMCgJak/QKPh4lIsgcpOhM2iv7JIODAPqqvY7vPQYInlf6zKsWpN2iOMBAwZMD9bzSudPwvh+kr3gofJ0vve/ikxIp36pXNHosiD2j5gMGD2ksyG3lJK917qc5A4l2eNW04Wi5OaZ41DADilZu0xtMmw/fXCV+ZnDRoFFTfBdpaudlLxVfsXMRNYy7W3SH8XSAu/01bo8s/kL8xQWAM+JC7DIeDnCvZqZ4RGxxi3/3iUPOJ+5TtRXfG/v6jeadNMVjlqsZquG0uwU164ybg2vFuPuh2ax23tkm3N91VLwmbjVNvPT+H7Ro4730ITNPAAAAAElFTkSuQmCC)}
        .Cloud.Background{background-image:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEoAAAAqCAYAAAAUJM0rAAACFUlEQVRo3u3aPSwDYRzH8UZEbAYiYrDYjLZGpIPBJLGwSKwi0k1iYBKDdFJsEiMxSZgsFZJGiGjqJWEhSKuaNKRUG8r5PfI8SXOud72+PH2eu2f47Ndv7+V5/nee/G6bh5MWmIV9iEMWvkGjfiADD7AHk9BU6+PSNK0kPAINwwXkC6KU6gvC4HVyKB/clhHHCDnbTqHbSaEaYIv+OK3KyBk274RQrXBXg0B6B/QPkTIUiZTiEIm5gkbZQjXTJ5nG2ZFsocJ1iMQEZQk1VcdIGl2L9Yoeitwj3uocirgRPVRAgEjMoMihkgKFStIzK063QVHYhKF6h/IKFMlKGpaNlhM8Qq1JFIp5gQHeoSIShmJPST/PUElJQ7FN9hivUGmJQxE56OQRKiN5qL/NNY9QKQeEIpdgR7VC9cEqHeGeUyEHXHrMUiWhyKx6BV4dEsNMtNxQI4Ls33h5LidUoEYjXKEXoXZDLbgsEBOzE8qne8fmJhE7oWIujUQcwhyMmy0VSKRRF0cyWlclYMYo1LEKZOgRugpDpVWUot5ZLI8LlwN23bNQKoY1vwpVmmsS6kOFsPRJQl2qENZIqGkVwnp9xb5nUksEcxm2hZlQMcy3OYXTgx0VpOi2pl8/jwqpMP9sF5twBl08ctE7I/dws5l5D5y4OBj51HvdzluYdlik0RL06cjkKpSlB1Span5x/AQb5Hfrxyy/oU5ISeVw53AAAAAASUVORK5CYII=)}

        .emp-profile{
            opacity: 0.9;
            padding: 3%;
            margin-top: 3%;
            margin-bottom: 3%;
            border-radius: 0.5rem;
            background: #fff;
        }
        .profile-img{
            text-align: center;
        }
        .profile-img img{
            width: 70%;
            height: 100%;
        }
        .profile-img .file {
            position: relative;
            overflow: hidden;
            margin-top: -20%;
            width: 70%;
            border: none;
            border-radius: 0;
            font-size: 15px;
            background: #212529b8;
        }
        .profile-img .file input {
            position: absolute;
            opacity: 0;
            right: 0;
            top: 0;
        }
        .profile-head h5{
            color: #333;
        }
        .profile-head h6{
            color: #0062cc;
        }
        .profile-edit-btn{
            border: none;
            border-radius: 1.5rem;
            width: 70%;
            padding: 2%;
            font-weight: 600;
            color: #6c757d;
            cursor: pointer;
        }
        .proile-rating{
            font-size: 12px;
            color: #818182;
            margin-top: 5%;
        }
        .proile-rating span{
            color: #495057;
            font-size: 15px;
            font-weight: 600;
        }
        .profile-head .nav-tabs{
            margin-bottom:5%;
        }
        .profile-head .nav-tabs .nav-link{
            font-weight:600;
            border: none;
        }
        .profile-head .nav-tabs .nav-link.active{
            border: none;
            border-bottom:2px solid #0062cc;
        }
        .profile-work{
            padding: 14%;
            margin-top: -15%;
        }
        .profile-work p{
            font-size: 12px;
            color: #818182;
            font-weight: 600;
            margin-top: 10%;
        }
        .profile-work a{
            text-decoration: none;
            color: #495057;
            font-weight: 600;
            font-size: 14px;
        }
        .profile-work ul{
            list-style: none;
        }
        .profile-tab label{
            font-weight: 600;
        }
        .profile-tab p{
            font-weight: 600;
            color: #0062cc;
        }
        .container{
            color: black;
        }

    </style>

</head>

<body>
<!--div id="Clouds">
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
</div-->
<%@ include file="nav_bar.jsp" %>
<div class="container emp-profile">
    <form method="post">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <div class="container">
            <div class="row flex-lg-nowrap">
                <div class="col">
                    <div class="row">
                        <div class="col mb-3">
                            <div class="card">
                                <div class="card-body">
                                    <div class="e-profile">
                                        <div class="row">
                                            <div class="col-12 col-sm-auto mb-3">
                                                <div class="mx-auto" style="width: 140px;">
                                                    <div class="d-flex justify-content-center align-items-center rounded" style="height: 140px; background-color: rgb(233, 236, 239);">
                                                        <span style="color: rgb(166, 168, 170); font: bold 8pt Arial;">140x140</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col d-flex flex-column flex-sm-row justify-content-between mb-3">
                                                <div class="text-center text-sm-left mb-2 mb-sm-0">
                                                    <h4 class="pt-sm-2 pb-1 mb-0 text-nowrap">${lastName} ${firstName}</h4>
                                                    <h4>RATING : ${ratingUser}</h4>
                                                    <div class="mt-2">
                                                        <button class="btn btn-primary" type="button">
                                                            <i class="fa fa-fw fa-camera"></i>
                                                            <span>Change Photo</span>
                                                        </button>
                                                    </div>
                                                </div>
                                                <div class="text-center text-sm-right">
                                                    <span class="badge badge-secondary">User</span>
                                                    <div class="text-muted"><small>Joined Today</small></div>
                                                </div>
                                            </div>
                                        </div>
                                        <ul class="nav nav-tabs">
                                            <li class="nav-item"><a href="" class="active nav-link">Settings</a></li>
                                        </ul>
                                        <div class="tab-content pt-3">
                                            <div class="tab-pane active">
                                                <form class="form" method="post" action="<c:url value="/profileEdit"/>">
                                                    <div class="mb-2"><b>Change profile data</b></div>
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="row">
                                                                <div class="col">
                                                                    <div class="form-group">
                                                                        <label>Last Name</label>
                                                                        <input name="lastName" class="form-control" type="text" name="name" placeholder="${lastName}" value=${user.lastName}>
                                                                    </div>
                                                                </div>
                                                                <div class="col">
                                                                    <div class="form-group">
                                                                        <label>Username</label>
                                                                        <input name="firstName" class="form-control" type="text" name="username" placeholder="${firstName}" value=${user.firstName}>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col">
                                                                    <div class="form-group">
                                                                        <label>Email</label>
                                                                        <input name="emailAddress" class="form-control" type="text" placeholder="${emailAddress}" value=${user.emailAddress}>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-12 col-sm-6 mb-3">
                                                            <div class="row">
                                                                <div class="col">
                                                                    <div class="form-group">
                                                                        <label>Password</label>
                                                                        <input name="password" class="form-control" type="password" placeholder="password" value="${user.password}">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col">
                                                                    <div class="form-group">
                                                                        <label>Confirm <span class="d-none d-xl-inline">Password Confirm</span></label>
                                                                        <input name="passwordConfirm" class="form-control" type="password" placeholder="passwordConfirm" value="${user.passwordConfirm}"></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col d-flex justify-content-end">
                                                            <button name="profileEdit" class="btn btn-primary" type="submit">Save Changes</button>
                                                        </div>
                                                    </div>
                                                </form>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

</body>
</html>