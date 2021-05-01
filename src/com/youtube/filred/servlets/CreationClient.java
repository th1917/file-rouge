package com.youtube.filred.servlets;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.youtube.filred.beans.Client;
import com.youtube.filred.forms.CreationClientForm;

@WebServlet("/creationClient")
public class CreationClient extends HttpServlet {
	
	public static final String CHEMIN          = "chemin";
	public static final String VUE_FORM        = "/creerClient.jsp";
    public static final String VUE_SUCCES      = "/afficherClient.jsp";
    
    public static final String ATT_CLIENT      = "client";
    public static final String ATT_FORM        = "form";
    public static final String SESSION_CLIENTS = "clients";
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 /*
         * Lecture du paramètre 'chemin' passé à la servlet via la déclaration
         * dans le web.xml
         */
        String chemin = this.getServletConfig().getInitParameter( CHEMIN );
		
		/* Préparation de l'objet formulaire */
	     CreationClientForm form = new CreationClientForm();
	     
	    /* Appel au traitement et à la validation de la requête, et récupération du bean en résultant */
	     Client client = form.creerClient( request, chemin );
	     
	    /* Stockage du formulaire et du bean dans l'objet request */
	     request.setAttribute( ATT_FORM, form );
	     request.setAttribute( ATT_CLIENT, client );
	    
	    /* Transmission à la page JSP en charge de l'affichage des données */
	     
	     if(form.getErreurs().isEmpty()) {
	    	 
	    	/* Alors récupération de la map des clients dans la session */
	        HttpSession session = request.getSession();
	        Map<String, Client> clients = (HashMap<String, Client>) session.getAttribute( SESSION_CLIENTS );
	        
	        /* Si aucune map n'existe, alors initialisation d'une nouvelle map */
	        if ( clients == null ) {
	             clients = new HashMap<String, Client>();
	        }
	        /* Puis ajout du client courant dans la map */
	             clients.put( client.getNom(), client );
	        /* Et enfin (ré)enregistrement de la map en session */
	            session.setAttribute( SESSION_CLIENTS, clients );
	            
	    /*Affichage de la fiche recapitulative*/
	    	 this.getServletContext().getRequestDispatcher( VUE_SUCCES ).forward( request, response ); 
	     }else {
	    	 
	    /*Affichage du formumlaire avec les erreurs*/
	    	 this.getServletContext().getRequestDispatcher( VUE_FORM ).forward( request, response );
	     }    
	}
}
