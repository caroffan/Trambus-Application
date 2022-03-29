package com.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.beans.Utilisateur;
import com.forms.administration;
import com.forms.inscriptionbdd;
@WebServlet("/Admin")
public class Admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	   
  
    public Admin() {
        super();
        
    }

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	
    	this.getServletContext().getRequestDispatcher("/WEB-INF/admin.jsp").forward(request, response);
		
		
       
        
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		administration supprimer = new administration();
		inscriptionbdd ajouter = new inscriptionbdd();
		administration modif = new administration();
		
		
		String id = request.getParameter("button");
		String id2 =request.getParameter("button_statut");
		
		if(id != null) {
		
			if (id.equals("creation")) {
				Utilisateur utilisateur = new Utilisateur();
				utilisateur.setNom(request.getParameter("user_nom"));
				utilisateur.setPrenom(request.getParameter("user_prenom"));
				utilisateur.setEmail(request.getParameter("user_email"));
				utilisateur.setDate(request.getParameter("user_date"));
				utilisateur.setFrequence(request.getParameter("user_freq"));
				utilisateur.setHabitude(request.getParameter("user_habit"));
				utilisateur.setPswd(request.getParameter("user_pswd"));
				utilisateur.setSexe(request.getParameter("user_sexe"));
	        
	        
	        
				try {
					ajouter.formulaireUtilisateur(utilisateur);
				} catch (ClassNotFoundException e) {
				
					e.printStackTrace();
				}
			}else {
		
				try {
					supprimer.supprimerEvaluation(id);
				} catch (ClassNotFoundException e) {
			
					e.printStackTrace();
				}
				
				try {
					supprimer.supprimerContact(id);
				} catch (ClassNotFoundException e1) {
					e1.printStackTrace();
				}
		
				try {
					supprimer.supprimerUtilisateur(id);
				} catch (ClassNotFoundException e) {
			
					e.printStackTrace();
				}
			}
		}
		if (id2 != null) {
			if (id2.equals("modif")) {
			}else {
				String statut = request.getParameter("user_status");
				try {
					modif.modificationStatut(statut, id2);
				} catch (ClassNotFoundException e) {
			
					e.printStackTrace();
				}

			}
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/admin.jsp");
        dispatcher.forward(request, response);
	}

}
