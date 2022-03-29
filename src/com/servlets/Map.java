package com.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beans.AvisBeans;
import com.forms.*;
@WebServlet("/Map")
public class Map extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	static AvisBDD tableEval = new AvisBDD(); 
    static AvisModifBDD tableModif = new AvisModifBDD();
    
    public Map() {
        super();
       
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String statut = (String)session.getAttribute("statut");
		System.out.println(statut);
		if (statut !=null ) {
			if(statut.equals("suspendu")) {
				this.getServletContext().getRequestDispatcher("/WEB-INF/map1.jsp").forward(request, response);
			}else {
				this.getServletContext().getRequestDispatcher("/WEB-INF/map2.jsp").forward(request, response);
			}
		}else {
		
			this.getServletContext().getRequestDispatcher("/WEB-INF/map1.jsp").forward(request, response);
		}
		
		
		
	}

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AvisForms form = new AvisForms(); 
		form.accuserReception(request);
		request.setAttribute("form", form);//Renvoie les informations sur la map pour que l'utilisateur ai un retour

		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/map2.jsp");
	    dispatcher.forward(request, response);
	    
	    HttpSession session = request.getSession();
	    int user_id = (int) session.getAttribute("id");
	          
	    AvisBeans avis = new AvisBeans();
	    if (request.getParameter("button_avis") != null) {
	    	avis.setLigne(request.getParameter("eval_ligne"));
		    avis.setNote(request.getParameter("eval_note"));
		    avis.setComment(request.getParameter("eval_comment"));
		    avis.setAlerte(request.getParameter("eval_alerte"));
			try {
				tableEval.ajouterAvis(avis, user_id); // envoie de l'évaluation à la BDD
			} catch (ClassNotFoundException e) {
				
				e.printStackTrace();
			}
        }else if (request.getParameter("button_modif") != null) {
        	avis.setLigne(request.getParameter("eval_ligne"));
    		avis.setNote(request.getParameter("eval_note"));
    		try {
    			tableModif.modifierAvis(avis, user_id); // envoie de la modification à la BDD
    		} catch (ClassNotFoundException e) {
    			
    			e.printStackTrace();
    		}
        }
	    
		
		
	}

}
