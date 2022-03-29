<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*" %>
<%@ page import="com.beans.Utilisateur" %>

<%@ page import ="java.io.IOException"%>
<%@ page import ="java.sql.Connection"%>
<%@ page import ="java.sql.DriverManager"%>
<%@ page import ="java.sql.PreparedStatement"%>
<%@ page import ="java.sql.ResultSet"%>
<%@ page import ="java.sql.SQLException"%>

 
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Projet GPL</title>
    <link href="https://fonts.googleapis.com/css?family=Pinyon+Script|Source+Sans+Pro:300,400,600,700" rel="stylesheet">
    <link rel="stylesheet" href="css/admin.css"> 
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
    <body>
    <section class="home-section">
        <div class="container">
            <div class="block ">
                
        <h1></h1>
        <div class="wrapper">
            <div class="title">
              Admin : ${sessionScope.prenom } ${ sessionScope.nom }
            </div>
            <form method="post">
            <div class="form">
               <div class="inputfield">
                  <label>Adresse Mail</label>
                  <input type="text" class="input" id="user_email" name="user_email" required pattern="[A-Za-z0-9._%+-]+@[a-z0-9.-]+.[a-z]{2,4}$"]>
                  <label>Password</label>
                  <input type="password" class="input" id="user_pswd" name="user_pswd" required pattern="[A-Za-zÀ-ÿ0-9._!?+-]{8,20}"]>
                  <label>Prénom</label>
                  <input type="text" class="input" id="user_prenom" name="user_prenom" required>
                  <label>Nom</label>
                  <input type="text" class="input" id="user_nom" name="user_nom" required>
                  <label>Sexe</label>
                  <input type="text" class="input"id="user_sexe" name="user_sexe" required>
               </div>  
                 
               
                <div class="inputfield">
                  <label>Date</label>
                  <input type="date" class="input"id="user_date" name="user_date" required>
                  <label>fréquence de déplacement :</label>
            		<select id="user_freq" name="user_freq" >
              		<option value="hebdomadaire">hebdomadaire</option>
              		<option value="mensuel">mensuel</option>
              		<option value="periodique">périodique</option>
             	 	<option value="quotidien">quotidien</option>
              		<option value="jamais">jamais</option>
            		</select>
            		<label>Habitude de déplacement :</label>
            		<select id="user_habit"name="user_habit" >
              		<option value="A pied">A pied</option>
              		<option value="En voiture">En voiture</option>
              		<option value="En velo">En vélo</option>
             	 	<option value="Transport en commun">Transports en commun</option>
              		<option value="Autres">Autres</option>
            		</select>
               </div>  
                
                
               
              <button class="btn" type=submit name="button" value="creation">Creer un utilisateur</button>
            </div>
            </form>
        </div>
         </div>
            <div>
            
            	<%String requete = "Select * From user;";
                ResultSet resultSet = null;
                Collection<Utilisateur> utilisateurs = new ArrayList<Utilisateur>();

                try {
        			Class.forName("org.mariadb.jdbc.Driver");
        		} catch (ClassNotFoundException e1) {
        			
        			e1.printStackTrace();
        		}

                try {
                    Connection connexion = DriverManager.getConnection("jdbc:mariadb://172.24.0.59:3306/trambus", "grp6", "mdp");

                    PreparedStatement preparedStatement = connexion.prepareStatement(requete);
                  
                    System.out.println(preparedStatement);

                    resultSet = preparedStatement.executeQuery();
                    
                    while(resultSet.next())
                	{
                    	
                    	Utilisateur utilisateur = new Utilisateur();
                    	utilisateur.setId(resultSet.getInt("user_id"));
                    	utilisateur.setStatut(resultSet.getString("user_status"));
                    	utilisateur.setNom(resultSet.getString("user_nom"));
                        utilisateur.setPrenom(resultSet.getString("user_prenom"));
                        utilisateur.setSexe(resultSet.getString("user_sexe"));
                        utilisateur.setEmail(resultSet.getString("user_email"));
                        utilisateur.setDate(resultSet.getString("user_date"));
                        utilisateur.setPswd(resultSet.getString("user_pswd"));
                        utilisateur.setHabitude(resultSet.getString("user_habit"));
                        utilisateur.setFrequence(resultSet.getString("user_freq"));
                        
                        utilisateurs.add(utilisateur);
                	}
                	//on ferme tout
                	if(resultSet != null)
                	    resultSet.close();
                	if(preparedStatement != null) 
                	preparedStatement.close();

                } catch (SQLException e) {
                    e.printStackTrace();
                } %>
        		
        		<table >
        			<thead>
        				<tr>
            				<th colspan="12">LISTE DES UTILISATEURS</th>
        				</tr>
    				</thead>
    				<tbody>
    					<tr>
    						<th>ID</th>
    						<th>STATUT</th>
    						<th>EMAIL</th>
    						<th>PASSWORD</th>
    						<th>NOM</th>
    						<th>PRENOM</th>
    						<th>SEXE</th>
    						<th>BIRTHDATE</th>
    						<th>HABITUDE DE DEPLACEMENT</th>
    						<th>FREQUENCE DE DEPLACEMENT</th>
    						<th>MODIF STATUT</th>
    						<th>SUPPRIMER</th>
   						</tr>
    				<%for (Utilisateur utilisateur : utilisateurs) { %>
        				<tr>
        					<td><%= utilisateur.getId() %></td>
        					<td><%= utilisateur.getStatut() %></td>
        					<td><%= utilisateur.getEmail() %></td>
        					<td class="hidetext"><%= utilisateur.getPswd() %></td>
        					<td><%= utilisateur.getNom() %></td>
        					<td><%= utilisateur.getPrenom() %></td>
        					<td><%= utilisateur.getSexe() %></td>
            				<td><%= utilisateur.getDate() %></td>
            				<td><%= utilisateur.getHabitude() %></td>
            				<td><%= utilisateur.getFrequence() %></td>
            				<%String id = ""+utilisateur.getId(); 
            				pageContext.setAttribute("id", new Integer(id));%>
            				<td><form method="post">
								<select name="user_status" id="user_status">
									<option value='user' selected>--Choisissez un statut !--</option>
									<option value='user'>user</option>
									<option value='admin'>admin</option>
									<option value='dataScientist'>data scientist</option>
									<option value='suspendu'>data scientist</option>
								</select>
								<button class="trash" type=submit name="button_statut" value=<c:out value="${id}" />>Modifier</button>
								</form>
            				</td>
            				
            				
            				<td><form method="post">
            					<button class="trash" type=submit name="button" value=<c:out value="${id}" />>
									<img class="trash" src=img/trash.png>
								</button>
								</form>
           					</td>
        				</tr>
       				<% } %>
    				</tbody>
        		</table>
        		
    		</div>
               
        </div>
        </div>
        
        
    </section>
	</body>
       

       
    
</html>
