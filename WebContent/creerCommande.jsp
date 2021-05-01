<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Création d'une commande</title>
        <link type="text/css" rel="stylesheet" href="<c:url value = "/inc/style.css"/>">
    </head>
    <body>
    	<c:import url="/inc/menu.jsp" />
        <div>
            <form method="post" action="<c:url value = "/creationCommande"/>" enctype="multipart/form-data">
            <fieldset>
                <legend>Informations client</legend>
                
                <%-- Si et seulement si la Map des clients en session n'est pas vide, alors on propose un choix à l'utilisateur --%>
                <c:if test="${ !empty sessionScope.clients }">
                        <label for="choixNouveauClient">Nouveau client ? <span class="requis">*</span></label>
                        <input type="radio" id="choixNouveauClient" name="choixNouveauClient" value="nouveauClient" checked /> Oui
                        <input type="radio" id="choixNouveauClient" name="choixNouveauClient" value="ancienClient" /> Non
                        <br/><br />
                </c:if>
                <c:set var="client" value="${ commande.client }" scope="request" />
                
                <div id="nouveauClient">
                        <c:import url="/inc/inc_client_form.jsp"></c:import>
                </div>
                    
                <%-- Si et seulement si la Map des clients en session n'est pas vide, alors on crée la liste déroulante --%>
                <c:if test="${ !empty sessionScope.clients }">
                    <div id="ancienClient">
                        <select name="listeClients" id="listeClients">
                            <option value="">Choisissez un client...</option>
                            <%-- Boucle sur la map des clients --%>
                            <c:forEach items="${ sessionScope.clients }" var="mapClients">
                            <%--  L'expression EL ${mapClients.value} permet de cibler l'objet Client stocké en tant que valeur dans la Map, 
                                  et on cible ensuite simplement ses propriétés nom et prenom comme on le ferait avec n'importe quel bean. --%>
                            <option value="${ mapClients.value.nom }">${ mapClients.value.prenom } ${ mapClients.value.nom }</option>
                            </c:forEach>
                        </select>
                    </div>
                </c:if>              	
           </fieldset>
           
           <fieldset>
                    <legend>Informations commande</legend>
                    <c:import url="/inc/inc_commande_form.jsp"></c:import> 
           </fieldset>
           
                <p class="info">${form.resultat}</p> 
                <input type="submit" value="Valider"  />
                <input type="reset" value="Remettre à zéro" /> <br />
                
            </form>
        </div>
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script> 
    
        <script src="<c:url value="/inc/jquery.js"/>"></script>
        
        <%-- Petite fonction jQuery permettant le remplacement de la première partie du formulaire par la liste déroulante, au clic sur le bouton radio. --%>
        <script>
        	jQuery(document).ready(function(){
        		/* 1 - Au lancement de la page, on cache le bloc d'éléments du formulaire correspondant aux clients existants */
        		$("div#ancienClient").hide();
        		/* 2 - Au clic sur un des deux boutons radio "choixNouveauClient", on affiche le bloc d'éléments correspondant (nouveau ou ancien client) */
                
        		jQuery('input[name=choixNouveauClient]:radio').click(function(){
                	$("div#nouveauClient").hide();
                	$("div#ancienClient").hide();
                    var divId = jQuery(this).val();
                    $("div#"+divId).show();
                });
        		
            });
        </script>
        
    </body>
</html>