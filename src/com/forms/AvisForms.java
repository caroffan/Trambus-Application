package com.forms;
import javax.servlet.http.HttpServletRequest;

public class AvisForms {
	private String avis;
	
	public void accuserReception( HttpServletRequest request) {
		String ligne = request.getParameter("eval_ligne");
		String note = request.getParameter("eval_note");
		String comm = request.getParameter("eval_comment");
		String alerte = request.getParameter("eval_alerte");
		
		avis = "Votre avis a bien était enregistré, merci.\nVoici un récapitulatif : ligne "+ ligne +", note de " + note + ", commentaires → " + comm + ", message d'alerte → " + alerte + ".";
	}

	public String getAvis() {
		return avis;
	}

	public void setAvis(String avis) {
		this.avis = avis;
	}
}

