package com.servlets;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.Utilisateur;
import com.forms.inscriptionbdd;


@WebServlet("/Inscription2")
public class Inscription2 extends HttpServlet {
private static final long serialVersionUID = 1L;

	static Utilisateur utilisateur = new Utilisateur();
	
	static inscriptionbdd formulaire =  new inscriptionbdd();
	
	public static final int TAILLE_TAMPON = 10240;
	
    public Inscription2() {
        super();

    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("").append(request.getContextPath());
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/inscription.jsp");
		dispatcher.forward(request, response);
		
	}

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		 
		 
	        
	        
		//Utilisateur utilisateur = new Utilisateur();
        utilisateur.setNom(request.getParameter("user_nom"));
        utilisateur.setPrenom(request.getParameter("user_prenom"));
        utilisateur.setEmail(request.getParameter("user_email"));
        utilisateur.setDate(request.getParameter("user_date"));
        utilisateur.setFrequence(request.getParameter("user_freq"));
        utilisateur.setHabitude(request.getParameter("user_habit"));
        utilisateur.setPswd(request.getParameter("user_pswd"));
        utilisateur.setSexe(request.getParameter("user_sexe"));
        
        
        
        try {
			formulaire.formulaireUtilisateur(utilisateur);
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		}
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
       
	}
	
}
