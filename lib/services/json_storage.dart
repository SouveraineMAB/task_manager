import 'dart:convert';
import 'dart:io';
import 'storage.dart';

class JsonStorage implements Storage<Map<String, dynamic>> {
  static const String fileName = "tasks.json";

  @override
  Future<void> save(List<Map<String, dynamic>> items) async {

    try {

      final file = File(fileName);

      await file.writeAsString(
        jsonEncode(items),
      );

    } catch (e) {

      throw Exception(
        "Erreur lors de la sauvegarde des tâches : $e",
      );

    }

  }

  @override
  Future<List<Map<String, dynamic>>> load() async {

    try {

      final file = File(fileName);

      if (!await file.exists()) {
        return [];
      }

      final content = await file.readAsString();

      if (content.isEmpty) {
        return [];
      }

      final List<dynamic> data = jsonDecode(content);

      return data
          .map((item) => Map<String, dynamic>.from(item))
          .toList();

    } catch (e) {

      throw Exception(
        "Erreur lors du chargement des tâches : $e",
      );

    }

  }

}