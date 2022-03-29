package com.forms;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.beans.Utilisateur;

public class SuspCompte {
	
	public void suspUser(Utilisateur utilisateur) throws ClassNotFoundException{
        String susp = "UPDATE user SET user_status = ? WHERE user_id = ?;";
      

        Class.forName("org.mariadb.jdbc.Driver");

        try {
            Connection connexion = DriverManager.getConnection("jdbc:mariadb://172.24.0.59:3306/trambus", "grp6", "mdp");

            PreparedStatement preparedStatement = connexion.prepareStatement(susp);
           
            preparedStatement.setString(1, "suspendu");
            String id = ""+utilisateur.getId();
            preparedStatement.setString(2, id);

            System.out.println(preparedStatement);

            preparedStatement.executeQuery();

        } catch (SQLException e) {
            e.printStackTrace();
        }
       

    }
}