# Règles de Gestion pour la Base de Données d'Au Bon Deal

## Comptes Utilisateurs (Users):

**Création de Compte** :
   - Un compte utilisateur nécessite un nom d'utilisateur (pseudo).
   - Un mot de passe sécurisé, comprenant au moins 8 caractères, maximum 20 caractères, incluant une lettre majuscule, une lettre minuscule, un chiffre et un caractère spécial.
   
**Informations Obligatoires** :
   - Le nom d'utilisateur doit être unique parmi tous les utilisateurs et ne peut être vide.

**Suppression d'Utilisateur** :
   - La suppression d'un utilisateur ne supprime pas ses commandes enregistrées.


<br>

## Produits (Products):

**Informations Produits** :
   - Le nom du produit ne peut être vide.
   - Le prix et la quantité en stock ne peuvent être nuls et doivent être supérieurs ou égaux à zéro.

**Lien avec les Commandes** :
   - La suppression d'un produit n'entraîne pas la suppression des commandes associées.

<br>

## Commandes (Orders):

**Associations Utilisateurs-Commandes** :
   - Chaque commande est liée à un seul compte utilisateur existant.

**Conséquences de la Suppression** :
   - Supprimer une commande ne supprime pas le compte utilisateur associé.

**Validation des Commandes** :
   - Le montant total de la commande et la quantité totale commandée ne peuvent être nuls et doivent être supérieurs à zéro.


