package com.forms;

import java.sql.*;


public class NotifBdd {
	public int supprimerNotif(String id) throws ClassNotFoundException{
	      
		String request = "DELETE FROM contact WHERE contact_id = ?;";
        int resultat = 0;

        Class.forName("org.mariadb.jdbc.Driver");

        try {
            Connection connexion = DriverManager.getConnection("jdbc:mariadb://172.24.0.59:3306/trambus", "grp6", "mdp");

            PreparedStatement preparedStatement = connexion.prepareStatement(request);
            
            preparedStatement.setString(1, id);
          
            System.out.println(preparedStatement);

            resultat = preparedStatement.executeUpdate();
            

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultat;

    }
}
