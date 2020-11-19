<%@page isELIgnored="false" language="java"
        contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
        import="java.util.*, domain.*, controller.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Rental Car Servlet - GESTISCI UTENTI</title>

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
<c:url value="/GestisciUtenti" var="registerUrl"/>
<form action="${registerUrl}" method="post">
    <h1>Lista Utenti</h1>
    <table>
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Cognome</th>
            <th>Data Nascita</th>
            <th>Codice Fiscale</th>
            <th>Email</th>
            <th>Username</th>
            <th>Password</th>
            <th>Tipologia Account</th>
            <th>Aggiorna</th>
            <th>Cancella</th>
        </tr>
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
    </table>
    </body>
</html>