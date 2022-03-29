package com.forms;

import java.sql.*;



import com.beans.Utilisateur;

public class connexionbdd {
	 public boolean verifUser(Utilisateur utilisateur) throws ClassNotFoundException{
	        boolean verif = false;
	   

	        Class.forName("org.mariadb.jdbc.Driver");

	        try {
	            Connection connexion = DriverManager.getConnection("jdbc:mariadb://172.24.0.59:3306/trambus", "grp6", "mdp");

	            PreparedStatement preparedStatement = connexion
	                    .prepareStatement("select * from user where user_email = ? and user_pswd = md5(?) "); {
	                    preparedStatement.setString(1, utilisateur.getEmail());
	                    preparedStatement.setString(2, utilisateur.getPswd());

	                    System.out.println(preparedStatement);
	                    ResultSet rs = preparedStatement.executeQuery();
	                    verif = rs.next()
	                    		;};}

	                     catch (SQLException e) {
	                    // process sql exception
	                    printSQLException(e);
	                }
	        		System.out.println(verif);
	                return verif;
	            }

	 
	 public void recupUser(Utilisateur utilisateur) {
		 try {
	            Connection connexion = DriverManager.getConnection("jdbc:mariadb://172.24.0.59:3306/trambus", "grp6", "mdp");
	            //Utilisateur user = new Utilisateur();
	            PreparedStatement preparedStatement = connexion
	                    .prepareStatement("select * from user where user_email = ? "); {
	                    preparedStatement.setString(1, utilisateur.getEmail());

	                    System.out.println(preparedStatement);
	                    ResultSet rs = preparedStatement.executeQuery();
	                   
		 
	                   while (rs.next()) {
	            	int id = rs.getInt("user_id");
	                String status = rs.getString("user_status");
	                String prenom= rs.getString("user_prenom");
	                String nom = rs.getString("user_nom");
	            	String mail = rs.getString("user_email");
	                String sexe = rs.getString("user_sexe");
	                String date = rs.getString("user_date");
	                String pswd = rs.getString("user_pswd");
	                String frequence = rs.getString("user_freq");
	                String habitude = rs.getString("user_habit");
	                
	                
	                
	                utilisateur.setId(id);
	                utilisateur.setStatut(status);
	                utilisateur.setPrenom(prenom);
	                utilisateur.setNom(nom);
	                utilisateur.setEmail(mail);
	                utilisateur.setSexe(sexe);
	                utilisateur.setDate(date);
	                utilisateur.setPswd(pswd);
	                utilisateur.setFrequence(frequence);
	                utilisateur.setHabitude(habitude);
	                
	                
	                ;};};}
		
	                
	                     catch (SQLException e) {
	                    // process sql exception
	                    printSQLException(e);
	                }
		 
	              
	            }
		 
	
	 
	
	 
	 
	 
	 
	 
	 
	            private void printSQLException(SQLException ex) {
	                for (Throwable e: ex) {
	                    if (e instanceof SQLException) {
	                        e.printStackTrace(System.err);
	                        System.err.println("SQLState: " + ((SQLException) e).getSQLState());
	                        System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
	                        System.err.println("Message: " + e.getMessage());
	                        Throwable t = ex.getCause();
	                        while (t != null) {
	                            System.out.println("Cause: " + t);
	                            t = t.getCause();
	                        }
	                    }
	                }
	               
	            	
	            }

	          
	        
	 
}