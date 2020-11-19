<%@page isELIgnored="false" language="java"
        contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
        import="java.util.*, domain.*, controller.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Rental Car Servlet - GESTIONE MEZZI</title>

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
<c:url value="/GestisciMezzi" var="registerUrl"/>
<form action="${registerUrl}" method="post">
<h1>Lista Mezzi</h1>
    <table>
        <tr>
            <th>ID</th>
            <th>Casa Costruttrice</th>
            <th>Modello</th>
            <th>Anno Immatricolazione</th>
            <th>Targa</th>
            <th>Aggiorna</th>
            <th>Cancella</th>
        </tr>
        <c:forEach items="${listaMezzi}" var="mezzo">
            <tr>
                <td>${mezzo.id}</td>
                <td>${mezzo.casaCostruttrice}</td>
                <td>${mezzo.modello}</td>
                <td>${mezzo.annoImmatricolazione}</td>
                <td>${mezzo.targa}</td>
                <td>
                    <a href="/AggiornaMezzo">
                        <input type="hidden" name="id" value="${mezzo.id}">
                        <input type="submit" value="Aggiorna">
                    </a>
                <td>
                    <form action="<c:url value="/CancellaMezzo"/>" method="post">
                        <input type="hidden" name="id" value="${mezzo.id}">
                        <input type="submit" value="Cancella">
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
    </body>
</html>