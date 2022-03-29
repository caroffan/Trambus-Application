<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="fr">
    <head>
        <title>map</title>
        <link rel="stylesheet" href="css/style.css"/>
        
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.3.1/dist/leaflet.css" integrity="sha512-Rksm5RenBEKSKFjgI3a41vrjkw4EVPlJ3+OiI65vTjIdo9brlAacEuKOiQ5OFh7cOI1bkDwLqdLw3Zg0cRJAAQ==" crossorigin="" />
        <link rel="stylesheet" href="https://unpkg.com/leaflet.markercluster@1.3.0/dist/MarkerCluster.css" />
        <link rel="stylesheet" href="https://unpkg.com/leaflet.markercluster@1.3.0/dist/MarkerCluster.Default.css" />

        <script src="https://unpkg.com/leaflet@1.3.1/dist/leaflet.js" integrity="sha512-/Nsx9X4HebavoBvEBuyp3I7od5tA0UzAxs+j83KgC8PU0kgB4XiK4Lfe4y4cgBtaRJQEIFCW+oC506aPT2L1zw==" crossorigin=""></script>
        <script src="https://unpkg.com/leaflet.markercluster@1.3.0/dist/leaflet.markercluster.js"></script>
       
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link href="https://fonts.googleapis.com/css?family=Pinyon+Script|Source+Sans+Pro:300,400,600,700" rel="stylesheet">
      </head>
      <body>   
        <header class="topbar">
            <div class="logo">
                <a href="/Pgl/">Accueil</a>
            </div>
            <nav class="menu" onclick="changeView()">
                
                <a href="/Pgl/map">Carte</a>
                <c:if test="${ empty sessionScope.id}" var="verif" scope="session">
                <a href="/Pgl/notif" class="menu-item">Contact</a>
                </c:if>
                <c:if test="${ empty sessionScope.id}">
                <a href="/Pgl/connexion" class="menu-item">Connexion</a>
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
            </nav>
            
        </header>
		
    <div id="mapid"></div>
	<script src="js/app1.js"></script>
    </body>
</html>

