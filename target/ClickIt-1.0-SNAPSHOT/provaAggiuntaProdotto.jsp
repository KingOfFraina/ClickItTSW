
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action = "AdminServlet/aggiungiProdotto" enctype='multipart/form-data' method="post">
    dimensioni<input type = "text" name= "dimensioni">
    peso<input type = "text" name = "peso">
    marca<input type = "text" name = "marca">
    modello<input type = "text" name = "modello">
    prezzo<input type = "text" name = "prezzo">
    descrizione<input type = "text" name = descrizione>
    immagine<input type = "file" name = "immagine">

    <input type = "submit">
</form>

</body>
</html>
