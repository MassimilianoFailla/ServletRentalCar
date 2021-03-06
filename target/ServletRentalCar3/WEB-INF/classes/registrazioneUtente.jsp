<%@page isELIgnored="false" language="java"
        contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
        import="java.util.*, domain.*, controller.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>RENTALCAR SERVLET - REGISTRAZIONE UTENTI</title>

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
            background: #000000e0;
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
<h1>REGISTRAZIONE UTENTE - RENTAL CAR</h1>
<c:url value="/RegistraUtente" var="registerUrl"/>
<form action="${registerUrl}" method="post">
    <table>
        <%--<c:if test="${utente.id ne null}">--%>
            <%--<tr>--%>
                <%--<td>Id Utente:</td>--%>
                <%--<td><input type="text" name="id" value="${utente.id}"--%>
                           <%--readonly="readonly"></td>--%>
            <%--</tr>--%>
        <%--</c:if>--%>
        <tr>
            <td>Nome:</td>
            <td><input type="text" name="nome" value="${utente.nome}"
                       required></td>
        </tr>
        <tr>
            <td>Cognome:</td>
            <td><input type="text" name="cognome" value="${utente.cognome}"
                       required></td>
        </tr>
        <tr>
            <td>Data Di Nascita:</td>
            <td><input type="date" name="dataNascita" value="${utente.dataNascita}"
                       required></td>
        </tr>
        <tr>
            <td>Codice Fiscale:</td>
            <td><input type="text" name="codiceFiscale"
                       value="${utente.codiceFiscale}" required></td>
        </tr>
        <tr>
            <td>Email:</td>
            <td><input type="email" name="email" value="${utente.email}"
                       required></td>
        </tr>
        <tr>
            <td>Username:</td>
            <td><input type="text" name="username"
                       value="${utente.username}" required></td>
        </tr>
        <tr>
            <td>Password:</td>
            <td><input type="password" name="password"
                       value="${utente.password}" required></td>
        </tr>

        <td>Tipologia Account:</td>
        <td>
            <select name="role">
                <option value="SuperUser">SuperUser</option>
                <option value="Customer">Customer</option>
                name="role" value="${utente.role}" required>
        </td>
        </select>
        </tr>

        <c:if test="${utente.id ne null}">
            <tr>
                <td colspan="2"><input type="submit" value="Aggiorna"></td>
            </tr>
        </c:if>
        <c:if test="${utente.id eq null}">
            <tr>
                <td colspan="2"><input type="submit" value="Salva"></td>
            </tr>
        </c:if>
    </table>
</form>
</body>
</html>
</thead>
</table>