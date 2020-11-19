<%@page isELIgnored="false" language="java"
        contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
        import="java.util.*, domain.*, controller.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>RENTAL CAR SERVLET - REGISTRAZIONE MEZZI</title>

    <style type="text/css">
        body {
            text-align: center;
        }

        table {
            margin-left: 15%;
            min-width: 70%;
            border: 1px solid #cccccc;
            border-collapse: collapse;
        }

        table tr {
            line-height: 30px;
        }

        table tr th {
            background: #a72929;
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
<h1>REGISTRAZIONE MEZZO - RENTAL CAR</h1>
<c:url value="/RegistraMezzo" var="registerUrl" />
<form action="${registerUrl}" method="post">
    <table>
        <c:if test="${mezzo.id ne null}">
            <tr>
                <td>Id Mezzo:</td>
                <td><input type="text" name="id" value="${mezzo.id}"
                           readonly="readonly"></td>
            </tr>
        </c:if>
        <tr>
            <td>Casa Costruttrice:</td>
            <td><input type="text" name="casaCostruttrice" value="${mezzo.casaCostruttrice}"
                       required></td>
        </tr>
        <tr>
            <td>Modello:</td>
            <td><input type="text" name="modello" value="${mezzo.modello}"
                       required></td>
        </tr>
        <tr>
            <td>Anno Immatricolazione:</td>
            <td><input type="date" name="annoImmatricolazione" value="${mezzo.annoImmatricolazione}"
                       required></td>
        </tr>
        <tr>
            <td>Targa:</td>
            <td><input type="text" name="targa"
                       value="${mezzo.targa}" required></td>
        </tr>
        <%--<tr>
            <td>Tipologia:</td>
            <td><input type="text" name="tipologia"
                       value="${mezzo.tipologia}" required></td>
        </tr>--%>
        <tr>
            <td>Tipologia:</td>
            <td>
                <select name="tipologia">
                    <option value="CityCar">CityCar</option>
                    <option value="Furgone">Furgone</option>
                    <option value="Minivan">Minivan</option>
                    <option value="Berlina">Berlina</option>
                    <option value="Suv">Suv</option>
                    <option value="Camioncino">Camioncino</option>
                    name="tipologia" value="${mezzo.tipologia}" required></td>
                </select>
        </tr>

        <c:if test="${mezzo.id ne null}">
            <tr>
                <td colspan="2"><input type="submit" value="Aggiorna"></td>
            </tr>
        </c:if>
        <c:if test="${mezzo.id eq null}">
            <tr>
                <td colspan="2"><input type="submit" value="Salva"></td>
            </tr>
        </c:if>
    </table>
</form>
<%--<br>--%>
<%--<h1>Lista Mezzi</h1>--%>
<%--<table>--%>
    <%--<tr>--%>
        <%--<th>ID</th>--%>
        <%--<th>Casa Costruttrice</th>--%>
        <%--<th>Modello</th>--%>
        <%--<th>Anno Immatricolazione</th>--%>
        <%--<th>Targa</th>--%>
        <%--<th>Tipologia</th>--%>
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
            <%--<td>${mezzo.tipologia}</td>--%>
            <%--<td>--%>
                <%--<form action="<c:url value="/AggiornaMezzo"/>" method="get">--%>
                    <%--<input type="hidden" name="id" value="${mezzo.id}">--%>
                    <%--<input type="submit" value="Aggiorna">--%>
                <%--</form>--%>
            <%--<td>--%>
                <%--<form action="<c:url value="/CancellaMezzo"/>" method="post">--%>
                    <%--<input type="hidden" name="id" value="${mezzo.id}">--%>
                    <%--<input style="background: #F00;" type="submit" value="Cancella">--%>
                <%--</form>--%>
            <%--</td>--%>
        <%--</tr>--%>
    <%--</c:forEach>--%>
<%--</table>--%>
</body>
</html>