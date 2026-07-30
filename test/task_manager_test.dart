import 'package:test/test.dart';
import 'package:task_manager/models/urgent_task.dart';
import 'package:task_manager/models/priority.dart';
import 'package:task_manager/models/task_status.dart';
import 'package:task_manager/repositories/task_repository.dart';
import 'package:task_manager/exceptions/task_exception.dart';

void main() {
  group("Tests Task Manager", () {
    test("Création d'une tâche urgente", () {
      UrgentTask task = UrgentTask(
        1,
        "Faire le projet",
        Priority.high,
        DateTime(2026, 8, 1),
        "Deadline proche",
      );
      expect(task.title, "Faire le projet");
      expect(task.priority, Priority.high);
      expect(task.reason, "Deadline proche");

    });

    test("Ajouter une tâche dans le repository", () async {

      TaskRepository repository = TaskRepository();
      UrgentTask task = UrgentTask(
        2,
        "Ajouter une tâche",
        Priority.medium,
        null,
        "Test",
      );

       repository.add(task);
      expect(
        repository.getAll().length,
        1,
      );

    });

    test("Marquer une tâche comme terminée", () {

      UrgentTask task = UrgentTask(
        3,
        "Terminer",
        Priority.low,
        null,
        "Test",
      );

      task.marquerCommeTerminee();
      expect(
        task.status,
        TaskStatus.completed,
      );

    });
    test("Supprimer une tâche du repository", () async {

      TaskRepository repository = TaskRepository();
      UrgentTask task = UrgentTask(
        4,
        "Supprimer",
        Priority.high,
        null,
        "Test",
      );
       repository.add(task);
       repository.delete(4);
      expect(
        repository.getAll().isEmpty,
        true,
      );

    });

    test("Une erreur est levée si une tâche n'existe pas", () {
      TaskRepository repository = TaskRepository();
      expect(
        () => repository.findById(999),
        throwsA(isA<TaskException>()),
      );

    });
    test("Conversion d'une tâche en JSON", () {

    UrgentTask task = UrgentTask(
      5,
      "Tester JSON",
      Priority.medium,
      DateTime(2026, 8, 5),
      "Test JSON",
    );

    Map<String, dynamic> json = task.toJson();

    expect(json["title"], "Tester JSON");
    expect(json["priority"], "medium");
    expect(json["reason"], "Test JSON");

});

test("Trouver une tâche par son identifiant", () {
  TaskRepository repository = TaskRepository();
  UrgentTask task = UrgentTask(
    6,
    "Recherche",
    Priority.low,
    null,
    "Test recherche",
  );

  repository.add(task);
  var result = repository.findById(6);
  expect(result.title, "Recherche");

});

test("Gestion des différentes priorités", () {

  UrgentTask lowTask = UrgentTask(
    7,
    "Tâche faible",
    Priority.low,
    null,
    "Test",
  );

  UrgentTask highTask = UrgentTask(
    8,
    "Tâche urgente",
    Priority.high,
    null,
    "Test",
  );

  expect(lowTask.priority, Priority.low);
  expect(highTask.priority, Priority.high);

});

  });

}