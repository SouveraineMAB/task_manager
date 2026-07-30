import 'dart:convert';
import 'dart:io';
import 'storage.dart';

class JsonStorage implements Storage<Map<String, dynamic>> {
  final String fileName = "tasks.json";

  @override
  Future<void> save(List<Map<String, dynamic>> items) async {

    final file = File(fileName);

    await file.writeAsString(
      jsonEncode(items),
    );
  }


  @override
  Future<List<Map<String, dynamic>>> load() async {

    final file = File(fileName);

    if (!await file.exists()) {
      return [];
    }


    final content = await file.readAsString();

    final List<dynamic> data = jsonDecode(content);


    return data
        .map((item) => Map<String, dynamic>.from(item))
        .toList();
  }
}