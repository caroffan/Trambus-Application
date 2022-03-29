package com.servlets;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import com.forms.NotifBdd;


@WebServlet("/Notif")
public class Notif extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	   
  
    public Notif() {
        super();
        
    }

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	
    	this.getServletContext().getRequestDispatcher("/WEB-INF/notif.jsp").forward(request, response);
		
		
       
        
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		NotifBdd supprimer = new NotifBdd();
		
		String id = request.getParameter("button");
		
		try {
			supprimer.supprimerNotif(id);
		} catch (ClassNotFoundException e) {
	
			e.printStackTrace();
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/notif.jsp");
        dispatcher.forward(request, response);

		
	}
}
