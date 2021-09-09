<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a onclick="location.href='<c:url value="/"/>'" href="/" class="navbar-brand"><img src="<c:url value="/static/images/GrumpyFox.png"/>" alt="GrumpyFox" height="42" width="42"></a>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Rating
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" onclick="location.href='<c:url value="/rate_games"/>'" class="nav-link" href="/rate_games">Games</a>
                    <a class="dropdown-item" onclick="location.href='<c:url value="/rate_users"/>'" class="nav-link" href="/rate_users">Users</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Account
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" onclick="location.href='<c:url value="/profile"/>'" class="nav-link" href="/profile">Profile</a>
                    <a class="dropdown-item" onclick="location.href='<c:url value="/"/>'" class="nav-link" href="/">Sign out</a>
                </div>
            </li>
        </ul>

        <form class="form-inline my-2 my-lg-0">
            <a class="btn btn-outline-info" onclick="location.href='<c:url value="/authentication_registration"/>'" href="/authentication_registration">Sign IN</a>
        </form>
    </div>
</nav>