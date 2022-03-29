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
    <link rel="stylesheet" href="css/formulaire.css""> 
</head>
<body>
    <header class="header">
        <div class="topbar">
            <div class="logo">
                <a href="/Pgl/">Accueil</a>
            </div>
            <nav class="menu">
                
                <a href="/Pgl/map">Carte</a>
                
                <c:if test="${ !empty sessionScope.id}">
                <a href="/Pgl/deconnexion" class="menu-item">Deconnexion</a>
                </c:if>
                <c:if test="${ !empty sessionScope.id}">
                <a href="/Pgl/contact" class="menu-item">Contact</a>
                </c:if>
                <c:if test="${ !empty sessionScope.nom}">
                <a href="/Pgl/compte" class="menu-item">Compte</a>
                </c:if>
                <c:if test="${ empty sessionScope.id}">
                <a href="/Pgl/inscription" class="menu-item">S'inscrire</a>
                </c:if>
                <c:if test="${sessionScope.statut=='admin' }">
                <a href="/Pgl/admin" class="menu-item">Admin</a>
                </c:if>
                <c:if test="${sessionScope.statut=='admin' }">
                <a href="/Pgl/notif" class="menu-item">Notification</a>
                </c:if>
            </nav>
        </div>
        
    </header>
    <section class="home-section">
        <div class="container-small">
            <div class="block block-left">
                <div class="block-img">
                </div>
    
        <h1></h1>
      <form method="post">
        <div class="wrapper">
            <div class="title">
              Pour se Deconnecter
            </div>
            <div class="form">
                 
             
              <div class="inputfield">
                <input type="submit" value="Deconnexion" class="btn">
              </div>
            </div>
        </div>
        </form>
    </section>
</html>