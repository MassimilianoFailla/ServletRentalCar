<%@page isELIgnored="false" language="java"
        contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
        import="java.util.*, domain.*, controller.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>RENTALCAR SERVLET - REGISTRAZIONE PRENOTAZIONI</title>

    <style type="text/css">
        body {
            text-align: center;
        }

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
</head>
<h1>REGISTRAZIONE PRENOTAZIONE - RENTAL CAR</h1>
<c:url value="/RegistraPrenotazione" var="registerUrl"/>
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
            <td>Seleziona veicolo:</td>
            <td>
                <div class="row">
                    <div class="col-md-6 select-outline">
                        <select name="targa">
                            <option value="${selected}" selected>${selected}</option>
                            <c:forEach items="${listaMezzi}" var="mezzo">
                                <c:if test="${mezzo.modello != selected}">
                                    <option value="${mezzo.modello}">${mezzo.modello}</option>
                                </c:if>
                            </c:forEach>
                        </select>
            </td>
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

</table>
</form>
<form action="<c:url value="/RegistraPrenotazione"/>" method="get">
    <select name="selezione">
        <option value="modello">Modello</option>
        <option value="annoImmatricolazione">Anno Immatricolazione</option>
        <option value="casaCostruttrice">Casa Costruttrice</option>

    </select>
    <input type="text" name="filtro">
    <input type="submit" value="Filtra">
</form>
<h1>Veicoli disponibili</h1>
<table class="table table-striped" style="margin-left:auto;margin-right:auto;">
    <thead class="thead-dark">
    <tr>
        <th>ID</th>
        <th>Targa</th>
        <th>Modello</th>
        <th>Anno Immatricolazione</th>
        <th>Casa Costruttrice</th>
    </tr>
    <c:forEach items="${listaMezzi}" var="mezzo">
    <tr>
        <td>${mezzo.id}</td>
        <td>${mezzo.targa}</td>
        <td>${mezzo.modello}</td>
        <td>${mezzo.annoImmatricolazione}</td>
        <td>${mezzo.casaCostruttrice}</td>
    </tr>
    </c:forEach>
</table>
</body>
</html>