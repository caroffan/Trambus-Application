package com.forms;


import java.sql.*;
import com.beans.AvisBeans;



public class AvisModifBDD {
	
	public int modifierAvis(AvisBeans avis, int user_id) throws ClassNotFoundException{
        String modifAvis = "UPDATE eval SET eval_note=? WHERE eval_ligne=? and user_id = ?;";
        int resultat = 0;

        Class.forName("org.mariadb.jdbc.Driver");

        try {
            Connection connexion = DriverManager.getConnection("jdbc:mariadb://172.24.0.59:3306/trambus", "grp6", "mdp");
           
            PreparedStatement preparedStatement = connexion.prepareStatement(modifAvis);
            
           preparedStatement.setString(1, avis.getNote());
           preparedStatement.setString(2, avis.getLigne());
            preparedStatement.setInt(3, user_id);

            System.out.println(preparedStatement);

            resultat = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultat;

    }
}
