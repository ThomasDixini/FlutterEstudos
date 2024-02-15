import 'package:alura_flutter_curso_1/components/tasks.dart';

class TaskDAO {
  static String tableSql = 'CREATE TABLE $_tableName ($_name TEXT, $_difficulty INTEGER, $_image TEXT)';

  static const String _tableName = 'taskTable';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';

  save(Tasks task) async {}
  findAll() async {}
  find() async {}
}