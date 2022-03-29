package com.forms;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.beans.Utilisateur;

public class DeleteCompte {
	
	
	public void suppCompte(Utilisateur utilisateur) throws ClassNotFoundException{
        String supression = "DELETE from user WHERE user_id = ?;";
      

        Class.forName("org.mariadb.jdbc.Driver");

        try {
            Connection connexion = DriverManager.getConnection("jdbc:mariadb://172.24.0.59:3306/trambus", "grp6", "mdp");

            PreparedStatement preparedStatement = connexion.prepareStatement(supression);
           
          
            String id = ""+utilisateur.getId();
            preparedStatement.setString(1, id);

            System.out.println(preparedStatement);

            preparedStatement.executeQuery();

        } catch (SQLException e) {
            e.printStackTrace();
        }

		

    }
}

