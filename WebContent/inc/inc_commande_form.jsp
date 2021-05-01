<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<label for="dateCommande">Date <span class="requis">*</span></label>
<input type="text" id="v" name="dateCommande" value="<c:out value="${commande.date}"/>" size="30" maxlength="30" disabled />
<span class="erreur">${form.erreurs['dateCommande']}</span>
<br />
                    
<label for="montantCommande">Montant <span class="requis">*</span></label>
<input type="text" id="montantCommande" name="montantCommande" value="<c:out value="${commande.montant}"/>" size="30" maxlength="30" />
<span class="erreur">${form.erreurs['montantCommande']}</span>
<br />
                    
<label for="modePaiementCommande">Mode de paiement <span class="requis">*</span></label>
<input type="text" id="modePaiementCommande" name="modePaiementCommande" value="<c:out value="${commande.modePaiement}"/>" size="30" maxlength="30" />
<span class="erreur">${form.erreurs['modePaiementCommande']}</span>
<br />
                    
<label for="statutPaiementCommande">Statut du paiement</label>
<input type="text" id="statutPaiementCommande" name="statutPaiementCommande" value="<c:out value="${commande.statutPaiement}"/>" size="30" maxlength="30" />
<span class="erreur">${form.erreurs['statutPaiementCommande']}</span>
<br />
                    
<label for="modeLivraisonCommande">Mode de livraison <span class="requis">*</span></label>
<input type="text" id="modeLivraisonCommande" name="modeLivraisonCommande" value="<c:out value="${commande.modeLivraison}"/>" size="30" maxlength="30" />
<span class="erreur">${form.erreurs['modeLivraisonCommande']}</span>
<br />
                    
<label for="statutLivraisonCommande">Statut de la livraison</label>
<input type="text" id="statutLivraisonCommande" name="statutLivraisonCommande" value="<c:out value="${commande.statutLivraison}"/>" size="30" maxlength="30" />
<span class="erreur">${form.erreurs['statutLivraisonCommande']}</span>
<br />               
