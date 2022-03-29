<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Projet GPL</title>
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
                
                <a href="/Pgl/map" class="menu-item">Carte</a>
                <c:if test="${ empty sessionScope.id}" var="verif" scope="session">
                <a href="/Pgl/notif" class="menu-item">Contact</a>
                </c:if>
                <a href="/Pgl/connexion" class="menu-item">Connexion</a>
                
            </nav>
        </div>
        
    </header>
    <section class="home-section">
        <div class="container-small">
            <div class="block block-left">
                <div class="block-img">
                </div>
            </div>
       	</div>
    
        
        <h1></h1>
       <form method="post" >
        <div class="wrapper">
            <div class="title">
              Formulaire d'Inscription
            </div>
            <div class="form">
               <div class="inputfield">
                  <label>Adresse Mail</label>
                  <input type="text" class="input" id="user_email" name="user_email" required pattern="[A-Za-z0-9._%+-]+@[a-z0-9.-]+.[a-z]{2,4}$"]>
               </div>  
               <div class="inputfield">
                  <label>Password</label>
                  <input type="password" class="input" id="user_pswd" name="user_pswd" required pattern="[A-Za-zÀ-ÿ0-9._!?+-]{8,20}"]>
               </div>  
              <div class="inputfield">
                  <label>Prénom</label>
                  <input type="text" class="input" id="user_prenom" name="user_prenom" required>
               </div> 
                <div class="inputfield">
                  <label>Nom</label>
                  <input type="text" class="input" id="user_nom" name="user_nom" required>
               </div>   
                <div class="inputfield">
                  <label>Sexe</label>
                  <input type="text" class="input"id="user_sexe" name="user_sexe" required>
               </div>  
                <div class="inputfield">
                  <label>Date</label>
                  <input type="date" class="input"id="user_date" name="user_date" required>
               </div>  
               <div class="inputfield">
                  <label>fréquence de déplacement :</label>
            		<select id="user_freq" name="user_freq" >
              		<option value="hebdomadaire">hebdomadaire</option>
              		<option value="mensuel">mensuel</option>
              		<option value="periodique">périodique</option>
             	 	<option value="quotidien">quotidien</option>
              		<option value="jamais">jamais</option>
            		</select>
               </div>  
                <div class="inputfield">
                  <label>Habitude de déplacement :</label>
            		<select id="user_habit"name="user_habit" >
              		<option value="A pied">A pied</option>
              		<option value="En voiture">En voiture</option>
              		<option value="En velo">En vélo</option>
             	 	<option value="Transport en commun">Transports en commun</option>
              		<option value="Autres">Autres</option>
            		</select>
               </div>  
               
              <div class="inputfield">
                <input type="submit" value="Inscription" class="btn">
              </div>
            </div>
        </div>
        </form>
    </section>
       

       
    
</html>