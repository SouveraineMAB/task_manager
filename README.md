# Task Manager CLI

Task Manager CLI est une application en ligne de commande développée en Dart permettant de gérer des tâches.

#Fonctionnalités

- Ajouter une tâche urgente
- Afficher la liste des tâches
- Marquer une tâche comme terminée
- Supprimer une tâche
- Sauvegarder les données au format JSON

# Structure du projet

- `models` : contient les classes représentant les tâches et les enums.
- `repositories` : gère la manipulation des tâches.
- `services` : contient le service de stockage JSON.
- `exceptions` : contient les exceptions personnalisées.

# Installation

Cloner le projet puis installer les dépendances :

```bash
dart pub get