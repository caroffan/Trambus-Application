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
import com.forms.Modifcompte;
import com.forms.SuspCompte;
import com.forms.DeleteCompte;
import com.forms.administration;



@WebServlet("/Profil")
public class Profil extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	static Utilisateur utilisateur = new Utilisateur();

    static Modifcompte formulaire = new Modifcompte();
    
    static DeleteCompte compte = new DeleteCompte();
    
    static administration compte2 = new administration();
    static  SuspCompte susp = new SuspCompte();
	
    public Profil() {
        super();
        
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("").append(request.getContextPath());
		this.getServletContext().getRequestDispatcher("/WEB-INF/profil.jsp").forward(request, response);
		
		HttpSession session= request.getSession();
		
		String nom = (String) session.getAttribute("nom");
		
	     
	     request.setAttribute("nom", nom);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("modifier") != null) {
			HttpSession session = request.getSession();
			utilisateur.setNom(request.getParameter("user_nom"));
	        utilisateur.setPrenom(request.getParameter("user_prenom"));
	        utilisateur.setEmail(request.getParameter("user_email"));
	        String date = request.getParameter("user_date");
	        if (date.equals("")) {
	        	utilisateur.setDate((String)session.getAttribute("date"));
	        }else {
	        	
	        	utilisateur.setDate(date);
	        }
	        utilisateur.setFrequence(request.getParameter("user_freq"));
	        utilisateur.setHabitude(request.getParameter("user_habit"));
	        utilisateur.setPswd(request.getParameter("user_pswd"));
	        utilisateur.setSexe(request.getParameter("user_sexe"));
	        utilisateur.setId((int) session.getAttribute("id"));
	        utilisateur.setStatut((String)session.getAttribute("statut"));
	        
	        
	        session.setAttribute("nom", utilisateur.getNom());
            session.setAttribute("prenom", utilisateur.getPrenom());
            session.setAttribute("email", utilisateur.getEmail());
            session.setAttribute("date", utilisateur.getDate());
            session.setAttribute("pswd", utilisateur.getPswd());
            session.setAttribute("sexe", utilisateur.getSexe());
            session.setAttribute("habit", utilisateur.getHabitude());
            session.setAttribute("freq", utilisateur.getFrequence());
            session.setAttribute("statut", utilisateur.getStatut());
            session.setAttribute("id", utilisateur.getId());
	        try {
				formulaire.formulaireUtilisateur(utilisateur);
			} catch (ClassNotFoundException e) {
				
				e.printStackTrace();
			}
			
			}
			
			
			if(request.getParameter("supprimer") != null) { 
				HttpSession session = request.getSession();
				utilisateur.setNom(request.getParameter("user_nom"));
		        utilisateur.setPrenom(request.getParameter("user_prenom"));
		        utilisateur.setEmail(request.getParameter("user_email"));
		        String date = request.getParameter("user_date");
		        if (date.equals("")) {
		        	utilisateur.setDate((String)session.getAttribute("date"));
		        }else {
		        	
		        	utilisateur.setDate(date);
		        }
		        utilisateur.setFrequence(request.getParameter("user_freq"));
		        utilisateur.setHabitude(request.getParameter("user_habit"));
		        utilisateur.setPswd(request.getParameter("user_pswd"));
		        utilisateur.setSexe(request.getParameter("user_sexe"));
		        utilisateur.setId((int) session.getAttribute("id"));
		        utilisateur.setStatut((String)session.getAttribute("statut"));
				   try {
					   String id =""+ utilisateur.getId() ;
					   	compte2.supprimerEvaluation(id);
					   	compte2.supprimerContact(id);
						compte.suppCompte(utilisateur);
						session.invalidate();
						RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
				        dispatcher.forward(request, response);
						
					} catch (ClassNotFoundException e) {
						
						e.printStackTrace();
					}
					
				
			}
			if(request.getParameter("suspendre") != null) {
				HttpSession session = request.getSession();
				
		        utilisateur.setId((int) session.getAttribute("id"));
		        utilisateur.setStatut((String)session.getAttribute("statut"));
		        try { 
		        	susp.suspUser(utilisateur);
		        	session.invalidate();
					RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
			        dispatcher.forward(request, response);
					
				} catch (ClassNotFoundException e) {
					
					e.printStackTrace();
				}
				
				}

			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/profil.jsp");
	        dispatcher.forward(request, response);
		}


}