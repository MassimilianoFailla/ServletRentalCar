<%@page isELIgnored="false" language="java"
        contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
        import="java.util.*, domain.*, controller.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Utenti</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
          integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">


    <style>

        .table {
            margin: auto;
            width: 50% !important;
            text-align: center;

        }

        text {

        }

        table th {
            text-align: center;
        }

        table tr {
            text-align: center;

        }

        table td {
            text-align: center;
        }

        .table .thead-dark th {
            color: #ffffff;
            background-color: #2E2E2E;
            border-color: #ffffff;
        }

        h1 {
            text-align: center;
        }

    </style>

</head>
<br><br>
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
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"
            integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"
            crossorigin="anonymous"></script>
</form>
</html>
