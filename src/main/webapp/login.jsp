<!DOCTYPE html>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="./css/login.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <title>Click.it</title>
</head>
<body style="background-image: radial-gradient(circle, rgba(144,12,63,1) 0%, rgba(77,0,30,1) 100%);">

<div id="login-body">
    <a href="landingpage"><img src="./img/logo.png" alt="" id="logo"></a>
    <!-- QUI VANNO TUTTI GLI ERRORI -->
    <c:forEach items="${errori}" var="errore">
        <p class="error">${errore}</p>
    </c:forEach>
    <!-- FIN QUI -->
    <form action="LoginServlet" method="post">
        <input type="email" name="email" placeholder="Inserisci la tua email" value="${email}" required>
        <input type="password" name="password" id="passwordInput" placeholder="Inserisci la tua password" onmouseover="show();" onmouseout="hide();" required>
        <input type="submit" value="Login">
    </form>
    <a href="registrazione.jsp" id="registrati">Registrati adesso</a>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="./functions/login.js"></script>
<script src="./functions/general.js"></script>
</body>
</html>