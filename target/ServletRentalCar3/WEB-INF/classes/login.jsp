<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="it">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
      integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">


<style>

    body {
        margin: 0;
        padding: 5%;
        background-color: #7d7d7d;
        height: 100vh;
    }

    .center {
        margin-left: auto;
        margin-right: auto;
    }

    #login .container #login-row #login-column #login-box {
        margin-top: 120px;
        max-width: 600px;
        height: 320px;
        border: 1px solid #c9c9c9;
        background-color: #dcd8d8;
    }

    #login .container #login-row #login-column #login-box #login-form {
        padding: 15px;
    }

    #login .container #login-row #login-column #login-box #login-form #register-link {
        margin-top: -65px;
    }

</style>
</head>
<body>
<form action="<%=request.getContextPath()%>/LoginController" method="POST">
    <div id="login" class="center">
        <div class="container" class="center">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form id="login-form" class="form" action="" method="post">
                            <h3 class="text-center text-info">Login</h3>
                            <div class="form-group" class="center">
                                <label for="username" class="text-info">Username:</label><br>
                                <input type="text" name="username" id="username" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="password" class="text-info">Password:</label><br>
                                <input type="password" name="password" id="password" class="form-control">
                            </div>
                            <div class="form-group">
                                <input type="submit" name="submit" class="btn btn-info btn-md" value="Login">
                            </div>
                            <br></br>
                            <c:url value="/RegistraUtente" var="registerUrl"/>
                            <div id="register-link" class="text-right">
                                <a href="#" class="text-info">Registrati</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"
        integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"
        crossorigin="anonymous"></script>
</body>
</html>