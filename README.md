
Task Manager CLI

Description

Task Manager CLI est une application en ligne de commande développée avec Dart permettant de gérer des tâches de manière simple et organisée.

L’application permet de créer des tâches urgentes, de gérer leur priorité, de modifier leur état, de les supprimer et de conserver les données grâce à une sauvegarde persistante au format JSON.

Ce projet met en pratique plusieurs concepts importants de Dart comme la programmation orientée objet, les classes abstraites, l’héritage, les interfaces, les génériques, les exceptions personnalisées et les tests unitaires.

Fonctionnalités

L’application permet de :

* Ajouter une tâche urgente
* Définir une priorité :
    * Low
    * Medium
    * High
* Afficher toutes les tâches
* Trier les tâches par priorité
* Marquer une tâche comme terminée
* Supprimer une tâche
* Rechercher une tâche par son identifiant
* Sauvegarder automatiquement les données
* Charger les tâches au démarrage de l’application
* Gérer les erreurs avec des exceptions personnalisées

Technologies utilisées

* Dart
* Programmation orientée objet (POO)
* JSON pour la persistance des données
* Tests unitaires avec le package test

Concepts Dart utilisés :

* Classes abstraites
* Héritage
* Interfaces
* Classes génériques
* Factory constructors
* Futures et programmation asynchrone
* Gestion des exceptions


Architecture du projet

Le projet utilise une architecture organisée en couches afin de séparer les responsabilités.

task_manager/
├── bin/
│   └── task_manager.dart
│       Point d'entrée de l'application CLI
├── lib/
│   ├── models/
│   │   ├── task.dart
│   │   ├── urgent_task.dart
│   │   ├── priority.dart
│   │   └── task_status.dart
│   │
│   ├── repositories/
│   │   ├── repository.dart
│   │   └── task_repository.dart
│   │
│   ├── services/
│   │   ├── storage.dart
│   │   └── json_storage.dart
│   │
│   └── exceptions/
│       └── task_exception.dart
├── test/
│   └── task_manager_test.dart
├── tasks.json
│   Fichier contenant les données sauvegardées
├── pubspec.yaml
│   Configuration du projet Dart
└── README.md



Installation

1. Cloner le projet

git clone https://github.com/SouveraineMAB/task_manager

2. Aller dans le dossier du projet

cd task_manager

3. Installer les dépendances

dart pub get


Lancer l’application

Pour démarrer l’application :

dart run

Un menu interactif apparaît :

== Gestionnaire de tâches ==
1. Ajouter une tâche
2. Afficher les tâches
3. Marquer une tâche comme terminée
4. Supprimer une tâche
5. Quitter


Exécution des tests

Pour lancer les tests unitaires :

dart test

Les tests couvrent notamment :

* La création d’une tâche urgente
* L’ajout d’une tâche dans le repository
* La suppression d’une tâche
* La modification du statut d’une tâche
* La recherche d’une tâche inexistante
* La conversion JSON des tâches
* La gestion des priorités

Persistance des données

Les données sont sauvegardées automatiquement dans le fichier :

tasks.json

Lors du lancement de l’application :

1. Les tâches existantes sont chargées depuis le fichier JSON.
2. Les nouvelles modifications sont sauvegardées automatiquement.

Cela permet de conserver les tâches même après la fermeture de l’application.


Gestion des erreurs

L’application utilise des exceptions personnalisées pour gérer les situations comme :

* Recherche d’une tâche inexistante
* Entrées utilisateur invalides
* Erreurs de lecture ou d’écriture du fichier JSON


Exemple d’utilisation

Ajouter une tâche :

Titre : Préparer la soutenance
Priorité :
1. Low
2. Medium
3. High
Choix : 3

La tâche est ensuite enregistrée dans tasks.json.

