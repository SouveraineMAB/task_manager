import 'package:task_manager/services/storage.dart';

class JsonStorage implements Storage{
  @override
  void save(){
    print("Données sauvegardées");
  }

  @override
  void load (){
    print("Données chargées");
  }
}