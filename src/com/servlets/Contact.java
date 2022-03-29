package com.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beans.RecupDemande;
import com.forms.demandeScientist;

@WebServlet("/Contact")
public class Contact extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static RecupDemande info = new RecupDemande();
	static demandeScientist save = new demandeScientist();   
   
    public Contact() {
        super();
        
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher("/WEB-INF/contact.jsp").forward(request, response);
	}

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
			HttpSession session = request.getSession();
			info.setJob(request.getParameter("contact_job"));
			info.setEntreprise(request.getParameter("contact_entreprise"));
			info.setMotive(request.getParameter("contact_motive"));
			int user_id = (int) session.getAttribute("id");
			
			
			
			
	        try {
	        	save.formulaireDemande(info, user_id);
				
			} catch (ClassNotFoundException e) {
				
				e.printStackTrace();
			}
			
	        RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
	        dispatcher.forward(request, response);
			
		
		}	
		
		
	
	

}
