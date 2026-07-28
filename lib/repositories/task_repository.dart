import 'package:task_manager/exceptions/task_exception.dart';
import 'package:task_manager/repositories/repository.dart';
import 'package:task_manager/models/task.dart';
import 'package:task_manager/services/json_storage.dart';

class TaskRepository implements Repository<Task>{
  final List<Task> _tasks = [];
  final JsonStorage storage = JsonStorage();
  @override
  void add (Task item){
    _tasks.add(item);

    storage.save(
      _tasks.map((task) =>task.toJson()).toList(),
    );
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

    return null;
  }

  @override
  void delete(int id){
    _tasks.removeWhere((task) => task.id == id);

    storage.save(
      _tasks.map((task) => task.toJson()).toList(),
    );


    storage.save(
      _tasks.map((task) =>task.toJson()).toList(),
    );
  }
}