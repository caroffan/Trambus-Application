package com.forms;

import java.sql.*;



public class administration {
	
	public int supprimerUtilisateur(String id) throws ClassNotFoundException{
      
		String request = "DELETE FROM user WHERE user_id = ?;";
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
	
	public int supprimerEvaluation(String id) throws ClassNotFoundException{
	      
		String request = "DELETE FROM eval WHERE user_id = ?;";
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
	public int modificationStatut(String statut, String id) throws ClassNotFoundException{
	      
		
        int resultat = 0;

        Class.forName("org.mariadb.jdbc.Driver");

        try {
            Connection connexion = DriverManager.getConnection("jdbc:mariadb://172.24.0.59:3306/trambus", "grp6", "mdp");

            PreparedStatement preparedStatement = connexion.prepareStatement("UPDATE user SET user_status= ? WHERE user_id = ?;");
            
            preparedStatement.setString(1, statut);
            preparedStatement.setString(2, id);
          
            System.out.println(preparedStatement);

            resultat = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultat;

    }
	
	public int supprimerContact(String id) throws ClassNotFoundException{
	      
		String request = "DELETE FROM contact WHERE user_id = ?;";
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
