package com.youtube.filred.servlets;

import java.io.IOException;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.apache.catalina.filters.SetCharacterEncodingFilter;

import com.youtube.filred.beans.Client;
import com.youtube.filred.beans.Commande;
import com.youtube.filred.forms.CreationCommandeForm;

@WebServlet("/creationCommande")
public class CreationCommande extends HttpServlet {
	
	public static final String CHEMIN              = "chemin";
	public static final String VUE_FORM            = "/creerCommande.jsp";
    public static final String VUE_SUCCES          = "/afficherCommande.jsp";
    
    public static final String ATT_COMMANDE        = "commande";
    public static final String ATT_FORM            = "form"; 
    public static final String SESSION_COMMANDES   = "commandes";
    public static final String SESSION_CLIENTS     = "clients";
    
       
	public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
	        
		    /*
             * Lecture du paramètre 'chemin' passé à la servlet via la déclaration
             * dans le web.xml
            */
             String chemin = this.getServletConfig().getInitParameter( CHEMIN );
		
		    /* Préparation de l'objet formulaire */
	        CreationCommandeForm form = new CreationCommandeForm();

	        /* Traitement de la requête et récupération du bean en résultant */
	        Commande commande = form.creerCommande( request, chemin );

	        /* Ajout du bean et de l'objet métier à l'objet requête */
	        request.setAttribute( ATT_COMMANDE, commande );
	        request.setAttribute( ATT_FORM, form );

	        if ( form.getErreurs().isEmpty() ) {
	        	
	        	/* Alors récupération de la map des clients dans la session */
	            HttpSession session = request.getSession();
	            Map<String, Client> clients = (HashMap<String, Client>) session.getAttribute( SESSION_CLIENTS );
	            /* Si aucune map n'existe, alors initialisation d'une nouvelle map */
	            if ( clients == null ) {
	                clients = new HashMap<String, Client>();
	            }
	            /* Puis ajout du client de la commande courante dans la map */
	            clients.put( commande.getClient().getNom(), commande.getClient() );
	            /* Et enfin (ré)enregistrement de la map en session */
	            session.setAttribute( SESSION_CLIENTS, clients );
	 
	            /* Ensuite récupération de la map des commandes dans la session */
	            Map<String, Commande> commandes = (HashMap<String, Commande>) session.getAttribute( SESSION_COMMANDES );
	            /* Si aucune map n'existe, alors initialisation d'une nouvelle map */
	            if ( commandes == null ) {
	                commandes = new HashMap<String, Commande>();
	            }
	            /* Puis ajout de la commande courante dans la map */
	            commandes.put( commande.getDate(), commande );
	            /* Et enfin (ré)enregistrement de la map en session */
	            session.setAttribute( SESSION_COMMANDES, commandes );

	            /* Si aucune erreur, alors affichage de la fiche récapitulative */
	            this.getServletContext().getRequestDispatcher( VUE_SUCCES ).forward( request, response );
	        } else {
	            /* Sinon, ré-affichage du formulaire de création avec les erreurs */
	            this.getServletContext().getRequestDispatcher( VUE_FORM ).forward( request, response );
	        }
	}

}
