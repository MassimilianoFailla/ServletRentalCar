<%@page isELIgnored="false" language="java"
        contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
        import="java.util.*, domain.*, controller.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Rental Car Servlet - GESTISCI PRENOTAZIONI </title>

    <style type="text/css">
        body {
            text-align: center;
        }

        table {
            margin-left: 15%;
            min-width: 70%;
            border: 1px solid #CCC;
            border-collapse: collapse;
        }

        table tr {
            line-height: 30px;
        }

        table tr th {
            background: #000033;
            color: #FFF;
        }

        table tr td {
            border: 1px solid #CCC;
            margin: 5px;
        }

        input[type=text], input[type=email], input[type=tel] {
            min-width: 60%;
        }

        a {
            text-decoration: none;
        }
    </style>
</head>
<c:url value="/GestisciPrenotazioni" var="registerUrl"/>
<form action="${registerUrl}" method="post">
    <h1>Lista Prenotazioni</h1>
    <table>
        <tr>
            <th>ID</th>
            <th>Inizio Prenotazione</th>
            <th>Fine Prenotazione</th>
            <th>Targa Mezzo Prenotato</th>
            <th>ID Utente</th>
            <th>Aggiorna</th>
            <th>Cancella</th>
        </tr>
        <c:forEach items="${listaPrenotazioni}" var="prenotazione">
            <tr>
                <td>${prenotazione.id}</td>
                <td>${prenotazione.dataInizio}</td>
                <td>${prenotazione.dataFine}</td>
                <td>${prenotazione.targaMezzo}</td>
                <td>${utente.id}</td>
                <td>
                    <form action="<c:url value="/AggiornaPrenotazione"/>" method="get">
                        <input type="hidden" name="id" value="${prenotazione.id}">
                        <input type="submit" value="Aggiorna">
                    </form>
                <td>
                    <form action="<c:url value="/AggiornaPrenotazione"/>" method="post">
                        <input type="hidden" name="id" value="${prenotazione.id}">
                        <input style="background: #F00;" type="submit" value="Cancella">
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
    </body>
</html>