<%@page isELIgnored="false" language="java"
        contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
        import="java.util.*, domain.*, controller.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Prenotazioni</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
          integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

    <style>

        .table {
            margin: auto;
            width: 50% !important;
            text-align: center;

        }

        table th {
            text-align: center;
        }

        table tr {
            text-align: center;

        }

        table td {
            text-align: center;
            text-size-adjust: inherit;
        }

        .table .thead-dark th {
            color: #ffffff;
            background-color: #3F729B;
            border-color: #ffffff;
        }

        h1 {
            text-align: center;
        }

    </style>

</head>
<br><br>
<c:url value="/GestisciPrenotazioni" var="registerUrl"/>
<form action="${registerUrl}" method="post">
    <h1>LISTA PRENOTAZIONI - RENTAL CAR</h1>
    <body>
    <br>
    <br><br><br>
    <table class="table table-striped" style="margin-left:auto;margin-right:auto;">
        <thead class="thead-dark">
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Inizio Prenotazione</th>
            <th scope="col">Fine Prenotazione</th>
            <th scope="col">Modello Mezzo Prenotato</th>
            <th scope="col">Targa Mezzo</th>
            <th scope="col">Nome Utente</th>
            <th scope="col">Codice Fiscale</th>
            <th scope="col">Aggiorna</th>
            <th scope="col">Cancella</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${listaPrenotazioni}" var="prenotazione">
            <tr>
                <td>${prenotazione.id}</td>
                <td>${prenotazione.inizioPrenotazione}</td>
                <td>${prenotazione.finePrenotazione}</td>
                <td>${prenotazione.mezzo.modello}</td>
                <td>${prenotazione.mezzo.targa}</td>
                <td>${prenotazione.utente.nome}</td>
                <td>${prenotazione.utente.codiceFiscale}</td>
                <td>
                    <form action="<c:url value="/AggiornaPrenotazione"/>" method="get">
                        <input type="hidden" name="id" value="${prenotazione.id}">
                        <input type="submit" value="Aggiorna">
                    </form>
                <td>
                    <form action="<c:url value="/CancellaPrenotazione"/>" method="post">
                        <input type="hidden" name="id" value="${prenotazione.id}">
                        <input type="submit" value="Cancella">
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"
            integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"
            crossorigin="anonymous"></script>
    </body>
</html>