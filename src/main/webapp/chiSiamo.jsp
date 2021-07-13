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
    <title>Chi siamo - Click.it</title>
</head>
<body onload="start()">
<!-- MENU NAVIGAZIONALE -->
<div id="menu">
    <a href="index.jsp"><img src="./img/logo.png" alt="Click.it" id="logo"></a>
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
        <a href="#" class="item-navigazione">CHI SIAMO <i class="far fa-question-circle"></i></a>
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

<!-- CORPO PAGINA-->
<div id="corpo-pagina">
    <p>
        Nel 1981 fa nasceva <b>Click.it</b>, da un’idea di Francesco Esposito e Sacco Matteo, la persona che ancora oggi è l’amministratore unico di questa dinamica società che ha costruito la propria storia grazie alla distribuzione di prodotti foto e video in Italia e all’estero. Ancora prima del commercio elettronico, sin dagli anni '80 <b>Click.it</b> effettuava vendita a distanza grazie alla diffusione via posta del proprio catalogo che oggi è diventato un “Cult” per tutti gli appassionati del settore, un’edizione unica in Italia, una guida all’acquisto sempre rinnovata e dettagliata distribuita gratuitamente a tutti i nostri clienti e sempre reperibile in formato elettronico sul nostro sito.
        <br><br>
        Forte dell’esperienza pluriennale maturata nella vendita per corrispondenza, <b>Click.it</b> ha affrontato il passaggio nell’era internet, sin dagli albori del commercio elettronico, in maniera pioneristica, creando già nel 1998 il proprio sito www.click.it oggi diventato uno dei principali store online in Italia. Click.it rappresenta uno dei migliori standard di commercio elettronico, è un catalogo virtuale completo aggiornato in tempo reale, uno strumento veloce, efficace che permette all’utente di usufruire con semplicità delle migliori funzioni come la ricerca avanzata dei prodotti e dei relativi accessori, la consultazione di approfondite schede tecniche o di acquistare uno dei tanti pacchetti promozionali offerti solo on-line a prezzi particolarmente vantaggiosi, il tutto con la possibilità di scegliere tra svariate modalità di pagamento affiancate dai migliori standard di sicurezza elettronica, come carte di credito del circuito Visa e Mastercard, postepay, paypal, contanti alla consegna e finanziamenti super agevolati grazie alla convenzione con le finanziarie Agosducato e Consel.
        <br><br>
        Oltre al sito internet <b>Click.it</b> può contare su 5 punti vendita diretta: Milano, Bologna, Firenze, Roma, Pisa, Sarno, Fraina di Sarno. I punti vendita Click.it sono guidati da una filosofia di vendita che ha l’obiettivo di garantire competenza , professionalità e servizio privilegiando in maniera assoluta l’assistenza alla propria clientela. Il personale addetto alla vendita è di alto livello professionale, in grado di consigliare al cliente il miglior acquisto in funzione delle proprie esigenze, oltre a tutti i prodotti foto e video nei nostri punti vendita sono organizzati per garantire anche tutti i servizi di stampa digitale e analogica, settore in cui grazie ai prezzi imbattibili ILFOTOAMATORE è leader da molti anni.
    </p>
</div>
<!-- FINE CORPO PAGINA-->
<footer class="footer">
    <p>Click.it P.IVA: 08831029384910293049a</p>
</footer>

<style>
    #corpo-pagina p{
        width: 80vw;
        font-size: 14px;
        font-family: LemonMilk;
    }

    @media only screen and (max-width: 700px) {
        #corpo-pagina{
            flex-direction: column;
            justify-content: flex-start;
        }

        #corpo-pagina p{
            margin-top: 15px;
            font-size: 12px;
        }
    }
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="functions/index.js"></script>
<script src="functions/general.js"></script>
</body>
</html>