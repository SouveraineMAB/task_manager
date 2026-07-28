Task Manager CLI - Dart

Application en ligne de commande de gestion de tâches développée en Dart pur.

Description

Task Manager CLI permet de gérer des tâches depuis un terminal.
L’application utilise les concepts avancés de Dart comme :

* Les classes abstraites
* L’héritage (Task → UrgentTask)
* Les interfaces
* Les génériques (Repository<T>)
* Les exceptions personnalisées
* Les tests unitaires

Fonctionnalités

* Ajouter une tâche
* Définir une priorité (low, medium, high)
* Ajouter une date limite optionnelle
* Afficher toutes les tâches
* Marquer une tâche comme terminée
* Supprimer une tâche
* Sauvegarder les données localement en JSON

Structure du projet

lib/
 ├── models/
 │    ├── task.dart
 │    ├── urgent_task.dart
 │    ├── priority.dart
 │    └── task_status.dart
 │
 ├── repositories/
 │    ├── repository.dart
 │    └── task_repository.dart
 │
 ├── services/
 │    ├── storage.dart
 │    └── json_storage.dart
 │
 └── exceptions/
      └── task_exception.dart
bin/
 └── task_manager.dart
test/
 └── task_manager_test.dart

Installation

Cloner le projet :

git clone https://github.com/votre-utilisateur/task_manager_dart.git

Entrer dans le dossier :

cd task_manager_dart

Installer les dépendances :

dart pub get

Lancer l’application

Pour démarrer l’application CLI :

dart run

Le menu principal permet de :

1. Ajouter une tâche
2. Afficher les tâches
3. Terminer une tâche
4. Supprimer une tâche
5. Quitter

Lancer les tests

Pour exécuter les tests unitaires :

dart test

Les tests vérifient le bon fonctionnement des différentes fonctionnalités de l’application.

Technologies utilisées

* Dart
* Package test
* JSON pour la persistance des données

Auteur

Projet réalisé dans le cadre d’une évaluation Dart CLI.
