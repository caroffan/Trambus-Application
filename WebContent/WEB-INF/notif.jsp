<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*" %>
<%@ page import="com.beans.RecupDemande" %>

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
    
            <div>
            
            	<%String requete = "Select * From contact;";
                ResultSet resultSet = null;
                Collection<RecupDemande> contacts = new ArrayList<RecupDemande>();

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
                    	
                    	RecupDemande contact = new RecupDemande();
                    	contact.setId(resultSet.getInt("contact_id"));
                    	contact.setJob(resultSet.getString("contact_job"));
                    	contact.setEntreprise(resultSet.getString("contact_entreprise"));
                    	contact.setMotive(resultSet.getString("contact_motive"));
                    	contact.setUserId(resultSet.getInt("user_id"));
                    	
                        
                        contacts.add(contact);
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
            				<th colspan="6">LISTE DES UTILISATEURS</th>
        				</tr>
    				</thead>
    				<tbody>
    					<tr>
    						<th>ID</th>
    						<th>JOB</th>
    						<th>ENTREPRISE</th>
    						<th>MOTIVATION</th>
    						<th>USER_ID</th>
    						<th>SUPPRIMER</th>
    						
   						</tr>
    				<%for (RecupDemande contact : contacts) { %>
        				<tr>
        					<td><%= contact.getId() %></td>
        					<td><%= contact.getJob() %></td>
        					<td><%= contact.getEntreprise() %></td>
        					
        					<td><%= contact.getMotive() %></td>
        					<td><%= contact.getUserId() %></td>
        					
            				<%String id = ""+contact.getId(); 
            				pageContext.setAttribute("id", new Integer(id));%>
            		
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
               
        
        
        
    
	</body>
       

       
    
</html>
