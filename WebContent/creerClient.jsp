<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Création d'un client</title>
        <link type="text/css" rel="stylesheet" href="<c:url value = "/inc/style.css"/>">
    </head>
    <body>
     	<c:import url="/inc/menu.jsp" />
        <div>
            <form method="post" action= "<c:url value = "/creationClient"/>" enctype="multipart/form-data">
                <fieldset>
                    <legend>Informations client</legend>
                    
    				<c:import url="/inc/inc_client_form.jsp"></c:import>
                    <p class="info">${form.resultat}</p>
                    <input type="submit" value="Valider"  />
                    <input type="reset" value="Remettre à zéro" /> <br />
                </fieldset>
            </form>
        </div>
    </body>
</html>