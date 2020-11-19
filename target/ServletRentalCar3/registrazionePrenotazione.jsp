<%@page isELIgnored="false" language="java"
        contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
        import="java.util.*, domain.*, controller.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>RENTALCAR SERVLET - REGISTRAZIONE PRENOTAZIONI</title>

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
<h1>REGISTRAZIONE PRENOTAZIONE - RENTAL CAR</h1>
<c:url value="/RegistraPrenotazione" var="registerUrl" />
<form action="${registerUrl}" method="post">
    <table>
        <c:if test="${prenotazione.id ne null}">
            <tr>
                <td>Id Prenotazione:</td>
                <td><input type="text" name="id" value="${prenotazione.id}"
                           readonly="readonly"></td>
            </tr>
        </c:if>
        <tr>
            <td>Inizio Prenotazione:</td>
            <td><input type="date" name="inizioPrenotazione" value="${prenotazione.inizioPrenotazione}"
                       required></td>
        </tr>
        <tr>
            <td>Fine Prenotazione:</td>
            <td><input type="date" name="finePrenotazione" value="${prenotazione.finePrenotazione}"
                       required></td>
        </tr>
        <tr>
            <td>Targa Mezzo Prenotato:</td>
            <td><input type="text" name="targa" value="${prenotazione.targa}"
                       required></td>
        </tr>

        <c:if test="${prenotazione.id ne null}">
            <tr>
                <td colspan="2"><input type="submit" value="Aggiorna"></td>
            </tr>
        </c:if>
        <c:if test="${prenotazione.id eq null}">
            <tr>
                <td colspan="2"><input type="submit" value="Salva"></td>
            </tr>
        </c:if>
    </table>
</form>
<br>
<h1>Lista Prenotazioni</h1>
<table>
    <tr>
        <th>ID</th>
        <th>Inizio Prenotazione</th>
        <th>Fine Prenotazione</th>
        <th>Targa Mezzo Prenotato</th>
        <th>Id Utente</th>
        <th>Aggiorna</th>
        <th>Cancella</th>
    </tr>
    <c:forEach items="${listaPrenotazioni}" var="prenotazione">
        <tr>
            <td>${prenotazione.id}</td>
            <td>${prenotazione.inizioPrenotazione}</td>
            <td>${prenotazione.finePrenotazione}</td>
            <td>${prenotazione.targaMezzo}</td>
            <td>
                <form action="<c:url value="/AggiornaPrenotazione"/>" method="get">
                    <input type="hidden" name="id" value="${prenotazione.id}">
                    <input type="submit" value="Aggiorna">
                </form>
            <td>
                <form action="<c:url value="/CancellaPrenotazione"/>" method="post">
                    <input type="hidden" name="id" value="${prenotazione.id}">
                    <input style="background: #F00;" type="submit" value="Cancella">
                </form>
            </td>
        </tr>
    </c:forEach>
</table>
<%--<c:url value="/RegistraPrenotazione" var="registerUrl" />--%>
<%--<form action="${listaMezzi}" method="get">--%>
    <%--<br />--%>
    <%--<br />--%>
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
                <%--<form action="<c:url value="/AggiornaMezzo"/>" method="get">--%>
                    <%--<input type="hidden" name="id" value="${prenotazione.id}">--%>
                    <%--<input type="submit" value="Aggiorna">--%>
                <%--</form>--%>
            <%--<td>--%>
                <%--<form action="<c:url value="/CancellaMezzo"/>" method="post">--%>
                    <%--<input type="hidden" name="id" value="${prenotazione.id}">--%>
                    <%--<input style="background: #F00;" type="submit" value="Cancella">--%>
                <%--</form>--%>
            <%--</td>--%>
        <%--</tr>--%>
    <%--</c:forEach>--%>
<%--</table>--%>
</body>
</html>