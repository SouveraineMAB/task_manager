import 'package:task_manager/models/priority.dart';
import 'package:task_manager/models/task.dart';
import 'package:task_manager/models/task_status.dart';

class UrgentTask extends Task {

  String reason;
  UrgentTask(
    int id,
    String title,
    Priority priority,
    DateTime? dueDate,
    this.reason,
  ) : super(
        id,
        title,
        priority,
        dueDate,
      );

  @override
  Map<String, dynamic> toJson() {

    return {
      "id": id,
      "title": title,
      "priority": priority.name,
      "status": status.name,
      "dueDate": dueDate?.toIso8601String(),
      "reason": reason,
    };

  }

  factory UrgentTask.fromJson(Map<String, dynamic> json) {

    UrgentTask task = UrgentTask(
      json["id"],
      json["title"],
      Priority.values.firstWhere(
        (element) => element.name == json["priority"],
      ),
      json["dueDate"] != null
          ? DateTime.parse(json["dueDate"])
          : null,
      json["reason"],
    );

    task.status = TaskStatus.values.firstWhere(
      (element) => element.name == json["status"],
      orElse: () => TaskStatus.pending,
    );

    return task;

  }

  @override
  String getDetails() {

    return """
Tâche urgente :
Titre : $title
Priorité : ${priority.name}
Statut : ${status.name}
Date limite : ${dueDate ?? "Aucune"}
Raison : $reason
""";

  }

}