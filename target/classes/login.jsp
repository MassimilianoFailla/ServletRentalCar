<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="it">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">


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
                            <%--<c:url value="/RegistraPrenotazione" var="registerUrl"/>--%>
                            <%--<c:url value="/SuperUser" var="registerUrl"/>--%>
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
<!-- Latest compiled and minified JavaScript -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script></body>

</html>


<%--&lt;%&ndash;--%>
<%--Created by IntelliJ IDEA.--%>
<%--User: User--%>
<%--Date: 14/11/2020--%>
<%--Time: 14:31--%>
<%--To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@page language="java" contentType="text/html; charset=ISO-8859-1"--%>
<%--pageEncoding="ISO-8859-1" %>--%>
<%--<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>

<%--<!-- Latest compiled and minified CSS -->--%>
<%--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">--%>

<%--<head>--%>
<%--<meta charset="ISO-8859-1">--%>
<%--<title>Login</title>--%>
<%--<style type="text/css">--%>
<%--body {--%>
<%--text-align: center;--%>
<%--}--%>

<%--table {--%>
<%--margin-left: 15%;--%>
<%--min-width: 70%;--%>
<%--border: 1px solid #CCC;--%>
<%--border-collapse: collapse;--%>
<%--}--%>

<%--.center {--%>
<%--margin-left: auto;--%>
<%--margin-right: auto;--%>
<%--}--%>

<%--table tr {--%>
<%--line-height: 30px;--%>
<%--}--%>

<%--table tr th {--%>
<%--background: #000033;--%>
<%--color: #FFF;--%>
<%--}--%>

<%--table tr td {--%>
<%--border: 1px solid #CCC;--%>
<%--margin: 5px;--%>
<%--}--%>

<%--input[type=text], input[type=email], input[type=tel] {--%>
<%--min-width: 70%;--%>
<%--}--%>

<%--a {--%>
<%--text-decoration: none;--%>
<%--}--%>
<%--</style>--%>
<%--</head>--%>
<%--<body>--%>

<%--<div class="container col-md-8 col-md-offset-3" style="overflow: auto">--%>
<%--<h1>Login Form</h1>--%>
<%--<form action="<%=request.getContextPath()%>/LoginController" method="POST">--%>
<%--<fieldset style="width: 300px" class="center">--%>
<%--<legend> Pagina Login</legend>--%>
<%--<table class="center">--%>
<%--<tr>--%>
<%--<td>Username</td>--%>
<%--<td><input type="text" name="username" required="required"/></td>--%>
<%--</tr>--%>
<%--<tr>--%>
<%--<td>Password</td>--%>
<%--<td><input type="password" name="password" required="required"/></td>--%>
<%--</tr>--%>

<%--&lt;%&ndash;<c:url value="/RegistraPrenotazione" var="registerUrl"/>&ndash;%&gt;--%>
<%--<form action="<c:url value="/RegistraPrenotazione"/>" method="post">--%>
<%--<td colspan="2"><input type="submit" value="Login"></td>--%>
<%--</form>--%>
<%--</tr>--%>
<%--&lt;%&ndash;<c:url value="/RegistraUtente" var="registerUrl"/>&ndash;%&gt;--%>
<%--<form action="<c:url value="/RegistraUtente"/>" method="get">--%>
<%--<td colspan="2"><input type="submit" value="Effettua una prenotazione"></td>--%>
<%--</form>--%>
<%--</tr>--%>
<%--</td>--%>
<%--</table>--%>
<%--</fieldset>--%>
<%--</form>--%>
<%--</body>--%>

<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>--%>
<%--<!-- Latest compiled and minified JavaScript -->--%>
<%--<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script></body>--%>

<%--</html>--%>