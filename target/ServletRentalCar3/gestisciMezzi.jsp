<%@page isELIgnored="false" language="java"
        contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
        import="java.util.*, domain.*, controller.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Mezzi</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">


    <style>

        .table {
            margin: auto;
            width: 50% !important;
            text-align: center;

        }

        table th {
            text-align: center;
        }

        table tr{
            text-align: center;

        }

        table td{
            text-align: center;
            text-size-adjust: inherit;
        }

        .table .thead-dark th {
            color: #ffffff;
            background-color:#3F729B
        ;
            border-color: #ffffff;
        }

        h1{
            text-align: center;
        }

    </style>




</head><br><br>
<c:url value="/GestisciMezzi" var="registerUrl"/>
<form action="${registerUrl}" method="post">
    <h1>LISTA MEZZI - RENTAL CAR</h1>
    <body>
    <br>
    <br><br><br>
    <table class="table table-striped" style="margin-left:auto;margin-right:auto;">
        <thead class="thead-dark">
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Casa Costruttrice</th>
            <th scope="col">Modello</th>
            <th scope="col">Anno Immatricolazione</th>
            <th scope="col">Targa</th>
            <th scope="col">Aggiorna</th>
            <th scope="col">Cancella</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${listaMezzi}" var="mezzo">
            <tr>
                <td>${mezzo.id}</td>
                <td>${mezzo.casaCostruttrice}</td>
                <td>${mezzo.modello}</td>
                <td>${mezzo.annoImmatricolazione}</td>
                <td>${mezzo.targa}</td>
                <td>
                    <form action="<c:url value="/AggiornaMezzo"/>" method="get">
                        <input type="hidden" name="id" value="${mezzo.id}">
                        <input type="submit" value="Aggiorna">
                    </form>
                <td>
                    <form action="<c:url value="/CancellaMezzo"/>" method="post">
                        <input type="hidden" name="id" value="${mezzo.id}">
                        <input type="submit" value="Cancella">
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script></body>
</html>




<%--<!DOCTYPE>--%>
<%--<html>--%>
<%--<head>--%>
    <%--<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">--%>
    <%--<title>Rental Car Servlet - GESTIONE MEZZI</title>--%>

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
<%--<c:url value="/GestisciMezzi" var="registerUrl"/>--%>
<%--<form action="${registerUrl}" method="post">--%>
    <%--<h1>Lista Mezzi</h1>--%>
    <%--<table>--%>
        <%--<tr>--%>
            <%--<th>ID</th>--%>
            <%--<th>Casa Costruttrice</th>--%>
            <%--<th>Modello</th>--%>
            <%--<th>Anno Immatricolazione</th>--%>
            <%--<th>Targa</th>--%>
            <%--<th>Aggiorna</th>--%>
            <%--<th>Cancella</th>--%>
        <%--</tr>--%>
        <%--<c:forEach items="${listaMezzi}" var="mezzo">--%>
            <%--<tr>--%>
                <%--<td>${mezzo.id}</td>--%>
                <%--<td>${mezzo.casaCostruttrice}</td>--%>
                <%--<td>${mezzo.modello}</td>--%>
                <%--<td>${mezzo.annoImmatricolazione}</td>--%>
                <%--<td>${mezzo.targa}</td>--%>
                <%--<td>--%>
                    <%--<a href="/AggiornaMezzo">--%>
                        <%--<input type="hidden" name="id" value="${mezzo.id}">--%>
                        <%--<input type="submit" value="Aggiorna">--%>
                    <%--</a>--%>
                <%--<td>--%>
                    <%--<form action="<c:url value="/CancellaMezzo"/>" method="post">--%>
                        <%--<input type="hidden" name="id" value="${mezzo.id}">--%>
                        <%--<input type="submit" value="Cancella">--%>
                    <%--</form>--%>
                <%--</td>--%>
            <%--</tr>--%>
        <%--</c:forEach>--%>
    <%--</table>--%>
    <%--</body>--%>
<%--</html>--%>