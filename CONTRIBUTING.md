# Guide de contribution

## Règles générales
- Aucun commit direct n’est autorisé sur la branche `main`.
- Tout développement s’effectue exclusivement sur une branche de type `feature/`.
- Une pull request est obligatoire pour intégrer du code dans `main`.
- Chaque pull request doit être revue et approuvée par au moins un autre développeur.
- Le titre de la pull request doit obligatoirement contenir l’identifiant de la carte Trello correspondante.

## Création d’une branche

1. Partir toujours de la branche `main` à jour :
- git checkout main
- git pull origin main // mettre à jour son projet avec les dernières màj de la branche `main`

Créer une branche nommée selon le format suivant :
- `feature/<titre-carte-trello>`
Exemple : feature/gestion-membres

### Processus de développement

Déplacer la carte Trello correspondante de Backlog vers `En Cours`.
Effectuer les modifications uniquement sur la branche feature/.
Commit avec un message court et précis sur ce qui a été changé/implémenté.

Pousser la branche feature et les avancées vers la branche main:
- `git push -u origin feature/<titre-carte-trello>`

Création de la pull request
Ouvrir une pull request de la branche feature/ vers main.

Titre de la pull request :
[Trello #ID] Description courte de la fonctionnalité
Description : résumé des modifications apportées.
Assigner au moins un reviewer.

Merge

Le merge est réalisé uniquement après validation du code par un reviewer.
Après le merge, la branche feature/ est automatiquement supprimée.
La carte Trello correspondante est déplacée vers Done.

Restrictions
Aucune modification directe sur main.
Aucun `force push` sur main.
Aucune branche autre que feature/ ou main n’est autorisée.
