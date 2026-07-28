import 'package:task_manager/models/priority.dart';
import 'package:task_manager/models/task.dart';

class UrgentTask extends Task{
  String reason;

  UrgentTask(
      int id,
     String title,
     Priority priority,
     DateTime ? dueDate,
     this.reason
  ) :super (
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
    "duedate": dueDate?.toIso8601String(),
    "reason": reason,
  };
}

  @override
  String getDetails (){
    return "Tache urgente : $title - priorité : $priority - Raiosn :$reason";
  }
}