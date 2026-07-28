import 'package:task_manager/exception.dart/task_exception.dart';
import 'package:task_manager/repositories/repository.dart';
import 'package:task_manager/models/task.dart';

class TaskRepository implements Repository<Task>{
  final List<Task> _tasks = [];
  @override
  void add (Task item){
    _tasks.add(item);
  }

  @override
  List <Task> getAll (){
    return _tasks;
  }

  @override
  Task ? findById(int id){
    for(Task task in _tasks){
      if(task.id == id){
        return task;
      }
    }

    throw TaskException("Tache non trouvée");
  }

  @override
  void delete(int id){
    _tasks.removeWhere((task) => task.id == id);
  }
}