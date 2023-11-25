## Règles de Gestion pour la Base de Données d'Au Bon Deal

Les règles de gestion de la base de données d'Au Bon Deal garantissent la qualité, la cohérence et la sécurité des informations stockées dans le système.

### Comptes Utilisateurs (Users):

1. **Création de Compte** :
   - Un compte utilisateur nécessite un nom d'utilisateur (pseudo).
   - Un mot de passe sécurisé, comprenant au moins 10 caractères, maximum 20 caractères, incluant une lettre majuscule, une lettre minuscule, un chiffre et un caractère spécial.
   
2. **Informations Obligatoires** :
   - Le nom d'utilisateur doit être unique parmi tous les utilisateurs et ne peut être vide.

3. **Suppression d'Utilisateur** :
   - La suppression d'un utilisateur ne supprime pas ses commandes enregistrées.

### Produits (Products):

1. **Informations Produits** :
   - Le nom du produit ne peut être vide.
   - Le prix et la quantité en stock ne peuvent être nuls et doivent être supérieurs ou égaux à zéro.

2. **Lien avec les Commandes** :
   - La suppression d'un produit n'entraîne pas la suppression des commandes associées.

### Commandes (Orders):

1. **Associations Utilisateurs-Commandes** :
   - Chaque commande est liée à un seul compte utilisateur existant.

2. **Validation des Commandes** :
   - Le montant total de la commande et la quantité totale commandée ne peuvent être nuls et doivent être supérieurs à zéro.

3. **Conséquences de la Suppression** :
   - Supprimer une commande ne supprime pas le compte utilisateur associé.
