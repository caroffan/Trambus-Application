package com.forms;


import java.sql.*;
import com.beans.Utilisateur;


public class inscriptionbdd{

	    public int formulaireUtilisateur(Utilisateur utilisateur) throws ClassNotFoundException{
	        String inscription = "INSERT INTO user" + 
	        				"(user_nom, user_prenom, user_sexe, user_date, user_email, user_pswd, user_habit, user_freq)" + 
	                            "VALUES(?, ?, ?, ?, ?, md5(?), ?, ?);";
	        int resultat = 0;

	        Class.forName("org.mariadb.jdbc.Driver");

	        try {
	            Connection connexion = DriverManager.getConnection("jdbc:mariadb://172.24.0.59:3306/trambus", "grp6", "mdp");

	            PreparedStatement preparedStatement = connexion.prepareStatement(inscription);
	           
	            preparedStatement.setString(1, utilisateur.getNom());
	            preparedStatement.setString(2, utilisateur.getPrenom());
	            preparedStatement.setString(3, utilisateur.getSexe());
	            preparedStatement.setString(4, utilisateur.getDate());
	            preparedStatement.setString(5, utilisateur.getEmail());
	            preparedStatement.setString(6, utilisateur.getPswd());
	            preparedStatement.setString(7, utilisateur.getHabitude());
	            preparedStatement.setString(8, utilisateur.getFrequence());

	            System.out.println(preparedStatement);

	            resultat = preparedStatement.executeUpdate();

	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return resultat;

	    }

	 
	}


