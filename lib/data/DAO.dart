import 'package:alura_flutter_curso_1/components/tasks.dart';
import 'package:alura_flutter_curso_1/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDAO {
  static String tableSql =
      'CREATE TABLE $_tableName ($_name TEXT, $_difficulty INTEGER, $_image TEXT)';

  static const String _tableName = 'taskTable';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';

  save(Tasks task) async {}

  Future<List<Tasks>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> tasks = await db.query(_tableName);
    return toList(tasks);
  }
  List<Tasks> toList(List<Map<String, dynamic>> listOfMap) {
    final List<Tasks> tasks = [];
    for (Map<String, dynamic> row in listOfMap) {
      final task = Tasks(row[_name], row[_difficulty], row[_image]);
      tasks.add(task);
    }
    return tasks;
  }

  find() async {}
}
