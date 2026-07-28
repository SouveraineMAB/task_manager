
import 'package:test/test.dart';

import 'package:task_manager/models/urgent_task.dart';
import 'package:task_manager/models/priority.dart';
import 'package:task_manager/models/task_status.dart';
import 'package:task_manager/repositories/task_repository.dart';


void main() {

  group("Tests Task Manager", () {


    test("Créer une tâche urgente", () {

      UrgentTask task = UrgentTask(
        1,
        "Faire les tests",
        Priority.high,
        null,
        "Important",
      );

      expect(task.title, "Faire les tests");
      expect(task.priority, Priority.high);

    });



    test("Ajouter une tâche dans le repository", () {

      TaskRepository repository = TaskRepository();

      UrgentTask task = UrgentTask(
        1,
        "Ajouter une tâche",
        Priority.medium,
        null,
        "Urgent",
      );


      repository.add(task);


      expect(repository.getAll().length, 1);

    });



    test("Récupérer une tâche par son id", () {

      TaskRepository repository = TaskRepository();


      UrgentTask task = UrgentTask(
        10,
        "Recherche",
        Priority.low,
        null,
        "Test",
      );


      repository.add(task);


      var result = repository.findById(10);


      expect(result?.title, "Recherche");

    });



    test("Marquer une tâche comme terminée", () {


      UrgentTask task = UrgentTask(
        5,
        "Terminer projet",
        Priority.high,
        null,
        "Deadline",
      );


      task.marquerCommeTerminee();


      expect(task.status, TaskStatus.completed);

    });



    test("Supprimer une tâche", () {


      TaskRepository repository = TaskRepository();


      UrgentTask task = UrgentTask(
        20,
        "Supprimer",
        Priority.medium,
        null,
        "Test",
      );


      repository.add(task);


      repository.delete(20);


      expect(repository.getAll().isEmpty, true);

    });


  });

}