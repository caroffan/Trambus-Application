package com.forms;

import java.sql.*;
import com.beans.AvisBeans;

public class AvisBDD {
	
	public int ajouterAvis(AvisBeans avis, int user_id) throws ClassNotFoundException{
        String ajoutAvis = "INSERT INTO eval" + 
                            "(eval_ligne, eval_note, eval_comment, eval_alerte, user_id)" + 
                            "VALUES(?, ?, ?, ?, ?);";
        int resultat = 0;

        Class.forName("org.mariadb.jdbc.Driver");

        try {
            Connection connexion = DriverManager.getConnection("jdbc:mariadb://172.24.0.59:3306/trambus", "grp6", "mdp");

            PreparedStatement preparedStatement = connexion.prepareStatement(ajoutAvis);
            preparedStatement.setString(1, avis.getLigne());
            preparedStatement.setString(2, avis.getNote());
            preparedStatement.setString(3, avis.getComment());
            preparedStatement.setString(4, avis.getAlerte());
            preparedStatement.setInt(5, user_id);

            System.out.println(preparedStatement);

            resultat = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultat;

    }
}
