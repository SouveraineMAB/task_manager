import 'dart:convert';
import 'dart:io';

class JsonStorage {

  final String fileName = "tasks.json";


  void save(List<Map<String, dynamic>> tasks) {

    File file = File(fileName);

    file.writeAsStringSync(
      jsonEncode(tasks),
    );
  }

  List<Map<String, dynamic>> load() {

    File file = File(fileName);


    if (!file.existsSync()) {
      return [];
    }

    String content = file.readAsStringSync();

    List data = jsonDecode(content);

    return List<Map<String, dynamic>>.from(data);
  }
}