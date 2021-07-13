<!DOCTYPE html>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/confronta.css">
    <link rel="stylesheet" type="text/css" href="./css/general.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <title>Confronta - Click.it</title>
</head>
<body>
<!-- MENU NAVIGAZIONALE -->
<div id="menu">
    <a href="landingpage"><img src="img/logo.png" alt="Click.it" id="logo"></a>
    <div id="searchbox">
        <form action="RicercaServlet" action="get" id="cerca">
            <i class="fas fa-search" onclick="document.getElementById('cerca').submit();"></i>
            <input type="text" name="val" id="cerca_input">
        </form>
    </div>
    <div id="navigazione">
        <c:choose>
            <c:when test="${sessionScope.user!= null}">
                <a href="paginaUtente.jsp" class="item-navigazione">${sessionScope.user.nome} <i class="fas fa-user-circle"></i></a>
            </c:when>
            <c:otherwise>
                <a href="login.jsp" class="item-navigazione">PROFILO <i class="fas fa-user-circle"></i></a>
            </c:otherwise>
        </c:choose>
        <a href="chiSiamo.jsp" class="item-navigazione">CHI SIAMO <i class="far fa-question-circle"></i></a>
        <c:choose>
            <c:when test="${sessionScope.user != null}">
                <a href="logoutServlet" class="item-navigazione">LOGOUT <i class="fas fa-sign-out-alt"></i></a>
            </c:when>
            <c:otherwise>
                <a href="login.jsp" class="item-navigazione">LOGIN <i class="fas fa-sign-in-alt"></i></a>
            </c:otherwise>
        </c:choose>
        <a href="carrello.jsp" class="item-navigazione">CARRELLO <i class="fas fa-shopping-cart"></i></a>
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
            <a href="chiSiamo.jsp" class="item-navigazione">CHI SIAMO <i class="far fa-question-circle"></i></a>
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

<!-- CORPO PAGINA-->

<div id="corpo-pagina">
    <div class="prodotto">
        <a href="ProdottoServlet?prodotto=${confronto1.id}"><div class="nomeprodotto">${confronto1.marca} ${confronto1.modello}</div></a>
        <div class="scheda-tecnica">
            <table>
                <tr>
                    <td class="nome-specifica">
                        dimensioni
                    </td>
                    <td class="valore-specifica">
                        ${confronto1.dimensioni}
                    </td>
                </tr>
                <tr>
                    <td class="nome-specifica">
                        peso
                    </td>
                    <td class="valore-specifica">
                        ${confronto1.peso} g
                    </td>
                </tr>
                <c:forEach items="${confronto1.specifiche}" var="specifica">
                    <tr>
                        <td class="nome-specifica">
                                ${specifica.nome}
                        </td>
                        <td class="valore-specifica">
                                ${specifica.valore}
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div class="scheda-tecnica-mobile">
            <table>
                <tr>
                    <td class="nome-specifica">
                        dimensioni
                    </td>
                </tr>
                <tr>
                    <td class="valore-specifica">
                        ${confronto1.dimensioni}
                    </td>
                </tr>
                <tr>
                    <td class="nome-specifica">
                        peso
                    </td>
                </tr>
                <tr>
                    <td class="valore-specifica">
                        ${confronto1.peso} g
                    </td>
                </tr>
                <c:forEach items="${confronto1.specifiche}" var="specifica">
                    <tr>
                        <td class="nome-specifica">
                                ${specifica.nome}
                        </td>
                    </tr>
                    <tr>
                        <td class="valore-specifica">
                                ${specifica.valore}
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <div class="prodotto">
        <a href="ProdottoServlet?prodotto=${confronto2.id}"><div class="nomeprodotto">${confronto2.marca} ${confronto2.modello}</div></a>
        <div class="scheda-tecnica">
            <table>
                <tr>
                    <td class="nome-specifica">
                        dimensioni
                    </td>
                    <td class="valore-specifica">
                        ${confronto2.dimensioni}
                    </td>
                </tr>
                <tr>
                    <td class="nome-specifica">
                        peso
                    </td>
                    <td class="valore-specifica">
                        ${confronto2.peso} g
                    </td>
                </tr>
                <c:forEach items="${confronto2.specifiche}" var="specifica">
                    <tr>
                        <td class="nome-specifica">
                                ${specifica.nome}
                        </td>
                        <td class="valore-specifica">
                                ${specifica.valore}
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div class="scheda-tecnica-mobile">
            <table>
                <tr>
                    <td class="nome-specifica">
                        dimensioni
                    </td>
                </tr>
                <tr>
                    <td class="valore-specifica">
                        ${confronto2.dimensioni}
                    </td>
                </tr>
                <tr>
                    <td class="nome-specifica">
                        peso
                    </td>
                </tr>
                <tr>
                    <td class="valore-specifica">
                        ${confronto2.peso} g
                    </td>
                </tr>
                <c:forEach items="${confronto2.specifiche}" var="specifica">
                    <tr>
                        <td class="nome-specifica">
                                ${specifica.nome}
                        </td>
                    </tr>
                    <tr>
                        <td class="valore-specifica">
                                ${specifica.valore}
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    </div>
</div>
<!-- FINE CORPO PAGINA-->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="functions/confronta.js"></script>
<script src="functions/general.js"></script>

</body>
</html>
