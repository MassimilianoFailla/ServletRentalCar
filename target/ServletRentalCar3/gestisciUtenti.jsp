<%@page isELIgnored="false" language="java"
        contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
        import="java.util.*, domain.*, controller.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Utenti</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">


    <style>

        .table {
            margin: auto;
            width: 50% !important;
            text-align: center;

        }

        text{

        }

        table th {
            text-align: center;
        }

        table tr{
            text-align: center;

        }

        table td{
            text-align: center;
        }

        .table .thead-dark th {
            color: #ffffff;
            background-color: #2E2E2E
        ;
            border-color: #ffffff;
        }

        h1{
            text-align: center;
        }

    </style>

</head><br><br>
<c:url value="/GestisciUtenti" var="registerUrl"/>
<form action="${registerUrl}" method="post">
    <h1>LISTA UTENTI - RENTAL CAR</h1>
    <body>

    <table class="table table-striped" style="margin-left:auto;margin-right:auto;">
        <thead class="thead-dark">
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Nome</th>
            <th scope="col">Cognome</th>
            <th scope="col">D.Nascita</th>
            <th scope="col">Codice Fiscale</th>
            <th scope="col">Email</th>
            <th scope="col">Username</th>
            <th scope="col">Password</th>
            <th scope="col">Tipologia</th>
            <th scope="col">Aggiorna</th>
            <th scope="col">Cancella</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${listaUtenti}" var="utente">
            <tr>
                <td>${utente.id}</td>
                <td>${utente.nome}</td>
                <td>${utente.cognome}</td>
                <td>${utente.dataNascita}</td>
                <td>${utente.codiceFiscale}</td>
                <td>${utente.email}</td>
                <td>${utente.username}</td>
                <td>${utente.password}</td>
                <td>${utente.role}</td>

                <td>
                    <form action="<c:url value="/AggiornaUtente"/>" method="get">
                        <input type="hidden" name="id" value="${utente.id}">
                        <input type="submit" value="Aggiorna">
                    </form>
                <td>
                    <form action="<c:url value="/CancellaUtente"/>" method="post">
                        <input type="hidden" name="id" value="${utente.id}">
                        <input type="submit" value="Cancella">
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    </body>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script></body>
</html>





<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
    <%--<meta charset="ISO-8859-1">--%>
    <%--<title>Utenti</title>--%>
    <%--<!-- Latest compiled and minified CSS -->--%>
    <%--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">--%>


    <%--<style>--%>

        <%--.table {--%>
            <%--margin: auto;--%>
            <%--width: 50% !important;--%>
            <%--text-align: center;--%>

        <%--}--%>

        <%--text{--%>

        <%--}--%>

        <%--table th {--%>
            <%--text-align: center;--%>
        <%--}--%>

        <%--table tr{--%>
            <%--text-align: center;--%>

        <%--}--%>

        <%--table td{--%>
            <%--text-align: center;--%>
        <%--}--%>

        <%--.table .thead-dark th {--%>
            <%--color: #ffffff;--%>
            <%--background-color: #2E2E2E--%>
        <%--;--%>
            <%--border-color: #ffffff;--%>
        <%--}--%>

        <%--h1{--%>
            <%--text-align: center;--%>
        <%--}--%>

    <%--</style>--%>

