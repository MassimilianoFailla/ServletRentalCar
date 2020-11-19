<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">


<style>
    body {
        text-align: center;
        background-color: darkgrey

    }

    .center {
        margin-left: auto;
        margin-right: auto;
    }

    table {
        margin-left: auto;
        min-width: auto;
        border: 1px solid rgb(0, 0, 230);
        border-collapse: collapse;
    }
    table tr th {
        background: #34348a;
        color: rgb(255, 255, 255);
    }



</style>
<title>CustomerUser</title>
</head>
<body class="center">
<h2 class="center">CUSTOMER USER - RENTAL CAR</h1>
    <fieldset style="width: 400px" class="center" >
        <br>
        <br>
        <br>
        <br>

        <div class="btn-group" role="group" aria-label="...">
            <a href="/RegistraPrenotazione">
                <button type="button" class="btn btn-default" style ="" class="center">Nuova Prenotazione</button>
            </a>
        </div>
        <br>
        <br>
        <div class="btn-group" role="group" aria-label="...">
            <a href="/GestisciUtenti">
                <button type="button" class="btn btn-default" class="center">Aggiorna Dati</button>
            </a>
        </div>
        <br>
        <br>
        <div class="btn-group" role="group" aria-label="...">
            <a href="/GestisciMezzi">
                <button type="button" class="btn btn-default" class="center">Visualizza Parco Auto</button>
            </a>
        </div>
        <br>
        <br>
    </fieldset>
    </form>
</body>
</body>
<c:url value="/CustomerUser" var="registerUrl"/>
<form action="${listaMezzi}" method="get">
<table class>
    <div class="panel panel-default">
        <!-- Default panel contents -->
        <div class="panel-heading" class="center">ListaPrenotazioni</div>
        <table class="table" class="center">
            <tr>
                <th>ID</th>
                <th>Inizio Prenotazione</th>
                <th>Fine Prenotazione</th>
                <th>Targa Mezzo Prenotato</th>
                <th>Id Utente</th>
                <th>Aggiorna</th>
                <th>Cancella</th>
            </tr>
        </table>
    </div>
    <!-- Table -->

    </div>
</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script></body>

</html>