package com.forms;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.beans.RecupDemande;

public class demandeScientist {
	public int formulaireDemande(RecupDemande info, int user_id) throws ClassNotFoundException{
        String demande = "INSERT INTO contact" + 
        				"(contact_job, contact_entreprise,contact_motive,user_id)" + 
                            "VALUES(?, ?, ?,?);";
        int resultat = 0;

        Class.forName("org.mariadb.jdbc.Driver");

        try {
            Connection connexion = DriverManager.getConnection("jdbc:mariadb://172.24.0.59:3306/trambus", "grp6", "mdp");

            PreparedStatement preparedStatement = connexion.prepareStatement(demande);
           
            preparedStatement.setString(1, info.getJob());
            preparedStatement.setString(2, info.getEntreprise());
            preparedStatement.setString(3, info.getMotive());
            preparedStatement.setInt(4, user_id);
            
         
            System.out.println(preparedStatement);

            resultat = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultat;

    }


}
