# CARE - Club d'Aventures Rôlistiques Ecaussinnois  
## Application de gestion interne

### Description
Application destinée à la gestion opérationnelle du club CARE.  
Elle couvre :
- la gestion des membres
- des rôles du comité
- des tables de jeu
- des maîtres de jeu (MJ)
- des stocks de boissons et snacks
- des ardoises
- des sessions
- du calendrier d'activités.

Le périmètre fonctionnel est strictement limité aux besoins exprimés dans le document d'interview et aux réponses aux questions de clarification PAC.

### Objectifs
- Centraliser la gestion des membres (ordinaires, comité, invités)
- Gérer les droits d'accès par rôles (Secrétaire, Trésorier, Président, Vice-président)
- Suivre les tables de jeu (joueurs, JDR, MJ, absents)
- Assurer le suivi des stocks (quantité, date de péremption, type, prix d'achat, prix de revente, dates d'entrée/sortie, réductions)
- Centraliser les ardoises par personne (consommations + avances repas groupés)
- Gérer les sessions et le calendrier (JDR et jeux de société, sessions multi-années)
- Enregistrer les flux financiers de base (cotisations, subvention communale, achats, ventes)

### Périmètre MVP (Minimum Viable Product)
Le premier livrable se limite exclusivement aux fonctionnalités suivantes :

- Création, modification et liste des membres
- Attribution des rôles par le Président
- Création de tables avec personnes, MJ et absents
- Saisie basique des ardoises et vue du solde centralisé par personne
- Saisie de la quantité et de la date de péremption des stocks

Toute autre fonctionnalité reste hors MVP et sera traitée ultérieurement.

### Équipe
#Ajout des collabs
@jnmvdev

### Structure du dépôt
/
├── README.md
├── CONTRIBUTING.md
├── docs/
└── src/

### Contribution
- Aucun commit direct sur `main`
- Travail exclusivement sur branches `feature/<titre-carte-trello>`
- Pull requests obligatoires vers `main`
- Référence obligatoire de la carte Trello dans le titre de la pull request
- Revue par au moins un autre développeur avant merge

### Suivi
Le backlog et le suivi des tâches sont gérés exclusivement via un board Trello pour le projet.
