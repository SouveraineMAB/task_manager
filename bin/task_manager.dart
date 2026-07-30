import 'dart:io';

import 'package:task_manager/models/urgent_task.dart';
import 'package:task_manager/models/priority.dart';
import 'package:task_manager/repositories/task_repository.dart';

Future <void > main() async{
  TaskRepository repository = TaskRepository();
  await repository.initialize();
  bool running = true;

  while (running) {
    print("\n== Gestionnaire de tâches ==");
    print("1. Ajouter une tâche");
    print("2. Afficher les tâches");
    print("3. Marquer une tâche comme terminée");
    print("4. Supprimer une tâche");
    print("5. Quitter");

    stdout.write("Choix : ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case "1":
        ajouterTache(repository);
        break;

      case "2":
        afficherTaches(repository);
        break;

      case "3":
        terminerTache(repository);
        break;

      case "4":
        supprimerTache(repository);
        break;

      case "5":
        running = false;
        print("Fermeture de l'application...");
        break;

      default:
        print("Choix invalide !");
    }
  }
}

// Ajouter une tâche
void ajouterTache(TaskRepository repository) {
  stdout.write("Titre de la tâche : ");
  String title = stdin.readLineSync()!;

  UrgentTask task = UrgentTask(
    DateTime.now().millisecondsSinceEpoch,
    title,
    Priority.high,
    null,
    "Tâche urgente",
  );

  repository.add(task);

  print("Tâche ajoutée avec succès !");
}

// Afficher toutes les tâches
void afficherTaches(TaskRepository repository) {
  List tasks = repository.getAll();

  if (tasks.isEmpty) {
    print("Aucune tâche disponible.");
    return;
  }

  print("\n===== Liste des tâches =====");

  for (var task in tasks) {
    print(task.getDetails());
    print("----------------------------");
  }
}

// Terminer une tâche
void terminerTache(TaskRepository repository) {
  stdout.write("ID de la tâche à terminer : ");

  int id = int.parse(stdin.readLineSync()!);

  var task = repository.findById(id);

  if (task != null) {
    task.marquerCommeTerminee();
    print("Tâche terminée !");
  } else {
    print("Tâche introuvable !");
  }
}

// Supprimer une tâche
void supprimerTache(TaskRepository repository) {
  stdout.write("ID de la tâche à supprimer : ");
  int id = int.parse(stdin.readLineSync()!);
  repository.delete(id);
  print("Tâche supprimée !");
}