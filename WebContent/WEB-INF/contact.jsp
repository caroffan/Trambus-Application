<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Projet PGL</title>
    <link href="https://fonts.googleapis.com/css?family=Pinyon+Script|Source+Sans+Pro:300,400,600,700" rel="stylesheet">
    <link rel="stylesheet" href="css/formulaire.css"> 
</head>
<body>
    <header class="header">
        <div class="topbar">
            <div class="logo">
                <a href="/Pgl/">Accueil</a>
            </div>
            <nav class="menu">
                
                <a href="/Pgl/map">Carte</a>
                
                <c:if test="${ empty sessionScope.nom}">
                <a href="/Pgl/connexion" class="menu-item">Connexion</a>
                </c:if>
                <c:if test="${ verif=='false'}">
                <a href="/Pgl/contact" class="menu-item">Contact</a>
                </c:if>
                <c:if test="${ !empty sessionScope.nom}">
                <a href="/Pgl/compte" class="menu-item">Compte</a>
                </c:if>
                <c:if test="${ !empty sessionScope.id}">
                <a href="/Pgl/deconnexion" class="menu-item">Deconnexion</a>
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
    <h1></h1>
    <section>
    <div class="wrapper">
        <div class="title">
          Formulaire de Contact
        </div>
        <form method="post" >
        
            <div class="form">
            	
               <div class="inputfield">
                  <label>Job</label>
                  <input type="text" class="input" id="contact_job" name="contact_job" required>
               </div>  
               <div class="inputfield">
                  <label>Entreprise</label>
                  <input type="text" class="input" id="contact_entreprise" name="contact_entreprise" required>
               </div>
               <div class="inputfield">
                  <label>Motivation</label>
                  <input type="text" class="input" id="contact_motive" name="contact_motive" required>
               </div>
               
              <div class="inputfield">
                <input type="submit" name="Contact" value="Contact" class="btn"> 
              </div>
            </div>
        
        </form>
    </div>
</section>

   
</body>
</html>