<%--</head><br><br>--%>
<%--<c:url value="/GestisciUtenti" var="registerUrl"/>--%>
<%--<form action="${registerUrl}" method="post">--%>

    <%--<select name="selezione">--%>
        <%--<option value="nome">Nome</option>--%>
        <%--<option value="cognome">Cognome</option>--%>
        <%--<option value="annoNascita">Anno di Nascita</option>--%>
        <%--<option value="codiceFiscale">codiceFiscale</option>--%>


    <%--</select>--%>
    <%--<input type="text" name="filtro">--%>
    <%--<input type="submit" value="Filtra">--%>

    <%--<h1>LISTA UTENTI - RENTAL CAR</h1>--%>
    <%--<body>--%>
    <%--<br>--%>
    <%--<br><br><br>--%>
    <%--<table class="table table-striped" style="margin-left:auto;margin-right:auto;">--%>
        <%--<thead class="thead-dark">--%>
        <%--<tr>--%>
            <%--<th scope="col">ID</th>--%>
            <%--<th scope="col">Nome</th>--%>
            <%--<th scope="col">Cognome</th>--%>
            <%--<th scope="col">D.Nascita</th>--%>
            <%--<th scope="col">Codice Fiscale</th>--%>
            <%--<th scope="col">Email</th>--%>
            <%--<th scope="col">Username</th>--%>
            <%--<th scope="col">Password</th>--%>
            <%--<th scope="col">Tipologia</th>--%>
            <%--<th scope="col">Aggiorna</th>--%>
            <%--<th scope="col">Cancella</th>--%>
        <%--</tr>--%>
        <%--</thead>--%>
        <%--<tbody>--%>
        <%--<c:forEach items="${listaUtenti}" var="utente">--%>
            <%--<tr>--%>
                <%--<td>${utente.id}</td>--%>
                <%--<td>${utente.nome}</td>--%>
                <%--<td>${utente.cognome}</td>--%>
                <%--<td>${utente.dataNascita}</td>--%>
                <%--<td>${utente.codiceFiscale}</td>--%>
                <%--<td>${utente.email}</td>--%>
                <%--<td>${utente.username}</td>--%>
                <%--<td>${utente.password}</td>--%>
                <%--<td>${utente.role}</td>--%>

                <%--<td>--%>
                    <%--<form action="<c:url value="/AggiornaUtente"/>" method="get">--%>
                        <%--<input type="hidden" name="id" value="${utente.id}">--%>
                        <%--<input type="submit" value="Aggiorna">--%>
                    <%--</form>--%>
                <%--<td>--%>
                    <%--<form action="<c:url value="/CancellaUtente"/>" method="post">--%>
                        <%--<input type="hidden" name="id" value="${utente.id}">--%>
                        <%--<input type="submit" value="Cancella">--%>
                    <%--</form>--%>
                <%--</td>--%>
            <%--</tr>--%>
        <%--</c:forEach>--%>
        <%--</tbody>--%>
    <%--</table>--%>


    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>--%>
    <%--<!-- Latest compiled and minified JavaScript -->--%>
    <%--<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script></body>--%>
<%--</html>--%>


<%--<!DOCTYPE>--%>
<%--<html>--%>
<%--<head>--%>
<%--<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">--%>
<%--<title>Rental Car Servlet - GESTISCI UTENTI</title>--%>

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
<%--min-width: 60%;--%>
<%--}--%>

<%--a {--%>
<%--text-decoration: none;--%>
<%--}--%>
<%--</style>--%>
<%--</head>--%>
<%--<c:url value="/GestisciUtenti" var="registerUrl"/>--%>
<%--<form action="${registerUrl}" method="post">--%>
<%--<h1>Lista Utenti</h1>--%>
<%--<table>--%>
<%--<tr>--%>
<%--<th>ID</th>--%>
<%--<th>Nome</th>--%>
<%--<th>Cognome</th>--%>
<%--<th>Data Nascita</th>--%>
<%--<th>Codice Fiscale</th>--%>
<%--<th>Email</th>--%>
<%--<th>Username</th>--%>
<%--<th>Password</th>--%>
<%--<th>Tipologia Account</th>--%>
<%--<th>Aggiorna</th>--%>
<%--<th>Cancella</th>--%>
<%--</tr>--%>
<%--<c:forEach items="${listaUtenti}" var="utente">--%>
<%--<tr>--%>
<%--<td>${utente.id}</td>--%>
<%--<td>${utente.nome}</td>--%>
<%--<td>${utente.cognome}</td>--%>
<%--<td>${utente.dataNascita}</td>--%>
<%--<td>${utente.codiceFiscale}</td>--%>
<%--<td>${utente.email}</td>--%>
<%--<td>${utente.username}</td>--%>
<%--<td>${utente.password}</td>--%>
<%--<td>${utente.role}</td>--%>

<%--<td>--%>
<%--<form action="<c:url value="/AggiornaUtente"/>" method="get">--%>
<%--<input type="hidden" name="id" value="${utente.id}">--%>
<%--<input type="submit" value="Aggiorna">--%>
<%--</form>--%>
<%--<td>--%>
<%--<form action="<c:url value="/CancellaUtente"/>" method="post">--%>
<%--<input type="hidden" name="id" value="${utente.id}">--%>
<%--<input type="submit" value="Cancella">--%>
<%--</form>--%>
<%--</td>--%>
<%--</tr>--%>
<%--</c:forEach>--%>
<%--</table>--%>
<%--</body>--%>
<%--</html>--%>