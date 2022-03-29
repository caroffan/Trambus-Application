<%@ page language="java" contentType="text/html; charset=UTF-8"%>
    
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
                
                <a href="/Pgl/map">Carte</a>
                
                
                <c:if test="${ empty sessionScope.id}" var="verif" scope="session">
                <a href="/Pgl/connexion" class="menu-item">Connexion</a>
                </c:if>
                <c:if test="${ verif=='false'}">
                <a href="/Pgl/contact" class="menu-item">Contact</a>
                </c:if>
                <c:if test="${ verif=='false'}">
                <a href="/Pgl/deconnexion" class="menu-item">Deconnexion</a>
                </c:if>
                <c:if test="${ verif=='false'}">
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
        
    </header>
    <section class="home-section">
        <div class="container-small">
            <div class="block block-left">
                <div class="block-img">
                </div>
    
        
        <h1></h1>
        <form method="post" >
        <div class="wrapper">
            <div class="title">
              Compte
            </div>
            <div class="form">
            	<div class="inputfield">
                  <strong class="baseline-name">
                  		Statut : ${ sessionScope.statut }
    			  </strong>
               </div>
               <div class="inputfield">
                  <label>Email</label>
                  <input type="text" class="input" id="user_email" name="user_email" 
                  value=${ sessionScope.email } required pattern="[A-Za-z0-9._%+-]+@[a-z0-9.-]+.[a-z]{2,4}$"]>
               </div>  
               <div class="inputfield">
                  <label>Password</label>
                  <input type="password" class="input hidetext" id="user_pswd" name="user_pswd" value=${ sessionScope.pswd } required pattern="[A-Za-zÀ-ÿ0-9._!?+-]{8,20}"]>
               </div>
               <div class="inputfield">
                  <label>Nom</label>
                  <input type="text" class="input" id="user_nom" name="user_nom"
                  value=${ sessionScope.nom } required>
               </div>
               <div class="inputfield">
                  <label>Prenom</label>
                  <input type="text" class="input" id="user_prenom" name="user_prenom"
                  value=${ sessionScope.prenom } required>
               </div>
               <div class="inputfield">
                  <label>Sexe</label>
                  <input type="text" class="input" id="user_sexe" name="user_sexe"
                  value=${ sessionScope.sexe } required>
               </div>
               <div class="inputfield">
                  <label>Date</label>
                  <input type="date" class="input"id="user_date" name="user_date" value=${ sessionScope.date } required>
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
                <input type="submit" name="modifier" value="modifier" class="btn">
                <input type= "submit" name="supprimer" value="supprimer" class ="btn">
                 <input type= "submit" name="suspendre" value="suspendre" class ="btn">

                
              </div>
            </div>
        </div>
        </form>
    <div>
        	<script>
        	function pdf_Generator() {
        		var docDefinition = {content: [     // Création du contenu du PDF
        			{ text: "Carte interactive des trams et bus d'Angers ", fontSize: 28, alignment: 'center' },
        			' ',
        			' ',
        			' ',
        			{ text: 'Voici le détail de vos informations. ', fontSize: 16 },
        			' ',
        			' ',
        			{ text: 'Statut : ' + '${ sessionScope.statut }', fontSize: 16 },
        			' ',
        			{ text: 'Email : ' + '${ sessionScope.email }', fontSize: 16 },
        			' ',
        			{ text: 'Mot de passe : ' + '${ sessionScope.pswd }', fontSize: 16 },
        			' ',
        			{ text: 'Nom : ' + '${ sessionScope.nom }', fontSize: 16 },
        			' ',
        			{ text: 'Prenom : ' + '${ sessionScope.prenom }', fontSize: 16 },
        			' ',
        			{ text: 'Sexe : ' + '${ sessionScope.sexe }', fontSize: 16 },
        			' ',
        			{ text: 'Date : ' + '${ sessionScope.date }', fontSize: 16 },
        			' ',
        			{ text: 'Fréquence de déplacement : ' + '${ sessionScope.freq }', fontSize: 16 },
        			' ',
        			{ text: 'Habitude de déplacement : ' + '${ sessionScope.habit }', fontSize: 16 },
        			' ',
        			' ',
        			' ',
        			' ',
        			' ',
        			' ',
        			' ',
        			' ',
        			' ',
        			' ',
        			' ',
        			' ',
        			' ',
        			' ',
        			' ',
        			' ',
        			{ text: 'PGL - Groupe 6', fontSize: 14, alignment: 'center' },
        			{ text: 'CAROFF Anthony & LE BIHAN Tanguy & PAIN Thomas', fontSize: 14, alignment: 'center' },
            		]
            	    };
        	    pdfMake.createPdf(docDefinition).download('trambus_userdata.pdf'); // téléchargement du PDF
        	}
        	</script>
        	<button class=btn onClick="pdf_Generator()">Télécharger vos données</button>
			<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
			<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
        </div>
    </section>   
</body>

</html>
