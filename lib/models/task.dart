import 'dart:ffi';

import 'package:task_manager/models/priority.dart';
import 'package:task_manager/models/task_status.dart';

abstract class Task{
  final int id;
  String title;
  Priority priority;
  TaskStatus status;
  DateTime? dueDate;

  Task (
    this.id,
     this.title,
     this.priority,
     this.dueDate,
  ) : status = TaskStatus.pending;
 
 void marquerCommeTerminee (){
  status =TaskStatus.completed;
 }

 String getDetails ();

 Map<String, dynamic > toJson();
}