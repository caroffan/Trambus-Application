package com.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.beans.Utilisateur;
import com.forms.connexionbdd;


@WebServlet("/Connexion")
public class Connexion extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static connexionbdd bdd = new connexionbdd();
    static String message ;   
 
    public Connexion() {
        super();

    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher("/WEB-INF/connexion.jsp").forward(request, response);
	}
    
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Utilisateur utilisateur = new Utilisateur();
        
		String email = request.getParameter("user_email");
		String pswd = request.getParameter("user_pswd");
		
		utilisateur.setEmail(email);
        utilisateur.setPswd(pswd);
        
        try {
            if (bdd.verifUser(utilisateur)) {
                HttpSession session = request.getSession();
                session.setAttribute("email",email);
                session.setAttribute("pswd",pswd);
                bdd.recupUser(utilisateur);
                
                session.setAttribute("nom", utilisateur.getNom());
                session.setAttribute("prenom", utilisateur.getPrenom());
                session.setAttribute("email", utilisateur.getEmail());
                session.setAttribute("date", utilisateur.getDate());
                
                session.setAttribute("sexe", utilisateur.getSexe());
                session.setAttribute("habit", utilisateur.getHabitude());
                session.setAttribute("freq", utilisateur.getFrequence());
                session.setAttribute("statut", utilisateur.getStatut());
                session.setAttribute("id", utilisateur.getId());
                
                RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
    	        dispatcher.forward(request, response);
    	        
            } else {
                
                
                
                RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/connexion.jsp");
    	        dispatcher.forward(request, response);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

	
}


