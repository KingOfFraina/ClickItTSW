<%@ page import="model.beans.Utente" %>
<!DOCTYPE html>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <link rel="stylesheet" type="text/css" href="./css/general.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <title>Click.it</title>
</head>
<body>
<%Utente u = (Utente) session.getAttribute("user");
    if(u == null || !u.isAdmin()) {
        response.sendRedirect(request.getServletContext().getContextPath() + "/landingpage");
    }
%>
<!-- MENU NAVIGAZIONALE -->
<div id="menu">
    <img src="./img/logo.png" alt="Click.it" id="logo">
    <div id="searchbox">
        <form action="RicercaServlet" action="get" id="cerca">
            <i class="fas fa-search" onclick="document.getElementById('cerca').submit();"></i>
            <input type="text" name="val" id="cerca_input">
        </form>
    </div>
    <div id="navigazione">
        <c:choose>
            <c:when test="${sessionScope.user!= null}">
                <a href="paginaUtente.jsp" class="item-navigazione">bentornato admin <i class="fas fa-user-circle"></i></a>
            </c:when>
            <c:otherwise>
                <a href="login.jsp" class="item-navigazione">PROFILO <i class="fas fa-user-circle"></i></a>
            </c:otherwise>
        </c:choose>

        <c:choose>
            <c:when test="${sessionScope.user != null}">
                <a href="logoutServlet" class="item-navigazione">LOGOUT <i class="fas fa-sign-out-alt"></i></a>
            </c:when>
            <c:otherwise>
                <a href="login.jsp" class="item-navigazione">LOGIN <i class="fas fa-sign-in-alt"></i></a>
            </c:otherwise>
        </c:choose>

    </div>
    <i id="apri-mobile" class="fas fa-bars" onclick="mobileMenu('apri')"></i>
    <div id="navigazione-mobile">
        <i id="chiudi-mobile" class="fas fa-bars" onclick="mobileMenu('chiudi')"></i>
        <div id="items-mobile">
            <c:choose>
                <c:when test="${sessionScope.user != null}">
                    <a href="logoutServlet" class="item-navigazione">LOGOUT <i class="fas fa-sign-out-alt"></i></a>
                </c:when>
                <c:otherwise>
                    <a href="login.jsp" class="item-navigazione">LOGIN <i class="fas fa-sign-in-alt"></i></a>
                </c:otherwise>
            </c:choose>
            <a href="categorie.jsp" class="item-navigazione">CATALOGO <i class="fas fa-tags"></i></a>
            <a href="carrello.jsp" class="item-navigazione">CARRELLO <i class="fas fa-shopping-cart"></i></a>
            <a href="#" class="item-navigazione">CHI SIAMO <i class="far fa-question-circle"></i></a>
            <c:choose>
                <c:when test="${sessionScope.user!= null}">
                    <a href="paginaUtente.jsp" class="item-navigazione">${sessionScope.user.nome} <i class="fas fa-user-circle"></i></a>
                </c:when>
                <c:otherwise>
                    <a href="login.jsp" class="item-navigazione">PROFILO <i class="fas fa-user-circle"></i></a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>
<!-- FINE MENU NAVIGAZIONALE -->

<div id="corpo-pagina">
    <div id="menu-categorie">
        <table>
            <thead>
            <tr>
                <td>GESTIONE</td>
            </tr>
            </thead>
            <tbody>

                <tr>
                    <td><a href = "provaAggiuntaProdotto.jsp">Gestione Prodotti<i class="fas fa-sort-down"></i></a></td>
                </tr>

                <tr>
                    <td><a href = "#">Gestione Categorie<i class="fas fa-sort-down"></i></a></td>
                </tr>

                <tr>
                    <td><a href = "#">Gestione Utenti<i class="fas fa-sort-down"></i></a></td>
                </tr>

                <tr>
                    <td><a href = "#">Gestione Ordini<i class="fas fa-sort-down"></i></a></td>
                </tr>



            </tbody>
        </table>
    </div>
    <div id="main-corpo">

        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="functions/index.js"></script>
    <script src="functions/general.js"></script>
</div>

</body>
</html>