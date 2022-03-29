<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Projet GPL</title>
    <link href="https://fonts.googleapis.com/css?family=Pinyon+Script|Source+Sans+Pro:300,400,600,700" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css"> 
</head>
<body>
    <header class="header">
        <div class="topbar">
            <div class="logo">
                <a href="/Pgl/">Accueil</a>
            </div>
            <nav class="menu">
                
                <a href="/Pgl/map">Carte</a>
                
                <c:if test="${ empty sessionScope.id}">
                	<a href="/Pgl/connexion" class="menu-item">Connexion</a>
                </c:if>
                <c:if test="${ !empty sessionScope.id}">
                <a href="/Pgl/contact" class="menu-item">Contact</a>
                </c:if>
                <c:if test="${ !empty sessionScope.id}">
                	<a href="/Pgl/deconnexion" class="menu-item">Deconnexion</a>
                </c:if>
                <c:if test="${ !empty sessionScope.id}">
                	<a href="/Pgl/compte" class="menu-item">Compte</a>
                </c:if>
                <c:if test="${sessionScope.statut=='admin' }">
                	<a href="/Pgl/admin" class="menu-item">Admin</a>
                </c:if>
                <c:if test="${sessionScope.statut=='admin' }">
                <a href="/Pgl/notif" class="menu-item">Notification</a>
                </c:if>
                
                
            </nav>
        </div>
        <div class="baseline">
            <span class="baseline-welcome">Projet PGL</span> 
            <strong class="baseline-name">Groupe 6</strong> 
        </div>
    </header>
    <section class="home-section">
        <div class="container-small">
            <div class="block block-left">
                <div class="block-img">
                    <img src="img/tramAngers.jpg" alt="">
                </div>
                <div class="block-body">
                    <h2 class="title"><span>Tramway</span> ligne de tramway</h2>
                    <p>
                        Vous pouvez accéder en temps direct à tous les trams en circulation sur la commune d'Angers. 
                    </p>
                    <div class="more">
                        <a href="/Pgl/map">Voir la carte</a>
                    </div>
                </div>
            </div>
            <div class="block block-right">
                <div class="block-img">
                    <img src="img/busAngers.jpg" alt="">
                </div>
                <div class="block-body">
                    <h2 class="title"><span>Bus</span> ligne de bus </h2>
                    <p>
                        Vous pouvez accéder en temps direct à tous les bus en circulation sur la commune d'Angers.
                    </p>
                    <div class="more">
                        <a href="/Pgl/map">Voir la carte</a>
                    </div>
                </div>
            </div>
            <div class="block block-centered block-last">
                <div class="block-body">
                   
            </div>
        
    
    </section>

  

    

    <footer class="footer" id="footer">
        <div class="container">
            <div class="footer-columns">
                <div class="footer-column">
                    <div class="footer-title">Projet GPL</div>
                    <p>
                           
                    </p> 
                </div>
                <div class="footer-column">
                    <div class="footer-title">Nous contacter</div>
                    <p>
                        <br>
                        <a href="mailto:groupe6gpl@eseo.com">contact@groupe6</a>
                    </p>
                </div>
                <div class="footer-column">
                    <div class="footer-title"></div>
                    <ul>
                    </ul>
                </div>
            </div>
            <div class="footer-credits">
        </div>
    </footer>


   
</body>
</html>