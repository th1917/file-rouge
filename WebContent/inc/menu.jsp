<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="menu">
    <p><a href="<c:url value="/creerClient.jsp"/>"> Créer un nouveau client</a></p>
    <p><a href="<c:url value="/creerCommande.jsp"/>"> Créer une nouvelle commande</a></p>
    <p><a href="<c:url value="/listerClients.jsp"/>"> Voir les clients existants </a></p>
    <p><a href="<c:url value="/listerCommandes.jsp"/>"> Voir les commandes existants</a></p>
</div>
